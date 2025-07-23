#!/bin/bash

# Função que retorna um valor
somar() {
    local resultado=$(( $1 + $2 ))  # Soma dois números
    return $resultado
}

# Chamando a função
somar 5 3

# Capturando o retorno da função
echo "A soma de 5 e 3 é: $?"

