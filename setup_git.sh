#!/bin/bash

# GitHub Repository Setup Script
# This script helps you initialize and push your project to GitHub

echo "🚀 Setting up GitHub repository for Weather Forecast App"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install Git first."
    exit 1
fi

# Check if already a git repository
if [ -d .git ]; then
    echo "⚠️  Git repository already initialized"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "📦 Initializing git repository..."
    git init
fi

# Add all files
echo "📝 Adding files to git..."
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo "⚠️  No changes to commit"
else
    echo "💾 Committing files..."
    git commit -m "Initial commit: Hybrid SARIMA-LSTM Weather Forecasting App"
fi

# Check if GitHub CLI is available
if command -v gh &> /dev/null; then
    echo ""
    echo "✅ GitHub CLI detected!"
    read -p "Create repository on GitHub using GitHub CLI? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Repository name (default: weather-forecast-app): " repo_name
        repo_name=${repo_name:-weather-forecast-app}
        
        read -p "Make it private? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            gh repo create "$repo_name" --private --source=. --remote=origin --push
        else
            gh repo create "$repo_name" --public --source=. --remote=origin --push
        fi
        
        echo ""
        echo "✅ Repository created and pushed to GitHub!"
        echo "🌐 View it at: https://github.com/$(gh api user --jq .login)/$repo_name"
    else
        echo ""
        echo "📋 Manual setup required:"
        echo "1. Create repository on GitHub: https://github.com/new"
        echo "2. Run: git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
        echo "3. Run: git branch -M main"
        echo "4. Run: git push -u origin main"
    fi
else
    echo ""
    echo "📋 Manual setup required (GitHub CLI not found):"
    echo "1. Create repository on GitHub: https://github.com/new"
    echo "2. Run: git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
    echo "3. Run: git branch -M main"
    echo "4. Run: git push -u origin main"
    echo ""
    echo "Or install GitHub CLI: https://cli.github.com/"
fi

echo ""
echo "✨ Setup complete!"

