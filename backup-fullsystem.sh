#!/bin/bash
tar -zvcpf /backups/fullbackup-`date +"%s-%F"`.tar.gz  --exclude=/etc/network/interfaces --exclude=/etc/machine-id --exclude=/etc/network/interfaces --exclude=/etc/udev/rules.d/70-persistent-net.rules  --exclude=/backups --exclude=/proc --exclude=/run --exclude=/etc/network/interfaces --one-file-system /  2> /backups/err.log  1> /backups/backup.log
