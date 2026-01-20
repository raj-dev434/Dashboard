# Git Submodules Super-Project Setup Guide

## Overview
This guide will help you set up a super-project that manages all your West WP components as Git submodules.

## Prerequisites

### 1. Create GitHub Repositories
You need to create separate GitHub repositories for each component:

- ✅ `Dashboard-admin` (already created: https://github.com/raj-dev434/Dashboard-admin.git)
- [ ] `Dashboard-api` (or similar name)
- [ ] `Dashboard-app` (or similar name)
- [ ] `Dashboard-operations` (or similar name)
- [ ] `Dashboard-project-plan` (or similar name)
- [ ] `Dashboard-status` (or similar name)
- [ ] `West-WP-Main` (super-project repository)

## Step-by-Step Setup

### Phase 1: Push Each Component to Its Repository

#### Admin (Already Done ✅)
```bash
cd "d:\West WP - Main\admin"
git remote add origin https://github.com/raj-dev434/Dashboard-admin.git
git add .
git commit -m "Initial commit: Admin dashboard"
git push -u origin master
```

#### API
```bash
cd "d:\West WP - Main\api"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-api.git
git add .
git commit -m "Initial commit: API"
git push -u origin master
```

#### App
```bash
cd "d:\West WP - Main\app"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-app.git
git add .
git commit -m "Initial commit: App"
git push -u origin master
```

#### Operations
```bash
cd "d:\West WP - Main\operations"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-operations.git
git add .
git commit -m "Initial commit: Operations"
git push -u origin master
```

#### Overall Project Plan
```bash
cd "d:\West WP - Main\overall-project-plan"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-project-plan.git
git add .
git commit -m "Initial commit: Project Plan"
git push -u origin master
```

#### Status
```bash
cd "d:\West WP - Main\status"
git init
git remote add origin https://github.com/raj-dev434/Dashboard-status.git
git add .
git commit -m "Initial commit: Status"
git push -u origin master
```

### Phase 2: Create Super-Project

#### Step 1: Backup Current Directories
```bash
cd "d:\West WP - Main"
# Create a backup folder
mkdir "d:\West-WP-Backup"
# Copy all folders to backup
Copy-Item -Recurse -Path "admin", "api", "app", "operations", "overall-project-plan", "status" -Destination "d:\West-WP-Backup"
```

#### Step 2: Remove Subdirectories from Main Repo
```bash
cd "d:\West WP - Main"
# Remove the folders (they're backed up and pushed to their own repos)
Remove-Item -Recurse -Force admin
Remove-Item -Recurse -Force api
Remove-Item -Recurse -Force app
Remove-Item -Recurse -Force operations
Remove-Item -Recurse -Force overall-project-plan
Remove-Item -Recurse -Force status
```

#### Step 3: Update Main Repository Remote
```bash
cd "d:\West WP - Main"
# Remove old remote if exists
git remote remove origin
# Add new super-project remote
git remote add origin https://github.com/raj-dev434/West-WP-Main.git
```

#### Step 4: Add Submodules
```bash
cd "d:\West WP - Main"

# Add each component as a submodule
git submodule add https://github.com/raj-dev434/Dashboard-admin.git admin
git submodule add https://github.com/raj-dev434/Dashboard-api.git api
git submodule add https://github.com/raj-dev434/Dashboard-app.git app
git submodule add https://github.com/raj-dev434/Dashboard-operations.git operations
git submodule add https://github.com/raj-dev434/Dashboard-project-plan.git overall-project-plan
git submodule add https://github.com/raj-dev434/Dashboard-status.git status
```

#### Step 5: Commit and Push Super-Project
```bash
cd "d:\West WP - Main"
git add .
git commit -m "Initial commit: Add all components as submodules"
git push -u origin master
```

### Phase 3: Initialize Submodules (For Fresh Clones)

When someone clones the super-project, they need to initialize submodules:

```bash
# Clone the super-project
git clone https://github.com/raj-dev434/West-WP-Main.git

# Initialize and update all submodules
cd West-WP-Main
git submodule init
git submodule update

# Or use this one-liner when cloning:
git clone --recurse-submodules https://github.com/raj-dev434/West-WP-Main.git
```

## Working with Submodules

### Update a Submodule
```bash
# Navigate to the submodule
cd "d:\West WP - Main\admin"

# Make changes
# ... edit files ...

# Commit and push in the submodule
git add .
git commit -m "Update admin dashboard"
git push

# Go back to super-project and update the reference
cd "d:\West WP - Main"
git add admin
git commit -m "Update admin submodule reference"
git push
```

### Pull Latest Changes from All Submodules
```bash
cd "d:\West WP - Main"
git submodule update --remote --merge
```

### Update Super-Project with Latest Submodule Commits
```bash
cd "d:\West WP - Main"
git submodule foreach git pull origin master
git add .
git commit -m "Update all submodules to latest"
git push
```

## Benefits of This Approach

✅ **Separation of Concerns**: Each component has its own repository and history  
✅ **Independent Development**: Teams can work on different components independently  
✅ **Version Control**: Super-project tracks specific commits of each submodule  
✅ **Flexible Deployment**: Deploy individual components or the entire project  
✅ **Clean History**: Each component maintains its own commit history  

## Important Notes

⚠️ **Always commit submodule changes first**, then update the super-project  
⚠️ **Remember to push both** the submodule AND the super-project  
⚠️ **Use `git status`** in the super-project to see if submodules have uncommitted changes  

## Quick Reference Commands

```bash
# Check submodule status
git submodule status

# Update all submodules to latest
git submodule update --remote

# Clone with submodules
git clone --recurse-submodules <repo-url>

# Add new submodule
git submodule add <repo-url> <path>

# Remove submodule
git submodule deinit <path>
git rm <path>
```
