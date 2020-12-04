#!/bin/bash

# track all new files, commit changes and push to remote repo on github 
# requires approved ssh key

cd $DOTFILES
git add --all
git commit -a -m "update"
git push
