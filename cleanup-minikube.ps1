<#
.SYNOPSIS
    Script gỡ bỏ các tài nguyên Kubernetes đã triển khai trên Minikube.
#>

Write-Host "===================================================" -ForegroundColor Cyan
Write-Host "   🗑️ DỌN DẸP TÀI NGUYÊN TRÊN MINIKUBE" -ForegroundColor Cyan
Write-Host "===================================================" -ForegroundColor Cyan

Write-Host "Đang xóa các Deployment, Service, ConfigMap, Secret, PVC..." -ForegroundColor Yellow
kubectl delete -k k8s

Write-Host "`nĐã dọn dẹp xong tài nguyên!" -ForegroundColor Green
Write-Host "Ghi chú: Nếu bạn muốn tắt Minikube hoàn toàn, hãy chạy: minikube stop" -ForegroundColor Gray
Write-Host "===================================================" -ForegroundColor Cyan

