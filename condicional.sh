#!/bin/bash
echo "Digite sua idade:"
read idade #comando "read" armazena a captura da entrada do usuário no terminal na variável "idade".

if [ "$idade" -ge 18 ]; then #O " -ge " é um operador de shellscript, Que representa " maior ou igual".
    echo "Você é maior de idade."
else
    echo "Você é menor de idade."
fi

