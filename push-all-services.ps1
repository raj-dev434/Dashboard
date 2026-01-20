# Script to push all services to their respective repositories
# Make sure you've created all repositories on GitHub first!

$ErrorActionPreference = "Stop"

# Define services and their repository URLs
$services = @{
    "admin" = "https://github.com/raj-dev434/Dashboard-admin.git"
    "api" = "https://github.com/raj-dev434/Dashboard-api.git"
    "app" = "https://github.com/raj-dev434/Dashboard-app.git"
    "operations" = "https://github.com/raj-dev434/Dashboard-operations.git"
    "overall-project-plan" = "https://github.com/raj-dev434/Dashboard-project-plan.git"
    "status" = "https://github.com/raj-dev434/Dashboard-status.git"
}

$baseDir = "d:\West WP - Main"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Pushing All Services to GitHub" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

foreach ($service in $services.Keys) {
    $servicePath = Join-Path $baseDir $service
    $repoUrl = $services[$service]
    
    Write-Host "Processing: $service" -ForegroundColor Yellow
    Write-Host "Path: $servicePath" -ForegroundColor Gray
    Write-Host "Repository: $repoUrl" -ForegroundColor Gray
    
    if (Test-Path $servicePath) {
        Set-Location $servicePath
        
        # Initialize git if not already initialized
        if (-not (Test-Path ".git")) {
            Write-Host "  → Initializing Git..." -ForegroundColor Green
            git init
        }
        
        # Check if remote exists, if not add it
        $remotes = git remote
        if ($remotes -notcontains "origin") {
            Write-Host "  → Adding remote origin..." -ForegroundColor Green
            git remote add origin $repoUrl
        } else {
            Write-Host "  → Updating remote origin..." -ForegroundColor Green
            git remote set-url origin $repoUrl
        }
        
        # Add all files
        Write-Host "  → Adding files..." -ForegroundColor Green
        git add .
        
        # Check if there are changes to commit
        $status = git status --porcelain
        if ($status) {
            Write-Host "  → Committing changes..." -ForegroundColor Green
            git commit -m "Initial commit: $service service"
        } else {
            Write-Host "  → No changes to commit" -ForegroundColor Gray
        }
        
        # Push to remote
        Write-Host "  → Pushing to GitHub..." -ForegroundColor Green
        try {
            git push -u origin master 2>&1 | Out-Null
            Write-Host "  ✓ Successfully pushed $service" -ForegroundColor Green
        } catch {
            Write-Host "  ✗ Failed to push $service" -ForegroundColor Red
            Write-Host "    Error: $_" -ForegroundColor Red
        }
        
        Write-Host ""
    } else {
        Write-Host "  ✗ Directory not found: $servicePath" -ForegroundColor Red
        Write-Host ""
    }
}

# Return to base directory
Set-Location $baseDir

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "All services processed!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Verify all repositories on GitHub" -ForegroundColor White
Write-Host "2. Run the setup-submodules.ps1 script to create the super-project" -ForegroundColor White
