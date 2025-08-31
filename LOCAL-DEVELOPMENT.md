# Local Development Guide

This guide helps you preview your QwertyBits blog locally before publishing changes to the live site.

## Quick Start

### Windows Users
```bash
# Double-click or run from command prompt
dev-server.bat
```

### Mac/Linux Users  
```bash
# Make executable and run
chmod +x dev-server.sh
./dev-server.sh
```

### Manual Method
```bash
bundle exec jekyll serve --livereload --drafts --port 4000
```

## What You Get

- **Live Preview**: http://localhost:4000
- **Auto-Refresh**: Changes update automatically in browser
- **Draft Posts**: See posts from `_drafts/` folder
- **Incremental Builds**: Faster rebuilds on changes

## Recommended Workflow

### 1. Start Local Server
```bash
./dev-server.sh    # Mac/Linux
dev-server.bat     # Windows
```

### 2. Make Changes
- Edit posts in `_posts/`
- Create drafts in `_drafts/`
- Modify layouts, styles, etc.
- Changes appear instantly at http://localhost:4000

### 3. Quality Check
- ✅ Content displays correctly
- ✅ Navigation works properly  
- ✅ Mobile responsiveness looks good
- ✅ All links work
- ✅ No broken formatting

### 4. Commit & Push
Only after you're satisfied with the local preview:
```bash
git add .
git commit -m "Your changes"
git push
```

### 5. CI Pipeline Runs
- Blog post review (if applicable)
- Accessibility compliance  
- Jekyll build test
- Automatic deployment to qwertybits.io

## Working with Drafts

Create drafts in `_drafts/` folder without dates in filename:

```
_drafts/
├── my-upcoming-post.md
└── another-draft-post.md
```

Drafts are visible in local preview but won't appear on live site until moved to `_posts/` with proper date.

## Troubleshooting

### Ruby/Bundle Not Found
**Windows**: Install from https://rubyinstaller.org/ (include MSYS2)
**Mac**: `brew install ruby`  
**Linux**: `sudo apt install ruby ruby-dev`

### Port 4000 Already in Use
Kill existing Jekyll processes:
```bash
# Find process using port 4000
lsof -ti:4000          # Mac/Linux  
netstat -ano | find "4000"  # Windows

# Kill the process
kill -9 <PID>          # Mac/Linux
taskkill /PID <PID> /F # Windows
```

### Gems Installation Fails
```bash
# Update RubyGems
gem update --system

# Clear gem cache
gem cleanup

# Reinstall dependencies  
bundle clean --force
bundle install
```

### Changes Not Showing
- Hard refresh browser (Ctrl+F5 / Cmd+Shift+R)
- Check terminal for Jekyll errors
- Ensure file is saved
- Check file encoding is UTF-8

## File Structure

```
qwertybits.io/
├── _posts/           # Published blog posts (YYYY-MM-DD-title.md)
├── _drafts/          # Draft posts (title.md)  
├── _layouts/         # Page templates
├── assets/           # CSS, images, etc.
├── dev-server.sh     # Development server (Mac/Linux)
├── dev-server.bat    # Development server (Windows)  
└── LOCAL-DEVELOPMENT.md  # This guide
```

## Tips

- **Live Reload**: Browser refreshes automatically on file changes
- **Multiple Devices**: Access via `http://your-ip:4000` on same network
- **Performance**: Incremental builds are enabled for faster rebuilds
- **Debugging**: Check terminal output for Jekyll error messages

## Next Steps

Once you're happy with local preview:
1. Commit changes
2. Push to trigger CI pipeline
3. Changes go live automatically after CI passes

This workflow ensures you never publish broken or unexpected changes to qwertybits.io!