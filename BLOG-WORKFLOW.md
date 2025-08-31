# QwertyBits Blog Development Workflow

Complete guide for creating, reviewing, and publishing blog posts using our branch-based development pipeline.

## Quick Start

### 1. Create New Blog Post
```bash
# Create and switch to new blog branch
git checkout -b blog/2025-01-15-your-post-title

# Copy appropriate template
cp _drafts/template-ai-llm.md _posts/2025-01-15-your-post-title.md

# Edit the post
code _posts/2025-01-15-your-post-title.md
```

### 2. Local Development
```bash
# Start local server with live reload
bundle exec jekyll serve --livereload --drafts

# View at http://localhost:4000
# Auto-refreshes as you edit
```

### 3. Commit and Push
```bash
# Add and commit your changes
git add _posts/2025-01-15-your-post-title.md
git commit -m "Add post: Your Post Title"

# Push to trigger CI pipeline
git push -u origin blog/2025-01-15-your-post-title
```

### 4. Create Pull Request
```bash
# Create PR using GitHub CLI
gh pr create --title "New Post: Your Post Title" \
  --body "Ready for review and publication"

# Or create manually on GitHub
```

## Automated Quality Pipeline

When you push to a `blog/*` branch, the following checks run automatically:

### 📝 Blog Post Review Pipeline
- **Structure Validation**: YAML front matter, required fields
- **Content Quality**: Readability analysis, inclusive language check
- **Link Verification**: Markdown links, image references
- **Build Test**: Ensures post integrates correctly
- **Quality Report**: Detailed analysis and metrics

### 🏠 Local Preview
- **Live Preview**: Local Jekyll server with live reload
- **Branch Testing**: Test posts locally before PR
- **GitHub Pages**: Final deployment to production

### 🎨 Brand & Quality Compliance
- **Brand Consistency**: Colors, fonts, component usage
- **Accessibility**: Contrast ratios, semantic structure
- **Site Build**: Jekyll compilation and HTML validation

## Branch Naming Convention

**Format:** `blog/YYYY-MM-DD-post-title`

**Examples:**
```
blog/2025-01-15-exploring-llm-prompt-engineering
blog/2025-01-20-arduino-weather-station-build
blog/2025-01-25-retro-gaming-raspberry-pi-setup
blog/2025-02-01-rust-performance-optimization-tips
```

## Post Requirements

### Required YAML Front Matter
```yaml
---
layout: post
title: "Your Post Title"
date: 2025-01-15 10:00:00 -0000
categories: ai llm machine-learning
tags: [specific, relevant, tags]
description: "Brief description for SEO"
---
```

### Content Guidelines
- **Minimum 300 words** (recommendations for shorter posts)
- **Clear structure** with headings and sections
- **Code examples** properly formatted with syntax highlighting
- **Images** with descriptive alt text
- **Links** to relevant resources and references

### Quality Standards
- **Technical accuracy** - all code and examples work
- **Clear writing** - readable and well-structured
- **Brand consistency** - follows QwertyBits style
- **Inclusive language** - welcoming to all readers

## Review Process

### Automated Checks (Required)
1. ✅ **Structure validation** passes
2. ✅ **Content quality** analysis complete
3. ✅ **Brand compliance** verified
4. ✅ **Site builds** successfully

### Manual Review (Self-Review)
1. 📖 **Content accuracy** - technical details correct
2. 🎯 **Target audience** - appropriate for QwertyBits readers  
3. 📝 **Writing quality** - clear, engaging, well-edited
4. 🔗 **Links and references** - working and relevant
5. 📱 **Local preview** - test with `bundle exec jekyll serve --drafts`

### Approval Criteria
- [ ] All automated checks pass
- [ ] Local preview looks correct
- [ ] Content is ready for publication
- [ ] No major revisions needed

## Publication

### Merge to Main
```bash
# Switch to main and merge
git checkout main
git pull origin main
git merge blog/2025-01-15-your-post-title
git push origin main

# Clean up branch
git branch -d blog/2025-01-15-your-post-title
git push origin --delete blog/2025-01-15-your-post-title
```

### Post-Publication
- 🚀 **Live on qwertybits.io** - automatically deployed via GitHub Pages
- 📈 **Analytics tracking** - Google Analytics captures metrics
- 🔗 **Social sharing** - ready for promotion
- 📡 **RSS feed** - automatically updated

## Templates Available

Choose the appropriate template for your post type:

1. **`template-ai-llm.md`** - AI, LLM, and machine learning posts
2. **`template-embedded.md`** - Arduino, IoT, and hardware projects
3. **`template-retro-computing.md`** - Vintage systems and gaming
4. **`template-coding-adventure.md`** - Programming language deep-dives
5. **`template-tech-tinkering.md`** - General projects and experiments

## Troubleshooting

### CI Failures
- **Structure errors**: Check YAML front matter format
- **Brand violations**: Use CSS variables from brand.css
- **Build failures**: Verify markdown syntax and file paths
- **Link issues**: Ensure all referenced files exist

### Preview Issues
- **Netlify deployment**: Check secrets configuration
- **Preview not updating**: Verify branch name starts with `blog/`
- **Styling problems**: Review brand consistency checks

### Local Development
- **Jekyll errors**: Run `bundle exec jekyll doctor`
- **Missing dependencies**: Run `bundle install`
- **Port conflicts**: Use `bundle exec jekyll serve --port 4001`

## Best Practices

### Writing
- **Start with outline** - plan structure before writing
- **Write drafts** - don't aim for perfection initially  
- **Use active voice** - more engaging and direct
- **Include examples** - concrete illustrations help readers
- **Link to sources** - provide references and further reading

### Technical Content
- **Test all code** - verify examples work as shown
- **Explain assumptions** - don't assume prior knowledge
- **Include screenshots** - visual aids improve comprehension
- **Version specifics** - mention software versions when relevant
- **Error handling** - show common pitfalls and solutions

### SEO & Discoverability
- **Descriptive titles** - clear and search-friendly
- **Good descriptions** - compelling meta descriptions
- **Relevant tags** - help readers find related content
- **Internal links** - connect to other QwertyBits posts
- **External links** - link to authoritative sources

This workflow ensures high-quality, consistent blog posts that maintain QwertyBits' professional standards while streamlining the development and review process.