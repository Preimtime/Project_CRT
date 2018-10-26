#!/bin/bash
git add --all
git commit -m "Thesis $(date '+%Y-%m-%d %H:%M:%S') @ `hostname`" --date "$(date '+%Y-%m-%d %H:%M:%S')"
#git push DropGit master
