# Diagnóstico e Testes de Rede 🔍

Aqui os comandos para testar conectividade, latência, DNS etc. Se usa muito para troubleshooting.

## ping - Testar conectividade
- **O que faz**: Envia pacotes ICMP para verificar se host responde.
- **Exemplo**: `ping google.com` ou `ping -c 4 8.8.8.8`

  Exemplo de Saída:

  ```bash
     64 bytes from 8.8.8.8: icmp_seq=1 ttl=119 time=10 ms
     64 bytes from 8.8.8.8: icmp_seq=1 ttl=119 time=10 ms
     64 bytes from 8.8.8.8: icmp_seq=1 ttl=119 time=10 ms
     --- google.com ping statistics ---
     3 packets transmitted, 3 received, 0% packet loss, time 6012ms

  ```
  Use as teclas **Ctrl + C**, para poder parar a verificação.

  **Mais exemplos:**

  - **Opções**: `-c N` (contagem), `-i S` (intervalo), `-s SIZE` (tamanho pacote).

## traceroute - Rastrear rota
- **O que faz**: Mostra hops até o destino.
- **Exemplo**: `traceroute google.com`

## dig - Consulta DNS
- **O que faz**: Resolve nomes para IPs.
- **Exemplo**: `dig google.com` ou `dig +short MX google.com` (MX records).

## ss / netstat - Ver sockets e conexões
- **O que faz**: Lista portas abertas, conexões TCP/UDP.
- **Exemplo**: `ss -tuln` (TCP, UDP, listen, numérico)
  Saída: `tcp LISTEN 0 128 *:22 :`

Esses são comandos básicos para diagnósticos de rede, sendo o comando **ping**, muito utilizado para teste de conexão.
Tem muitos outros comandos relacionado a fazer um diagnóstico da rede, além desses e vou estár sempre trazendo atualizações
de novos comandos aqui.
