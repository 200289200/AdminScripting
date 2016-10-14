#!/bin/bash
#Display a listing of all the setuid and setgid of files in /usr

echo "SETUID files in /usr"
echo "____________________"
find /usr -type f -perm -4000 -ls

echo ""

echo "SETGID files in /usr"
echo "____________________"
find /usr -type f -perm -2000 -ls
