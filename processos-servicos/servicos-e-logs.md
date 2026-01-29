# Gerenciamento de Serviços e Logs com Systemd 🛠️

Aqui vou está falando do systemd, que é o coração moderno da maioria das distros Linux atuais — gerencia inicialização, serviços e logs. 
Quem vai trabalhar com Linux, é muito importante entender sobre systemd e comandos essenciais para o gerenciamento de serviços e logs.

Fiz os testes em distros base RHEL(Fedora, Rocky) e base Debian(Debian, Ubuntu), para entender as diferenças entre cada base.

Os comandos principais que vou abordar aqui, são `systemctl` (para serviços) e `journalctl` (para logs). São iguais em todas as distros, 
mas alguns serviços mudam de nome dependendo da base da distro (ex: firewalld vs ufw).

Meu foco aqui é explicar de forma simples e detalhada, com exemplos reais que rodei, saídas esperadas, flags úteis e avisos. Vou dividir em duas seções.

## systemctl - Gerenciar serviços

- **O que faz**: Controla unidades do systemd (serviços, timers, sockets etc.). Start, stop, enable (iniciar no boot), status etc.
- **Por quê usar**: Essencial para servidores — iniciar Apache/Nginx, SSH, Docker, bancos de dados etc.

### Comandos principais e exemplos

- **status**: Ver estado de um serviço.
  - `systemctl status sshd` (ou ssh no Ubuntu)

    Saída esperada (exemplo ativo no Rocky Linux/base RHEL):

   ![systemctl status sshd](https://github.com/CarlosH0x/jornada-linux/blob/88707755c3285d4a8ab4bdfd251d12c069c1bdaf/processos-servicos/imagens/cmd_systemctl.png)

    - Nesse exemplo acima, mostra o status atual do SSH, se  está active, loaded, erros recentes.

- **Mais exemplos:**   
- **start / stop / restart / reload**:
- `sudo systemctl start nginx` → inicia agora
- `sudo systemctl stop nginx` → para
- `sudo systemctl restart nginx` → reinicia (stop + start)
- `sudo systemctl reload nginx` → recarrega config sem parar (se o serviço suportar)
- **Dica**: Restart é útil para aplicar mudanças em config.

- **enable / disable**:
- `sudo systemctl enable sshd` → inicia automático no boot
- `sudo systemctl disable sshd` → desabilita no boot (mas não para se estiver rodando)
- `sudo systemctl enable --now sshd` → enable + start imediato

  **Lemabrando:** No Ubuntu, se usa o **ssh** e não **sshd**, igual em distros base RHEL.

- **is-active / is-enabled / is-failed**:
- `systemctl is-active nginx` → retorna "active" ou "inactive"
- Útil em scripts.

- **list-units / list-unit-files**:
- `systemctl list-units --type=service` → serviços rodando
- `systemctl list-unit-files --type=service` → todos instalados (enabled/disabled)
- `systemctl --failed` → serviços com erro

- **mask / unmask**:
- `sudo systemctl mask nginx` → bloqueia completamente (nem manual inicia)
- Útil para desabilitar serviços indesejados permanentemente.

**Exemplos práticos que testei**:
- Em todas as distros: `sudo systemctl restart NetworkManager` (reinicia rede no desktop)
- No Ubuntu: `sudo systemctl status snapd` (gerencia snaps)
- No Rocky: `sudo systemctl status firewalld`(Vê status atual do firewall)

**Avisos**:
- Sempre use sudo para ações que mudam estado.
- Em servidores, evite restart de serviços críticos sem planejamento (ex: ssh — pode perder conexão!).
- Se serviço falhar: veja logs com journalctl (abaixo).

## journalctl - Ver logs do systemd

- **O que faz**: Mostra logs do journal (banco de logs binário do systemd). Substitui antigos /var/log/messages em muitas distros.
- **Por quê usar**: Debugging rápido — erros de boot, serviços, kernel.

### Comandos principais e exemplos

- **Ver logs gerais**:
- `journalctl` → tudo (use Page Up/Down ou less)
- `journalctl -f` → follow em tempo real (como tail -f)
- `journalctl -n 50` → últimas 50 linhas

- **Por serviço**:
- `journalctl -u sshd` → logs só do sshd
  - Exemplo:

    ![Texto alternativo](https://github.com/CarlosH0x/jornada-linux/blob/88707755c3285d4a8ab4bdfd251d12c069c1bdaf/processos-servicos/imagens/journalctl.png)
  
- `journalctl -u nginx -f` → follow do nginx

   Saída de exemplo (erro comum):
   ```bash
    Jan 20 09:00:00 server nginx[1234]: nginx: configuration file /etc/nginx/nginx.conf test failed
   ```

   - **Por tempo**:
- `journalctl --since "2026-01-20 08:00"` → desde hora específica
- `journalctl --since today` ou `--since yesterday`
- `journalctl -b` → logs só do boot atual
- `journalctl -b -1` → boot anterior (útil para erros de inicialização)

- **Por prioridade**:
- `journalctl -p err` → só erros (emerg, alert, crit, err)
- `journalctl -p 3` → nível 3 (err) — níveis: 0 emerg ... 7 debug

- **Outros úteis**:
- `journalctl --disk-usage` → quanto espaço os logs ocupam
- `sudo journalctl --vacuum-time=2weeks` → limpa logs antigos (configurável em /etc/systemd/journald.conf)
- `journalctl -k` → só kernel logs (dmesg alternativo)

**Exemplos práticos**:
- Debug de falha no boot: `journalctl -b -p err`
- Ver por quê um serviço parou: `journalctl -u nome.service -p err --since "1 hour ago"`

**Avisos**:
- Logs são binários — não edite manualmente.
- Em servidores, configure rotação para não encher disco (journald faz automático, mas ajuste se precisar).

Ainda tem muita coisa a ser explorada relacionada a esses comandos e o gerenciamento de serviços e logs de forma gera.
Mas esses exemplos, são o básico que todos precisam saber e que vai ajudar muito no dia dia administrando um sistema Linux.
