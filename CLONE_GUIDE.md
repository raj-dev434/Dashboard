# Dashboard Project - Clone Guide

## 📥 How to Clone This Project

### Simple Clone
```bash
git clone https://github.com/raj-dev434/Dashboard.git
cd Dashboard
```

That's it! All services are included in one repository.

## 📂 Project Structure

After cloning, you'll have:

```
Dashboard/
├── admin/                    # Admin dashboard service
├── api/                      # Backend API service
├── app/                      # Frontend application
├── auth/                     # Authentication service
├── operations/               # Operations service
├── overall-project-plan/     # Project documentation
└── status/                   # Status monitoring service
```

## 🔄 Keeping Your Clone Updated

### Pull Latest Changes
```bash
git pull origin master
```

### Check Current Status
```bash
git status
```

### View Commit History
```bash
git log --oneline -10
```

## 🛠️ Working with the Project

### Make Changes
```bash
# Make your changes to any files
# Then stage them
git add .

# Commit your changes
git commit -m "Description of your changes"

# Push to GitHub
git push origin master
```

### Create a New Branch
```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name

# Make changes, commit them
git add .
git commit -m "Add new feature"

# Push the branch
git push origin feature/your-feature-name
```

### Switch Between Branches
```bash
# List all branches
git branch -a

# Switch to a branch
git checkout branch-name

# Switch back to master
git checkout master
```

## 🌐 Repository URL

**GitHub Repository:** https://github.com/raj-dev434/Dashboard

**Clone URL (HTTPS):** https://github.com/raj-dev434/Dashboard.git

**Clone URL (SSH):** git@github.com:raj-dev434/Dashboard.git

## 📝 Notes

- This is a **monorepo** - all services are in one repository
- No submodules are used, making it simple to clone and work with
- All services share the same Git history
- Easy to manage dependencies between services

## 🚀 Quick Commands Reference

```bash
# Clone the repository
git clone https://github.com/raj-dev434/Dashboard.git

# Navigate to project
cd Dashboard

# Pull latest changes
git pull

# Check status
git status

# Add all changes
git add .

# Commit changes
git commit -m "Your message"

# Push changes
git push

# View remote info
git remote -v

# View branches
git branch -a
```

## 💡 Tips

1. **Always pull before starting work:** `git pull origin master`
2. **Commit frequently** with meaningful messages
3. **Use branches** for new features or experiments
4. **Push regularly** to backup your work to GitHub
5. **Check status often:** `git status` to see what's changed

## 🆘 Common Issues

### Issue: "Permission denied"
**Solution:** Make sure you're authenticated with GitHub (use SSH keys or personal access token)

### Issue: "Merge conflicts"
**Solution:** 
```bash
# Pull and resolve conflicts
git pull origin master
# Edit conflicting files
git add .
git commit -m "Resolve merge conflicts"
git push
```

### Issue: "Detached HEAD state"
**Solution:**
```bash
git checkout master
```

## 📧 Need Help?

If you encounter any issues, check:
- GitHub repository: https://github.com/raj-dev434/Dashboard
- Git documentation: https://git-scm.com/doc
