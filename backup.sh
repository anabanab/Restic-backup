#!/bin/bash
LOG="/tmp/restic-backup.log"

# Restic Repository och lösenord
export RESTIC_REPO="sftp:anabi@192.168.56.4:/home/anabi/backup"
export RESTIC_PASSWORD="mittSTARKAlösen"

# Logga starttid
echo "Starting backup job at $(date '+%d/%m %H:%M:%S')" >> $LOG

# Kör Restic backup
restic backup /home/anabi >> $LOG 2>&1

# Kontrollera om backupen lyckades
if [ $? -eq 0 ]; then
    result="Backup successful"
else
    result="Backup failed"
fi

# Skriv resultatet till loggfilen
echo "$result at $(date '+%d/%m %H:%M:%S')" >> $LOG

