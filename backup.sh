#!/bin/bash

LOG_BACKUP="/var/log/backuprsync.log"

# Executa o backup com rsync e redireciona saídas normais e erros para o arquivo do log
rsync -az ~/Documentos ~/Downloads ~/.ssh nasbkp:/mnt/znasmga2/backup/bs2/adelso.godoi/backup >> "$LOG_BACKUP" 2>&1
RSYNC_STATUS=$?
echo "Saída status é igual a $RSYNC_STATUS" >> "$LOG_BACKUP"

exit 0

