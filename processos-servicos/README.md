# Processos e Serviços no Linux 🔄🛠️

Essa pasta é dedicada ao gerenciamento de processos (o que está rodando no momento) e serviços (unidades controladas pelo systemd, como SSH, Nginx, Docker etc.). 
Essa parte é crucial para troubleshooting em servidores e desktops.

Pode haver algumas diferenaças dos comandos entre base de distros(RHEL/Fedora/Rocky ou Debian/Ubuntu), mas nos exemplos, estarei informando isso.


### Arquivos disponíveis até o momento:

- 📂 [Gerenciamento de Processos](processos.md)  
  Comandos como `ps`, `top`, `htop`, `kill`, `pkill`, `nice` — tudo para monitorar, priorizar e terminar processos. Incluí exemplos reais, saídas e avisos!

- 📂 [Gerenciamento de Serviços e Logs](servicos-e-logs.md)  
  Foco em `systemctl` (start, stop, enable, status) e `journalctl` (ver logs do journal). Essencial para controlar serviços no boot e debug de erros.

Meu objetivo é explicar de forma clara e detalhada, com exemplos que rodei nas VMs que criei para os testes, pensando em quem está começando como eu estava há pouco tempo.

Obrigado por visitar o repositório! 🚀
