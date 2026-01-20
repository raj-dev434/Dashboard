# Manual Commands to Push Each Service
# Copy and paste these commands one section at a time

# ============================================
# 1. Push API Service
# ============================================
cd "d:\West WP - Main\api"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-api.git
git add .
git commit -m "Initial commit: API service"
git push -u origin master

# ============================================
# 2. Push App Service
# ============================================
cd "d:\West WP - Main\app"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-app.git
git add .
git commit -m "Initial commit: App service"
git push -u origin master

# ============================================
# 3. Push Operations Service
# ============================================
cd "d:\West WP - Main\operations"
# Already has git initialized
git remote add origin https://github.com/raj-dev434/Dashboard-operations.git
git add .
git commit -m "Initial commit: Operations service"
git push -u origin master

# ============================================
# 4. Push Project Plan Service
# ============================================
cd "d:\West WP - Main\overall-project-plan"
# Already has git initialized
git remote add origin https://github.com/raj-dev434/Dashboard-project-plan.git
git add .
git commit -m "Initial commit: Project plan service"
git push -u origin master

# ============================================
# 5. Push Status Service
# ============================================
cd "d:\West WP - Main\status"
# Already has git initialized
git remote add origin https://github.com/raj-dev434/Dashboard-status.git
git add .
git commit -m "Initial commit: Status service"
git push -u origin master

# ============================================
# Return to main directory
# ============================================
cd "d:\West WP - Main"
