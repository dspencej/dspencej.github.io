@echo off
REM QwertyBits Local Development Server (Windows)
REM Starts Jekyll with live reload for local previewing

echo 🚀 Starting QwertyBits local development server...
echo 📍 This will be available at: http://localhost:4000
echo 🔄 Live reload enabled - changes will refresh automatically  
echo 📝 Drafts included - posts in _drafts/ folder will be visible
echo.
echo Press Ctrl+C to stop the server
echo ==================================================

REM Check if bundle is available
bundle --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Bundle not found. Installing Ruby dependencies...
    
    REM Check if we have Ruby
    ruby --version >nul 2>&1
    if %errorlevel% neq 0 (
        echo ❌ Ruby not found. Please install Ruby first:
        echo    Download from: https://rubyinstaller.org/
        echo    Make sure to install MSYS2 development toolchain when prompted
        pause
        exit /b 1
    )
    
    REM Install bundler
    gem install bundler
)

REM Install dependencies if needed
if not exist "Gemfile.lock" (
    echo 📦 Installing Jekyll dependencies...
    bundle install
)

REM Start the development server
bundle exec jekyll serve --livereload --drafts --port 4000 --incremental