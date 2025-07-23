#!/bin/bash
contador=1
while [ $contador -le 5 ]; do # comando " -le " significa menor ou igual.
    echo "Contagem: $contador"
    ((contador++))  # Incrementa o contador
done


