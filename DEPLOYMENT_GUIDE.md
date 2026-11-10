# TÀI LIỆU CHI TIẾT QUY TRÌNH TRIỂN KHAI DỰ ÁN GRABFOOD MINI
*(Bao gồm: Triển khai Kubernetes với Minikube & Triển khai Cloud Production trên Microsoft Azure)*

---

## PHẦN 1: CHI TIẾT TOÀN BỘ CÁC FILE ĐÃ TẠO VÀ CHỈNH SỬA

### 1. Nhóm File Triển Khai Kubernetes / Minikube (Thư mục `k8s/`)

#### 1.1. File `k8s/mysql.yaml` (Cơ sở dữ liệu MySQL 8.0)
* **Mục đích:** Tạo ổ đĩa lưu trữ bền vững và chạy container MySQL 8.0 trong Kubernetes.
* **Các thành phần bên trong:**
  1. **`PersistentVolumeClaim` (`mysql-pvc`):** Xin cấp 2GB ổ cứng ảo (`storage: 2Gi`, chế độ `ReadWriteOnce`) gắn vào thư mục `/var/lib/mysql` để khi Pod MySQL tắt hoặc khởi động lại thì dữ liệu đơn hàng, người dùng không bị mất.
  2. **`Deployment` (`mysql`):**
     * Sử dụng image `mysql:8.0`.
     * Khai báo biến môi trường: `MYSQL_ROOT_PASSWORD: "password"` và `MYSQL_DATABASE: "grabfood_mini"`.
     * **`readinessProbe`:** Chạy lệnh `mysqladmin ping -h localhost -u root -ppassword` mỗi 5 giây để kiểm tra khi nào MySQL thực sự khởi tạo xong bảng hệ thống và sẵn sàng nhận kết nối.
  3. **`Service` (`mysql`):** Mở cổng nội bộ `3306` trong cụm Kubernetes để Backend gọi tới thông qua tên DNS là `mysql`.

#### 1.2. File `k8s/redis.yaml` (Bộ nhớ đệm Redis)
* **Mục đích:** Chạy Redis 7 phục vụ lưu cache lịch sử chat AI và tăng tốc truy vấn.
* **Các thành phần bên trong:**
  1. **`Deployment` (`redis`):** Sử dụng image nhẹ `redis:7-alpine`, mở cổng container `6379`.
  2. **`Service` (`redis`):** Định danh DNS nội bộ tên là `redis` ở cổng `6379`.

#### 1.3. File `k8s/backend.yaml` (Server API Node.js + Express + Socket.IO)
* **Mục đích:** Quản lý cấu hình, khóa bảo mật và vận hành các bản sao (Pods) của Backend.
* **Các thành phần bên trong:**
  1. **`ConfigMap` (`backend-config`):** Chứa các biến môi trường không nhạy cảm:
     * `PORT: "5000"`, `NODE_ENV: "development"`
     * `DB_HOST: "mysql"`, `DB_PORT: "3306"`, `DB_NAME: "grabfood_mini"`, `DB_USER: "root"`
     * `REDIS_HOST: "redis"`, `REDIS_PORT: "6379"`
     * `CLIENT_URL: "http://localhost:3000"`, `AI_PROVIDER: "groq"`, `GROQ_MODEL: "llama-3.1-8b-instant"`
  2. **`Secret` (`backend-secret`):** Chứa các khóa mật bảo mật (`DB_PASSWORD`, `JWT_SECRET`, `JWT_ACCESS_SECRET`, `JWT_REFRESH_SECRET`, `MAIL_USER`, `MAIL_PASS`, `GEMINI_API_KEY`, `GROQ_API_KEY`, `GOOGLE_CLIENT_ID`, `FACEBOOK_APP_ID`...).
  3. **`Deployment` (`backend`):**
     * **`initContainers` (`wait-for-mysql`):** Dùng image `busybox:1.36` chạy vòng lặp `until nc -z mysql 3306; do sleep 3; done;`. Thành phần này bắt buộc Pod Backend phải đứng đợi cho đến khi MySQL khởi động xong 100% và mở cổng 3306 thì mới cho code Node.js chạy (tránh lỗi `ECONNREFUSED`).
     * **`containers` (`backend`):** Dùng image `grab-backend:v1.0` với `imagePullPolicy: IfNotPresent` (lấy image đã build trong máy chứ không tải từ Docker Hub).
     * **`livenessProbe` & `readinessProbe`:** Kiểm tra cổng TCP `5000`. Nếu tiến trình `ts-node-dev` bên trong bị treo không mở cổng 5000, Kubernetes sẽ tự động khởi động lại Pod.
  4. **`Service` (`backend`):** Kiểu `NodePort`, nối cổng `5000` (nodePort `30500`).

#### 1.4. File `k8s/frontend.yaml` (Giao diện React + Vite)
* **Mục đích:** Chạy giao diện web của dự án trên Kubernetes.
* **Các thành phần bên trong:**
  1. **`Deployment` (`frontend`):** Dùng image `grab-frontend:v1.0` (`imagePullPolicy: IfNotPresent`), mở cổng `3000`, truyền các biến `VITE_API_URL`, `VITE_GOOGLE_CLIENT_ID`, `VITE_FACEBOOK_APP_ID`.
  2. **`Service` (`frontend`):** Kiểu `NodePort`, nối cổng `3000` (nodePort `30300`).

#### 1.5. File `k8s/kustomization.yaml` & `k8s/ingress.yaml`
* **`k8s/kustomization.yaml`:** Liệt kê danh sách 4 file (`mysql.yaml`, `redis.yaml`, `backend.yaml`, `frontend.yaml`) để khi chạy lệnh `kubectl apply -k k8s`, Kubernetes sẽ tự động tạo tất cả theo thứ tự.
* **`k8s/ingress.yaml`:** Cấu hình định tuyến tên miền nội bộ `grabfood.local` qua cổng 80.

---

### 2. Nhóm File Triển Khai Cloud Production Trên Microsoft Azure

#### 2.1. File `docker-compose.prod.yml`
* **Mục đích:** Chạy toàn bộ hệ thống trên máy chủ Ubuntu của Azure ở chế độ Production 24/7 (`restart: unless-stopped`).
* **Điểm khác biệt so với `docker-compose.yml` ở máy local:**
  1. Cấu hình MySQL thêm tham số `--character-set-server=utf8mb4` và `--collation-server=utf8mb4_unicode_ci` để hiển thị chuẩn tiếng Việt có dấu.
  2. Cấu hình `CLIENT_URL` của Backend và `VITE_API_URL` của Frontend trỏ thẳng về tên miền HTTPS của Azure: `https://grabfood-mini.indonesiacentral.cloudapp.azure.com`.
  3. Bổ sung biến `VITE_BACKEND_PROXY=http://backend:5000` để Frontend chuyển tiếp các đường dẫn ảnh `/uploads` sang container Backend.
  4. Tích hợp thêm container thứ 5 là **`caddy`** (`caddy:2-alpine`) mở cổng `80` và `443`.

#### 2.2. File `Caddyfile`
* **Mục đích:** Cấu hình Reverse Proxy và tự động xin cấp chứng chỉ bảo mật **SSL/HTTPS** miễn phí (ổ khóa an toàn trên trình duyệt).
* **Nội dung hoạt động:**
  * Mọi truy cập vào `https://grabfood-mini.indonesiacentral.cloudapp.azure.com` ở cổng `443` sẽ được Caddy đón nhận:
    * Nếu đường dẫn bắt đầu bằng `/api/v1/*`, `/socket.io/*`, hoặc `/uploads/*` $\rightarrow$ chuyển tiếp ngầm vào container `backend:5000`.
    * Các đường dẫn giao diện còn lại (`/*`) $\rightarrow$ chuyển tiếp ngầm vào container `frontend:3000`.
  * Nhờ vậy người dùng không cần gõ `:3000` hay `:5000` trên thanh địa chỉ và không bị trình duyệt báo lỗi `Not secure`.

#### 2.3. File `frontend/vite.config.ts` (Chỉnh sửa)
* Thêm cấu hình `allowedHosts: true` trong mục `server` để Vite cho phép tên miền `.cloudapp.azure.com` truy cập vào trang web mà không chặn lỗi `Blocked request. This host is not allowed`.
* Sửa `target` trong `proxy` thành `process.env.VITE_BACKEND_PROXY || 'http://localhost:5000'`.

---

## PHẦN 2: QUY TRÌNH CHI TIẾT TỪNG BƯỚC DEPLOY LÊN MINIKUBE (TRÊN MÁY CÁ NHÂN)

### Bước 1: Khởi động cụm Minikube
Mở **PowerShell** tại thư mục gốc dự án (`V:\Hoc tap\Final Project`):
```powershell
# 1. Bật Minikube chạy trên nền Docker Desktop
minikube start --driver=docker

# 2. Kiểm tra máy chủ ảo (Node) của Minikube đã sẵn sàng chưa
kubectl get nodes
```
*(Kết quả cột `STATUS` hiện chữ `Ready` là hoàn tất Bước 1).*

---

### Bước 2: Đóng gói (Build) Docker Image vào bên trong Minikube
Vì Minikube chạy trong một môi trường độc lập, ta dùng lệnh `minikube image build` để build code Backend và Frontend thẳng vào bên trong Minikube (chú ý dấu chấm đứng trước dấu gạch chéo `./`):

```powershell
# 1. Build image cho Backend (mất khoảng 1-2 phút)
minikube image build -t grab-backend:v1.0 ./backend

# 2. Build image cho Frontend (mất khoảng 1-2 phút)
minikube image build -t grab-frontend:v1.0 ./frontend

# 3. Kiểm tra xem 2 image đã nằm trong Minikube chưa
minikube image ls | Select-String "grab"
```
*(Kết quả hiện ra `docker.io/library/grab-backend:v1.0` và `docker.io/library/grab-frontend:v1.0` là thành công).*

---

### Bước 3: Triển khai các dịch vụ lên Kubernetes
Chạy lệnh đọc file `k8s/kustomization.yaml` để khởi tạo toàn bộ PVC, ConfigMap, Secret, Deployment và Service:
```powershell
kubectl apply -k k8s
```

Theo dõi tiến trình khởi tạo 4 Pod (`mysql`, `redis`, `backend`, `frontend`):
```powershell
kubectl get pods -w
```
* **Cơ chế hoạt động:**
  * Lúc đầu Pod `mysql` sẽ ở trạng thái `0/1 Running` khoảng 30 giây để khởi tạo Database.
  * Cùng lúc đó Pod `backend` sẽ ở trạng thái `Init:0/1` (nhờ `initContainers` đứng chờ MySQL).
  * Ngay khi `mysql` lên `1/1 Running`, `backend` sẽ tự động chuyển sang `Running`.
* Khi thấy cả 4 Pod đều hiện `1/1 Running`, nhấn tổ hợp phím **`Ctrl + C`** để dừng theo dõi.

---

### Bước 4: Nạp dữ liệu gốc từ file `DataBackup.sql` (Không lỗi font tiếng Việt)
> **Lưu ý quan trọng:** Không dùng lệnh `Get-Content DataBackup.sql | kubectl exec` trên Windows PowerShell vì PowerShell sẽ tự ép mã UTF-8 về ASCII làm chữ tiếng Việt bị biến thành dấu `???`.

Cách làm chuẩn (Copy thẳng file vào trong Linux của Pod MySQL rồi nạp trực tiếp với `--default-character-set=utf8mb4`):
```powershell
# 1. Lấy tên Pod MySQL hiện tại lưu vào biến $MYSQL_POD
$MYSQL_POD = (kubectl get pods -l app=mysql -o jsonpath="{.items[0].metadata.name}")

# 2. Copy nguyên bản file DataBackup.sql vào thư mục /tmp bên trong Pod MySQL
kubectl cp DataBackup.sql "${MYSQL_POD}:/tmp/DataBackup.sql"

# 3. Chạy lệnh nạp dữ liệu với bảng mã chuẩn utf8mb4
kubectl exec $MYSQL_POD -- sh -c "mysql -u root -ppassword --default-character-set=utf8mb4 grabfood_mini < /tmp/DataBackup.sql"
```

---

### Bước 5: Mở cổng kết nối (Port-Forward) ra trình duyệt máy thật
Mở **2 cửa sổ PowerShell song song** và giữ nguyên không tắt:
* **Tại cửa sổ PowerShell 1 (Mở cổng 5000 cho Backend):**
  ```powershell
  kubectl port-forward svc/backend 5000:5000
  ```
* **Tại cửa sổ PowerShell 2 (Mở cổng 3000 cho Frontend):**
  ```powershell
  kubectl port-forward svc/frontend 3000:3000
  ```
* Mở trình duyệt truy cập:
  * Giao diện Website: `http://localhost:3000`
  * Kiểm tra API: `http://localhost:5000/api/v1/health`

---

### Bước 6: Các lệnh biểu diễn khi thuyết trình / báo cáo Đồ án
1. **Bật giao diện đồ họa Kubernetes Dashboard:**
   ```powershell
   minikube dashboard
   ```
2. **Demo nhân bản (Scale) từ 1 lên 3 server Backend chạy song song chịu tải:**
   ```powershell
   kubectl scale deployment backend --replicas=3
   kubectl get pods -l app=backend
   ```
3. **Tắt / Xóa khi dùng xong:**
   * Tạm dừng giữ nguyên dữ liệu: `minikube stop`
   * Xóa các Pod/Service để làm lại: `kubectl delete -k k8s`
   * Xóa trắng toàn bộ cụm Minikube: `minikube delete`

---

## PHẦN 3: QUY TRÌNH CHI TIẾT TỪNG BƯỚC DEPLOY LÊN CLOUD MICROSOFT AZURE

### Bước 1: Kích hoạt gói Sinh viên Azure for Students ($100 miễn phí)
1. Truy cập `https://azure.microsoft.com/en-us/free/students/` $\rightarrow$ bấm **Start free**.
2. Đăng nhập và xác thực bằng email sinh viên của trường (`@student.hcmute.edu.vn`).
3. Mở hòm thư sinh viên, bấm vào link xác thực của **Microsoft Academic Verification**.
4. **Xử lý lỗi khi bấm nút Continue báo đỏ (*"We are sorry, we can not process your request right now"*):**
   * Nguyên nhân: Trang chuyển hướng bị kẹt Cookie hoặc bị chặn bởi trình chặn quảng cáo.
   * Cách xử lý: Tắt AdBlock và truy cập thẳng vào link đăng ký gói sinh viên:
     `https://signup.azure.com/studentverification?offerType=1`
5. Điền thông tin hồ sơ (Viết tiếng Việt không dấu, `City: Ho Chi Minh`, `Postal code: 700000`, bỏ trống ô `TIN`), tích đồng ý điều khoản và bấm **Sign up** để nhận **$100 credit dùng trong 365 ngày**.

---

### Bước 2: Tạo Máy chủ ảo Ubuntu (Virtual Machine) trên Azure Portal
1. Vào `https://portal.azure.com`, gõ **`Virtual machines`** lên ô tìm kiếm trên cùng $\rightarrow$ chọn **Virtual machines**.
2. Bấm **`+ Create`** $\rightarrow$ chọn **`Azure virtual machine`**.
3. Điền chi tiết từng ô trong tab **Basics**:
   * **Subscription:** `Azure for Students`
   * **Resource group:** Bấm **Create new** $\rightarrow$ đặt tên **`grabfood-rg`** $\rightarrow$ bấm **OK**.
   * **Virtual machine name:** **`grabfood-server`**
   * **Region:** Chọn vùng nằm trong nhóm **Recommended** của tài khoản, cụ thể là **`(Asia Pacific) Indonesia Central`**.
   * **Availability options:** Đổi từ `Availability zone` sang **`No infrastructure redundancy required`** *(để không bị giới hạn vùng máy chủ)*.
   * **Security type:** Đổi từ `Trusted launch virtual machines` sang **`Standard`** *(để mở khóa các dòng máy giá rẻ B-series cho sinh viên)*.
   * **Image:** **`Ubuntu Server 24.04 LTS - x64 Gen2`**
   * **VM architecture:** **`x64`**
   * **Size:** Bấm vào chữ xanh **`See all sizes`** $\rightarrow$ mở nhóm **`B-Series v2`** $\rightarrow$ chọn dòng **`B2als_v2`** (**2 vCPUs, 4 GiB RAM**, giá `~$31/tháng`) $\rightarrow$ bấm **Select**.
   * **Authentication type:** Tích chọn **`Password`**
     * **Username:** `azureuser`
     * **Password & Confirm password:** `Grabfood@2026!`
   * **Public inbound ports:** Chọn `Allow selected ports`.
   * **Select inbound ports:** Tích chọn đủ 3 cổng: **`SSH (22)`**, **`HTTP (80)`**, **`HTTPS (443)`**.
4. Bấm **`Review + create`** $\rightarrow$ đợi hiện *Validation passed* $\rightarrow$ bấm **`Create`**.
5. Đợi 1–2 phút cho đến khi hiện *Your deployment is complete* $\rightarrow$ bấm **`Go to resource`**.

---

### Bước 3: Lấy IP Public, Mở cổng tường lửa & Đặt tên miền trên Azure
Tại trang quản lý máy chủ `grabfood-server`:
1. **Lấy địa chỉ IP Public:** Nhìn góc phải mục *Networking*, ghi nhận địa chỉ **`Public IP address`** là **`70.153.84.30`**.
2. **Đặt tên miền chữ miễn phí (DNS Name):**
   * Tại mục *Networking*, dòng **`DNS name`**, bấm vào chữ xanh **`Configure`**.
   * Ở ô **`DNS name label`**, nhập **`grabfood-mini`** $\rightarrow$ bấm nút **`Save`** ở góc trên trái.
   * Nhận được tên miền chính thức: **`grabfood-mini.indonesiacentral.cloudapp.azure.com`**.
3. **Mở thêm cổng `3000` và `5000` (Nếu cần truy cập trực tiếp):**
   * Ở menu trái, chọn **`Networking`** $\rightarrow$ **`Network settings`**.
   * Bấm **`+ Create port rule`** $\rightarrow$ **`Inbound port rule`**.
   * Điền **Destination port ranges:** `3000,5000`, **Name:** `Allow-GrabFood-Ports` $\rightarrow$ bấm **Add**.

---

### Bước 4: Kết nối SSH vào Máy chủ Azure & Cài đặt Docker
1. Mở **PowerShell** trên máy tính Windows cá nhân, chạy lệnh kết nối vào máy chủ Azure:
   ```powershell
   ssh azureuser@70.153.84.30
   ```
   * Gõ `yes` khi được hỏi xác nhận vân tay bảo mật lần đầu.
   * Nhập mật khẩu `Grabfood@2026!` rồi nhấn **Enter** *(trên Linux khi gõ mật khẩu màn hình sẽ không hiện ký tự nào)*.
2. Khi đã vào bên trong máy chủ Ubuntu (`azureuser@grabfood-server:~$`), chạy lệnh cài đặt tự động **Docker Engine** và **Docker Compose**:
   ```bash
   curl -fsSL https://get.docker.com | sudo sh && sudo usermod -aG docker $USER && newgrp docker
   ```
3. Kiểm tra bằng lệnh `docker --version` (hiện `Docker version 29.x.x` là thành công).

---

### Bước 5: Đóng gói code ở máy tính cá nhân & Bắn lên Server Azure
1. Mở một cửa sổ **PowerShell ở máy tính Windows** (tại thư mục `V:\Hoc tap\Final Project`), nén toàn bộ code cần thiết (bỏ qua thư mục `node_modules` và `.git` nặng) thành file `grabfood-deploy.tar.gz` (~6MB):
   ```powershell
   tar.exe --exclude="node_modules" --exclude=".git" --exclude="dist" --exclude="grabfood-deploy.tar.gz" -czf grabfood-deploy.tar.gz backend frontend DataBackup.sql docker-compose.prod.yml Caddyfile k8s
   ```
2. Dùng giao thức **SCP** bắn file nén này lên máy chủ Azure (chỉ mất 3 giây):
   ```powershell
   scp grabfood-deploy.tar.gz azureuser@70.153.84.30:~/
   ```
   *(Nhập mật khẩu `Grabfood@2026!` khi được hỏi).*

---

### Bước 6: Giải nén, Khởi chạy 5 Container & Nạp Database trên Server Azure
Quay lại cửa sổ PowerShell đang ở trong **Server Azure (`azureuser@grabfood-server:~$`)**:

1. **Tạo thư mục `grabfood`, giải nén và bật toàn bộ hệ thống bằng Docker Compose:**
   ```bash
   mkdir -p ~/grabfood
   tar -xzf ~/grabfood-deploy.tar.gz -C ~/grabfood
   cd ~/grabfood
   docker compose -f docker-compose.prod.yml up -d --build
   ```
   *(Lệnh này sẽ tự động tải và chạy 5 container: `grabfood_mini_db`, `grabfood_mini_redis`, `grabfood_mini_backend`, `grabfood_mini_frontend`, và `grabfood_mini_caddy`).*

2. **Nạp dữ liệu gốc từ `DataBackup.sql` vào MySQL với chuẩn tiếng Việt `utf8mb4`:**
   ```bash
   docker exec -i grabfood_mini_db mysql -u root -ppassword --default-character-set=utf8mb4 grabfood_mini < ~/grabfood/DataBackup.sql
   ```

3. **Truy cập trang web chính thức (có ổ khóa bảo mật `https://`):**
   * Website: **[https://grabfood-mini.indonesiacentral.cloudapp.azure.com](https://grabfood-mini.indonesiacentral.cloudapp.azure.com)**
   * API Health Check: **[https://grabfood-mini.indonesiacentral.cloudapp.azure.com/api/v1/health](https://grabfood-mini.indonesiacentral.cloudapp.azure.com/api/v1/health)**

---

### Bước 7: Quản lý Chi phí (Tạm dừng hoặc Xóa máy chủ trên Azure)
* **Cách 1 - Tạm dừng (`Stop`) để giữ lại toàn bộ dữ liệu cho buổi Bảo vệ Đồ án:**
  * Vào trang `grabfood-server` trên Azure Portal $\rightarrow$ bấm nút **`Stop`** ở thanh trên cùng $\rightarrow$ tích chọn giữ lại IP $\rightarrow$ bấm **OK**.
  * Khi máy ở trạng thái `Stopped (deallocated)`, Azure ngừng tính tiền CPU/RAM. Đến ngày bảo vệ chỉ cần bấm **`Start`**, đợi 1 phút là toàn bộ trang web tự động chạy lại.
* **Cách 2 - Xóa sạch 100% (`Delete resource group`) khi không dùng nữa:**
  * Bấm vào **`grabfood-rg`** (Resource group) $\rightarrow$ bấm **`Delete resource group`** $\rightarrow$ nhập `grabfood-rg` $\rightarrow$ bấm **Delete**. Toàn bộ máy ảo, ổ cứng, IP và mạng ảo sẽ được xóa sạch hoàn toàn.
