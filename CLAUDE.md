# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a GitHub Pages blog site for QwertyBits (qwertybits.io), a tech blog covering programming, software development, and digital innovations. The site uses Jekyll as the static site generator.

## Architecture

- **Static Site Generator**: Jekyll with GitHub Pages
- **Custom Domain**: qwertybits.io (configured via CNAME file)
- **Theme**: Minima (default GitHub Pages theme)
- **Content Structure**:
  - `_posts/`: Blog posts in Markdown format
  - `_layouts/`: Custom page layouts (if needed)
  - `_includes/`: Reusable components
  - `index.html`: Homepage with custom styling
  - `_config.yml`: Jekyll configuration

## Local Development Setup

### Prerequisites
- Ruby 3.1+ installed
- Bundler gem installed (`gem install bundler`)

### Initial Setup
```bash
# Clone the repository
git clone https://github.com/dspencej/dspencej.github.io.git
cd dspencej.github.io

# Install dependencies
bundle install
```

### Common Development Commands

```bash
# Serve locally with live reload (recommended for development)
bundle exec jekyll serve --livereload --drafts

# Serve locally (basic)
bundle exec jekyll serve

# Build site for testing
bundle exec jekyll build

# Clean build artifacts
bundle exec jekyll clean

# Check for issues
bundle exec jekyll doctor
```

### Development Workflow
1. Create new posts in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Use `_drafts/` folder for work-in-progress posts (shown with `--drafts` flag)
3. Test locally with `bundle exec jekyll serve --livereload`
4. Commit and push when ready - GitHub Actions will test the build

### Content Management

**Creating a new blog post:**
1. Create file in `_posts/` with format: `YYYY-MM-DD-title.md`
2. Include YAML front matter with layout, title, date, categories
3. Write content in Markdown

**Post filename format:** `_posts/YYYY-MM-DD-post-title.md`

**Required front matter:**
```yaml
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD HH:MM:SS -0000
categories: category1 category2
---
```

## Site Configuration

- **Domain**: Custom domain configured in CNAME file (qwertybits.io)
- **SEO**: Jekyll SEO tag plugin enabled
- **Feed**: RSS feed generated via jekyll-feed plugin
- **Sitemap**: Auto-generated via jekyll-sitemap plugin

## Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch. The custom domain (qwertybits.io) is configured via the CNAME file and should be set up in the domain registrar's DNS settings to point to GitHub Pages.

## File Structure Notes

- Main homepage uses custom HTML/CSS (index.html) instead of Jekyll's default
- Jekyll configuration handles blog functionality (_config.yml)
- Posts are written in Markdown with YAML front matter
- Static assets can be placed in root or assets/ directory