# Script de Monitoramento de Disco

Esse é um script Bash prático, criado para monitorar o uso do disco e alertar se atingir 80% ou mais.

## Descrição
- **Objetivo**: Verifica porcentagem de uso do disco raiz (/) e emite alerta se >=80%.
- **Versão atual**: Simples, com checagem de erro se uso não for numérico.
- **Ambiente testado**: Fedora 43, Rocky Linux 10, Ubuntu Server 24.04 LTS. Funciona em distro de diferentes bases.

## Código Fonte
Veja [monitor-disco.sh](monitor-disco.sh).

## Como Rodar
1. Baixe o script.
2. Torne executável: `chmod +x monitor-disco.sh`.
3. Rode: `./monitor-disco.sh`.
- Saída exemplo (uso baixo): "O disco / está com 45% de uso — tudo ok por enquanto."
- Saída alerta: "ALERTA! O disco / está com 85% de uso — quase cheio! Libere espaço urgente."

## Evoluções Planejadas
- Adicionar parâmetro para disco personalizado.
- Enviar e-mail de alerta.
- Rodar via cron para monitoramento contínuo.

Vou está aperfeiçoando esse script ao longo do tempo, adicionar mais opções e melhorar suas funções.
