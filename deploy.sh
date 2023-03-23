#!/bin/sh

# If a command fails then the deploy stops
set -e

GITHUB_PAGE="conferences"

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Step1: ReBuild the project.
hugo #if using a theme, replace with `hugo -t <YOURTHEME>`



# Step2: File update and coordinate
python3 updateContent.py

cp -R public/ $GITHUB_PAGE

rm -rf public/

cd $GITHUB_PAGE


# Step3: upload local changes onto remote website
git add .

# Commit changes.
msg="rebuilding site $(date)"

if [ -n "$*" ]; then
	msg="$*"
fi

git pull

git commit -m "$msg"

# Push source and build repos.
git push