#!/bin/bash
# Script feito para monitorar o uso do disco e alerta se >= 80%.
# Autor: Carlos Henrique
# Data: Janeiro 2026
# Uso: ./monitor-disco.sh (rode ele com bash ou torne executável com chmod +x)

# Defina o ponto de montagem(filesystem) a ser monitorado(escolhi raiz / por padrão)
DISCO="/"

# Pego a saída do df -h, filtro  linha do disco
USO=$(df -h --output=pcent "$DISCO" | tail -1 | tr -dc '0-9')

# Vereifico se o uso é número(para evitar erros)
if ! [[ "$USO" =~ ^[0-9]+$ ]]; then
 echo "Erro: Não consegui pegar o uso do disco. Verifique o comando df."
 exit 1
fi

# Comparo com 80% e dou o alerta ou informo normal
if [ "$USO" -ge 80 ]; then
 echo "ALERTA! O disco $DISCO está com $USO% de uso - quase cheio! Libere espaço urgente."
else
 echo "O disco $DISCO está com $USO% de uso - tudo ok por enquanto."
fi
