#!/bin/bash

echo "========"

git config --global user.name kafi350
git config --global user.eamil kafiabdullahil96@gmail.com
git config --global --add safe.directory /github/workspace

python3 /usr/bin/feed.py

git add -A && git commit -m "update feed"
git push --set-upstream origin master

echo "========="

