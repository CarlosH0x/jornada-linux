# Pasta Scripts

Esta pasta é dedicada aos scripts que estou criando e desenvolvendo durante minha jornada de aprendizado em Linux. 
Aqui, vou organizar códigos práticos, principalmente em Bash, para automatizar tarefas e praticar conceitos de administração de sistemas.

## Descrição

O objetivo principal é documentar meus progressos em scripting, começando por exemplos simples e evoluindo para soluções mais complexas. 
Cada script terá sua própria subpasta com um README específico, explicando o que ele faz, como rodar e possíveis melhorias.

- **Versão atual**: Inicial, com foco em Bash.
- **Ambientes testados**: Fedora Workstation 43, Rocky Linux 10, Ubuntu Server 24.04 LTS (via VMs no Virt-Manager).
- **Motivação**: Como autônomo em suporte TI, quero aprofundar em automação para aplicar em cenários reais, como monitoramento e gerenciamento de recursos.

## Scripts Atuais

- [Monitor de disco](scripts/monitor-disco): Um script simples em Bash para monitorar o uso de disco na raiz (/) e alertar se ultrapassar 80%. Veja a subpasta para detalhes.

## Como Usar Esta Pasta

1. **Navegação**: Cada script fica em uma subpasta própria (ex.: `scripts/monitor-disco/`).
2. **Execução geral**: Para rodar qualquer script, entre na subpasta correspondente, baixe-o, torne-o executável com `chmod +x nome-do-script.sh` e execute com `./nome-do-script.sh`.
3. **Em atualização**: Criarei subpastas para cada novo projeto, com o código fonte e um README dedicado.

## Evoluções Planejadas

- Adicionar mais scripts, como backup automático de arquivos ou monitoramento de rede.
- Incluir exemplos em outras linguagens, como Python, se eu avançar nessa área.
- Integrar com ferramentas como cron para agendamento automático.
