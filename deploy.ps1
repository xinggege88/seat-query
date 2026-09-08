# 一键部署到 GitHub Pages
# 用法: 右键 -> 用 PowerShell 运行, 或在终端执行 .\deploy.ps1

$gitCmd = "D:\软件\Program Files\Git\cmd\git.exe"
Set-Location $PSScriptRoot

Write-Host "=============================" -ForegroundColor Cyan
Write-Host "  座位查询 - 一键部署" -ForegroundColor Cyan
Write-Host "=============================" -ForegroundColor Cyan
Write-Host ""

# 检查文件
if (-not (Test-Path "index.html")) {
    Write-Host "[X] index.html 不存在!" -ForegroundColor Red
    Read-Host "按回车退出"
    exit 1
}
if (-not (Test-Path "座位号.xlsx")) {
    Write-Host "[X] 座位号.xlsx 不存在!" -ForegroundColor Red
    Read-Host "按回车退出"
    exit 1
}

Write-Host "[1/4] 添加文件..." -ForegroundColor Yellow
& $gitCmd add -A

Write-Host "[2/4] 提交更改..." -ForegroundColor Yellow
& $gitCmd commit -m "Update: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"

Write-Host "[3/4] 推送到 GitHub..." -ForegroundColor Yellow
& $gitCmd push origin main

Write-Host "[4/4] 完成!" -ForegroundColor Green
Write-Host ""
Write-Host "访问地址: https://xinggege88.github.io/seat-query/" -ForegroundColor Cyan
Write-Host ""
Write-Host "提示: GitHub Pages 可能需要 1-2 分钟生效" -ForegroundColor DarkGray
Read-Host "按回车退出"
