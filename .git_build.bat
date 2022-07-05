@echo off

git add .
git commit -m ""
git archive main --format=zip -o ./releases/release.zip