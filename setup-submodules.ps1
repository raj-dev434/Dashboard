# Script to set up the Dashboard super-project with submodules
# Run this AFTER pushing all individual services

$ErrorActionPreference = "Stop"

$baseDir = "d:\West WP - Main"
$backupDir = "d:\West-WP-Backup"
$superProjectRepo = "https://github.com/raj-dev434/Dashboard.git"

# Define services and their repository URLs
$services = @{
    "admin" = "https://github.com/raj-dev434/Dashboard-admin.git"
    "api" = "https://github.com/raj-dev434/Dashboard-api.git"
    "app" = "https://github.com/raj-dev434/Dashboard-app.git"
    "operations" = "https://github.com/raj-dev434/Dashboard-operations.git"
    "overall-project-plan" = "https://github.com/raj-dev434/Dashboard-project-plan.git"
    "status" = "https://github.com/raj-dev434/Dashboard-status.git"
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Setting Up Dashboard Super-Project" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Create backup
Write-Host "Step 1: Creating backup..." -ForegroundColor Yellow
if (-not (Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir | Out-Null
    Write-Host "  ✓ Backup directory created" -ForegroundColor Green
}

foreach ($service in $services.Keys) {
    $sourcePath = Join-Path $baseDir $service
    $destPath = Join-Path $backupDir $service
    
    if (Test-Path $sourcePath) {
        if (Test-Path $destPath) {
            Remove-Item -Recurse -Force $destPath
        }
        Copy-Item -Recurse -Path $sourcePath -Destination $destPath
        Write-Host "  ✓ Backed up: $service" -ForegroundColor Green
    }
}
Write-Host ""

# Step 2: Remove service directories from main repo
Write-Host "Step 2: Removing service directories..." -ForegroundColor Yellow
Set-Location $baseDir

foreach ($service in $services.Keys) {
    $servicePath = Join-Path $baseDir $service
    if (Test-Path $servicePath) {
        Remove-Item -Recurse -Force $servicePath
        Write-Host "  ✓ Removed: $service" -ForegroundColor Green
    }
}
Write-Host ""

# Step 3: Update main repository remote
Write-Host "Step 3: Configuring super-project repository..." -ForegroundColor Yellow
Set-Location $baseDir

# Remove old remote if exists
$remotes = git remote
if ($remotes -contains "origin") {
    git remote remove origin
    Write-Host "  ✓ Removed old remote" -ForegroundColor Green
}

# Add new super-project remote
git remote add origin $superProjectRepo
Write-Host "  ✓ Added super-project remote" -ForegroundColor Green
Write-Host ""

# Step 4: Add submodules
Write-Host "Step 4: Adding submodules..." -ForegroundColor Yellow
foreach ($service in $services.Keys) {
    $repoUrl = $services[$service]
    Write-Host "  → Adding $service as submodule..." -ForegroundColor Gray
    git submodule add $repoUrl $service
    Write-Host "  ✓ Added: $service" -ForegroundColor Green
}
Write-Host ""

# Step 5: Commit and push super-project
Write-Host "Step 5: Committing super-project..." -ForegroundColor Yellow
git add .
git commit -m "Initial commit: Dashboard super-project with all service submodules"
Write-Host "  ✓ Committed changes" -ForegroundColor Green
Write-Host ""

Write-Host "Step 6: Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin master
Write-Host "  ✓ Pushed to GitHub" -ForegroundColor Green
Write-Host ""

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Super-Project Setup Complete!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Your Dashboard super-project is now set up with submodules:" -ForegroundColor Green
foreach ($service in $services.Keys) {
    Write-Host "  • $service" -ForegroundColor White
}
Write-Host ""
Write-Host "To clone this project elsewhere, use:" -ForegroundColor Yellow
Write-Host "  git clone --recurse-submodules $superProjectRepo" -ForegroundColor White
Write-Host ""
Write-Host "Backup location: $backupDir" -ForegroundColor Gray
