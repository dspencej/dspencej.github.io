#!/bin/bash

# QwertyBits Local Development Server
# Starts Jekyll with live reload for local previewing

echo "🚀 Starting QwertyBits local development server..."
echo "📍 This will be available at: http://localhost:4000"
echo "🔄 Live reload enabled - changes will refresh automatically"
echo "📝 Drafts included - posts in _drafts/ folder will be visible"
echo ""
echo "Press Ctrl+C to stop the server"
echo "=================================================="

# Check if bundle is available
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundle not found. Installing Ruby dependencies..."
    
    # Check if we have Ruby
    if ! command -v ruby &> /dev/null; then
        echo "❌ Ruby not found. Please install Ruby first:"
        echo "   Windows: https://rubyinstaller.org/"
        echo "   macOS: brew install ruby"
        echo "   Linux: sudo apt install ruby ruby-dev"
        exit 1
    fi
    
    # Install bundler
    gem install bundler
fi

# Install dependencies if needed
if [ ! -f "Gemfile.lock" ]; then
    echo "📦 Installing Jekyll dependencies..."
    bundle install
fi

# Start the development server
bundle exec jekyll serve \
    --livereload \
    --drafts \
    --port 4000 \
    --host 0.0.0.0 \
    --incremental \
    --open-url