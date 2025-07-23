#!/bin/bash

ARQUIVO_REBOOT="/var/run/reboot-required"
LOGFILE="/var/log/atualiza_sistema.log"

# Verificar se o arquivo existe
 
if [ -f "$ARQUIVO_REBOOT" ]; then
  
    echo "Reboot necessário. Reiniciando o sistema agora em $(date) através do SCRIPT DE REBOOT " >>  "$LOGFILE"
    
    ASSUNTO="REINICIALIZAÇÃO DO DESKTOP BS2"
    CORPO="ATENÇÃO!

Sua máquina será REINICIADA agora, porque a atualização solicitou REBOOT. Verifique se tudo está OK.

$(date)"

    DESTINO="adelso.godoi@bs2.com.br,adelsogodoi@outlook.com"
    echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO

   sudo reboot
fi
