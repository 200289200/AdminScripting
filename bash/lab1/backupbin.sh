#!/bin/bash
#Backing up files from bin to the backups folder/directory.

rsync -rtvpl ~/bin/ ~/backups
