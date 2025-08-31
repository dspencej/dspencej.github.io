#!/bin/bash

# QwertyBits New Post Creator
# Creates a new blog post with proper branch and template

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 QwertyBits New Post Creator${NC}"
echo "==============================="

# Get post title
read -p "📝 Post title: " title

# Generate filename-friendly version
filename=$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')

# Get current date
date=$(date +"%Y-%m-%d")

# Generate branch name and filename
branch="blog/${date}-${filename}"
post_file="_posts/${date}-${filename}.md"

echo ""
echo -e "${YELLOW}📂 Branch:${NC} $branch"
echo -e "${YELLOW}📄 File:${NC} $post_file"

# Ask for confirmation
read -p "Continue? (y/N): " confirm
if [[ ! $confirm =~ ^[Yy]$ ]]; then
    echo "Cancelled."
    exit 0
fi

# Create and switch to branch
echo ""
echo -e "${GREEN}🌿 Creating branch...${NC}"
git checkout -b "$branch"

# Show available templates
echo ""
echo -e "${BLUE}📋 Available templates:${NC}"
echo "1. AI/LLM/Machine Learning (template-ai-llm.md)"
echo "2. Embedded Systems/Arduino (template-embedded.md)" 
echo "3. Retro Computing/Gaming (template-retro-computing.md)"
echo "4. Programming Deep-Dives (template-coding-adventure.md)"
echo "5. General Tech Projects (template-tech-tinkering.md)"

read -p "Choose template (1-5): " template_choice

# Map choice to template file
case $template_choice in
    1) template="_drafts/template-ai-llm.md";;
    2) template="_drafts/template-embedded.md";;
    3) template="_drafts/template-retro-computing.md";;
    4) template="_drafts/template-coding-adventure.md";;
    5) template="_drafts/template-tech-tinkering.md";;
    *) template="_drafts/template-tech-tinkering.md";;
esac

# Copy template if it exists
if [ -f "$template" ]; then
    echo -e "${GREEN}📋 Copying template...${NC}"
    cp "$template" "$post_file"
    
    # Update the template with actual values
    sed -i.bak "s/Template: .*/\"$title\"/" "$post_file"
    sed -i.bak "s/date: 2025-01-01.*/date: $date 10:00:00 -0000/" "$post_file"
    rm "${post_file}.bak" 2>/dev/null || true
    
else
    # Create basic post if template doesn't exist
    echo -e "${YELLOW}⚠️ Template not found, creating basic post...${NC}"
    cat > "$post_file" << EOF
---
layout: post
title: "$title"
date: $date 10:00:00 -0000
categories: tech
tags: [blog]
description: "Brief description for SEO"
---

# $title

Write your post content here...

## Introduction

## Main Content

## Conclusion
EOF
fi

echo ""
echo -e "${GREEN}✅ Post created successfully!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. 📝 Edit your post: $post_file"
echo "2. 🔍 Preview locally: ./dev-server.sh (or dev-server.bat on Windows)"
echo "3. 🌐 View at: http://localhost:4000"
echo "4. ✅ Quality check your content"
echo "5. 💾 Commit and push when ready"
echo ""
echo -e "${YELLOW}💡 Tip:${NC} Always preview locally before pushing!"

# Ask if user wants to open editor
read -p "Open post in VS Code now? (y/N): " open_editor
if [[ $open_editor =~ ^[Yy]$ ]]; then
    code "$post_file"
fi