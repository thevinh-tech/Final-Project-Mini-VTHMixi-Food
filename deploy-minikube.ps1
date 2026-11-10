<#
.SYNOPSIS
    Script tự động triển khai dự án lên Minikube.
#>

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "   🚀 BẮT ĐẦU TRIỂN KHAI LÊN MINIKUBE" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

# 1. Kiểm tra Minikube
Write-Host "`n[1/4] Kiểm tra trạng thái Minikube..." -ForegroundColor Yellow
$status = minikube status --format='{{.Host}}' 2>$null
if ($status -ne "Running") {
    Write-Host "Minikube chưa chạy. Đang khởi động Minikube (driver=docker)..." -ForegroundColor Yellow
    minikube start --driver=docker
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Lỗi: Không thể khởi động Minikube!" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Minikube đã đang chạy." -ForegroundColor Green
}

# 2. Build Docker images trực tiếp vào Minikube
Write-Host "`n[2/4] Build Docker images vào Minikube..." -ForegroundColor Yellow
Write-Host "- Đang build grabfood-backend:latest..." -ForegroundColor Gray
minikube image build -t grabfood-backend:latest ./backend
if ($LASTEXITCODE -ne 0) {
    Write-Host "Lỗi khi build Backend image!" -ForegroundColor Red
    exit 1
}

Write-Host "- Đang build grabfood-frontend:latest..." -ForegroundColor Gray
minikube image build -t grabfood-frontend:latest ./frontend
if ($LASTEXITCODE -ne 0) {
    Write-Host "Lỗi khi build Frontend image!" -ForegroundColor Red
    exit 1
}
Write-Host "Đã build xong các Docker image thành công!" -ForegroundColor Green

# 3. Apply manifests vào Kubernetes
Write-Host "`n[3/4] Áp dụng các file cấu hình Kubernetes..." -ForegroundColor Yellow
kubectl apply -k k8s
if ($LASTEXITCODE -ne 0) {
    Write-Host "Lỗi khi apply manifests!" -ForegroundColor Red
    exit 1
}

# 4. Chờ các pod sẵn sàng
Write-Host "`n[4/4] Đang chờ các Pod khởi động..." -ForegroundColor Yellow
kubectl wait --for=condition=ready pod -l app=mysql --timeout=120s
kubectl wait --for=condition=ready pod -l app=redis --timeout=60s
kubectl wait --for=condition=ready pod -l app=backend --timeout=120s
kubectl wait --for=condition=ready pod -l app=frontend --timeout=120s

Write-Host "`n===================================================" -ForegroundColor Green
Write-Host "   🎉 TRIỂN KHAI THÀNH CÔNG!" -ForegroundColor Green
Write-Host "===================================================" -ForegroundColor Green
Write-Host "Danh sách các Pod hiện tại:" -ForegroundColor Cyan
kubectl get pods

Write-Host "`nĐể truy cập ứng dụng trên trình duyệt máy bạn, hãy mở 2 terminal và chạy:" -ForegroundColor Yellow
Write-Host "  Terminal 1: kubectl port-forward svc/frontend 3000:3000" -ForegroundColor White
Write-Host "  Terminal 2: kubectl port-forward svc/backend 5000:5000" -ForegroundColor White
Write-Host "`nSau đó mở trình duyệt:" -ForegroundColor Yellow
Write-Host "  👉 Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host "  👉 Backend API: http://localhost:5000/api/v1" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Green

