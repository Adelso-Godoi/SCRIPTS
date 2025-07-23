#!/bin/bash

LOG_BACKUP="/var/log/backuprsync.log"

# Executa o backup com rsync e redireciona saídas normais e erros para o arquivo do log
rsync -az ~/Documentos ~/Downloads ~/.ssh nasbkp:/mnt/znasmga2/backup/bs2/adelso.godoi/backup >> "$LOG_BACKUP" 2>&1
RSYNC_STATUS=$?
echo "Saída status é igual a $RSYNC_STATUS" >> "$LOG_BACKUP"


# Verifica se o comando foi bem-sucedido
#if [[ $RSYNC_STATUS -eq 0 ]]; then
#    echo "$(date) - Backup executado com sucesso!" >> "$LOG_BACKUP"
#ASSUNTO="BACKUP RSYNC CONCLUÍDO"
#CORPO="Backup Rsync concluído com sucesso!! $(date)"
#DESTINO="adelso.godoi@bs2.com.br"
#    echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO
    
#else
#    echo "$(date) - Erro ao executar o backup (código $RSYNC_STATUS)" >> "$LOG_BACKUP"
#ASSUNTO="FALHA NO BACKUP RSYNC"
#CORPO="Backup Rsync deu erro em  $(date)"
#DESTINO="adelso.godoi@bs2.com.br"
#    echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO
    
#fi

exit 0

