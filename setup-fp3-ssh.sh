#!/bin/sh

set -e

ssh fp3.home 'mkdir -p ~/proj'
rsync -avz --delete . fp3.home:proj/treeup
ssh fp3.home 'cd ~/proj/treeup; ./setup-fp3.sh'

