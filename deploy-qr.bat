@echo off
chcp 65001 >nul
echo ========================================
echo   QR CODE GENERATOR - Deploy
echo ========================================
echo.

set REPO_NAME=qr-code-gen
set GITHUB_USER=DemosLady

echo Step 1: Preparing files...
if exist qr-code-generator.html (
    copy /Y qr-code-generator.html index.html >nul
    echo    index.html ready
)

echo Step 2: Initializing git...
if not exist .git (
    git init
    git branch -M main
    git remote add origin https://github.com/%GITHUB_USER%/%REPO_NAME%.git
) else (
    echo    Git already initialized
)

echo Step 3: Committing...
git add .
git commit -m "QR Code Generator - free custom QR codes"

echo Step 4: Pushing to GitHub...
git push -u origin main --force

echo.
echo ========================================
echo   DONE!
echo   URL: https://%REPO_NAME%.vercel.app/
echo ========================================
pause
