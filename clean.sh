#! /bin/bash

find . -mindepth 1 -maxdepth 1 -type d -not -name ".git" -print | sudo xargs rm -rfv
