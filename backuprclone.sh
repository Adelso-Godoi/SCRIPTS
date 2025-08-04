#!/bin/bash

LOG_RCLONE="/var/log/backuprclone.log"
rclone sync ~/backup/ drive-adelso:/arquivos-backup/  >> "$LOG_RCLONE"  2>&1 
STATUS=$?

if [[ $STATUS -eq 0 ]]; then
    echo "Backup Rclone concluído com sucesso!! $(date)" >> "$LOG_RCLONE"
    
ASSUNTO="BACKUP RCLONE CONCLUÍDO"
CORPO="Backup Rclone concluído com sucesso!! $(date)"
DESTINO="exemplo@exemplo.com.br"
    echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO 


else
   echo "Erro de backup em $(date)" >> "$LOG_RCLONE"

ASSUNTO="FALHA NO BACKUP RCLONE"
CORPO="Backup Rclone deu erro em $(date)"
DESTINO="exemplo@exemplo.com.br"
   echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO

fi	

exit 0

