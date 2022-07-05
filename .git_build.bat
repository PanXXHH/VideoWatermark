@echo off

git add .
git commit -m "commit"
git archive main --format=zip -o ./releases/release.zip