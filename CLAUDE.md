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

## Common Development Commands

### Local Development
```bash
# Install dependencies
bundle install

# Serve locally (requires Ruby/Jekyll)
bundle exec jekyll serve

# Build site
bundle exec jekyll build

# Clean build artifacts
bundle exec jekyll clean
```

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