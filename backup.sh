#!/usr/bin/env bash

DATE=`date +%Y-%m-%d`

tar czvf backup-$DATE.tar.gz world/
mv backup-$DATE.tar.gz ../backups/
