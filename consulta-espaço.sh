#!/bin/zsh


LOGFILE="/var/log/atualiza_sistema.log"

TAMANHO_ARQ=$(du -m "$LOGFILE" | cut -f1 )

if (( TAMANHO_ARQ >= 1500 && TAMANHO_ARQ <= 1505 )); then
ASSUNTO="ATENÇÃO !!! ARQUIVO DE LOG QUASE NO LIMITE "
CORPO="ATENÇÃO, seu arquivo de LOG \"$LOGFILE\", está com 1.5GB, logo chegará no limite e será excluído todos os DADOS!!!

$(date)"

DESTINO="exemplo@exemplo.com.br,exemplo2@exemplo2.com.br"
        echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO
fi


if [[ $TAMANHO_ARQ -ge 1600 ]]; then

#if [[ $(stat -c%s "$LOGFILE") -ge 2147483648 ]]; then
    truncate -s 0 "$LOGFILE"
fi

# Se o arquivo foi limpo e está com 0 bytes, registrar no log
if [[ $(stat -c%s "$LOGFILE") -le 0 ]]; then

	echo "Arquivo limpo em $(date)" >> "$LOGFILE"
ASSUNTO="LIMPEZA DO LOG - ATUALIZAÇÃO DO SISTEMA"
CORPO="Arquivo de log da atualização do sistema foi LIMPO em $(date)"
DESTINO="exemplo@exemplo.com.br,exemplo2@exemplo2.com.br"
	echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp $DESTINO
else
	# Registrar o tamanho atual do arquivo
	TAMANHO_BYTES=$(stat -c %s "$LOGFILE")
	TAMANHO_LEGIVEL=$(numfmt --to=iec-i --suffix=B "$TAMANHO_BYTES")

	echo "Arquivo com $TAMANHO_LEGIVEL de espaço em $(date)" >> "$LOGFILE"

fi


