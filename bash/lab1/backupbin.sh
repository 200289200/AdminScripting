#!/bin/bash
#Backing up files from bin to the backups folder/directory.

rsync -zvr ~/AdminScripting/bin/ ~/AdminScripting/bin/bash/lab1/backups/bindump
