#!/bin/bash

free -hm > ~/Projects/backups/freemem/free_mem.txt
sudo du -ch > ~/Projects/backups/diskuse/disk_usage.txt
lsof > ~/Projects/backups/openlist/open_list.txt
df -ha > ~/Projects/backups/freedisk/free_disk.txt


