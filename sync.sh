#!/bin/bash

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

cd /app

TOKEN="$GIT_TOKEN"
REPO="$GIT_REPO"
BRANCH="main"

git pull origin $BRANCH

if [ -n "$(git status --porcelain music)" ]; then
  git add music
  git commit -m "Auto-sync music: $(date '+%Y-%m-%d %H:%M:%S')"
  git push https://${TOKEN}@github.com/${REPO}.git $BRANCH
else
  echo "No changes to sync at $(date)"
fi
