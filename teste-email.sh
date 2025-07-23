#!/bin/bash

# Definindo o endereço do destinatário
DESTINATARIO="adelso.godoi@bs2.com.br"

# Definindo o assunto e o corpo do e-mail
ASSUNTO="Teste de envio com o echo no script"
CORPO="Olá, Adelso\n\nEsse é um teste de envio de e-mail em $(date)."

# Usando o echo para enviar o e-mail com msmtp
echo -e "Subject: $ASSUNTO\n\n$CORPO" | msmtp  $DESTINATARIO

echo "E-mail enviado com sucesso para $DESTINATARIO"

