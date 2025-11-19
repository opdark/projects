#!/bin/bash

###############################################################################
# GitHub Deployment Script
# This script initializes a git repository and pushes to GitHub
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Repository details
REPO_URL="https://github.com/opdark/projects.git"
BRANCH="main"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   GitHub Deployment Script${NC}"
echo -e "${BLUE}========================================${NC}\n"

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install git first.${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Git is installed"

# Check if we're in a git repository
if [ -d .git ]; then
    echo -e "${YELLOW}⚠️  Git repository already exists${NC}"
    echo -e "${YELLOW}   This script will add and commit changes${NC}\n"
else
    echo -e "${BLUE}📦 Initializing new git repository...${NC}"
    git init
    echo -e "${GREEN}✓${NC} Repository initialized\n"
fi

# Add all files
echo -e "${BLUE}📝 Adding files to git...${NC}"
git add .

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo -e "${YELLOW}⚠️  No changes to commit${NC}"
else
    # Commit changes
    echo -e "${BLUE}💾 Committing changes...${NC}"
    git commit -m "Add interactive project timeline dashboard

- Interactive Gantt chart with clickable projects
- Detailed project and milestone tracking
- Standalone and JSON-based versions
- Responsive design for all devices
- Complete documentation and setup instructions"
    echo -e "${GREEN}✓${NC} Changes committed\n"
fi

# Check if remote exists
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}⚠️  Remote 'origin' already exists${NC}"
    echo -e "${BLUE}   Current remote URL: $(git remote get-url origin)${NC}\n"
    
    # Ask if user wants to update the remote
    read -p "Do you want to update the remote URL? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git remote set-url origin "$REPO_URL"
        echo -e "${GREEN}✓${NC} Remote URL updated\n"
    fi
else
    echo -e "${BLUE}🔗 Adding remote repository...${NC}"
    git remote add origin "$REPO_URL"
    echo -e "${GREEN}✓${NC} Remote added: $REPO_URL\n"
fi

# Check current branch and rename if necessary
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
    echo -e "${BLUE}🔀 Renaming branch to '$BRANCH'...${NC}"
    git branch -M "$BRANCH"
    echo -e "${GREEN}✓${NC} Branch renamed\n"
fi

# Push to GitHub
echo -e "${BLUE}🚀 Pushing to GitHub...${NC}"
echo -e "${YELLOW}   You may need to enter your GitHub credentials${NC}\n"

if git push -u origin "$BRANCH"; then
    echo -e "\n${GREEN}========================================${NC}"
    echo -e "${GREEN}   ✓ Successfully deployed to GitHub!${NC}"
    echo -e "${GREEN}========================================${NC}\n"
    
    echo -e "${BLUE}📍 Repository URL:${NC}"
    echo -e "   $REPO_URL\n"
    
    echo -e "${BLUE}🌐 To enable GitHub Pages:${NC}"
    echo -e "   1. Go to: https://github.com/opdark/projects/settings/pages"
    echo -e "   2. Under 'Source', select 'Deploy from a branch'"
    echo -e "   3. Select branch: '$BRANCH' and folder: '/ (root)'"
    echo -e "   4. Click 'Save'"
    echo -e "   5. Your site will be live at: ${GREEN}https://opdark.github.io/projects/${NC}\n"
    
    echo -e "${BLUE}📚 Next steps:${NC}"
    echo -e "   • Visit your repository to see the files"
    echo -e "   • Enable GitHub Pages for live hosting"
    echo -e "   • Share the link with your team\n"
else
    echo -e "\n${RED}========================================${NC}"
    echo -e "${RED}   ❌ Push failed${NC}"
    echo -e "${RED}========================================${NC}\n"
    
    echo -e "${YELLOW}Common issues and solutions:${NC}\n"
    echo -e "1. ${YELLOW}Authentication failed:${NC}"
    echo -e "   • Use a Personal Access Token instead of password"
    echo -e "   • Generate one at: https://github.com/settings/tokens\n"
    
    echo -e "2. ${YELLOW}Repository doesn't exist:${NC}"
    echo -e "   • Create it at: https://github.com/new"
    echo -e "   • Repository name: projects"
    echo -e "   • Set as public"
    echo -e "   • Don't initialize with README\n"
    
    echo -e "3. ${YELLOW}Permission denied:${NC}"
    echo -e "   • Check you have write access to the repository"
    echo -e "   • Verify your GitHub username\n"
    
    echo -e "${BLUE}Manual push command:${NC}"
    echo -e "   git push -u origin $BRANCH\n"
    
    exit 1
fi
