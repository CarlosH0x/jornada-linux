# Gerenciamento de Processos 🔄

Essa parte sobre processos é bem interessante porque mostra como o Linux gerencia tudo que está rodando — de programas abertos a serviços em background.

Processos são basicamente programas em execução: cada um tem PID (ID único), dono, prioridade e estado (rodando, dormindo, zumbi etc.). Testei no Fedora, Rocky Ubuntu e Debian. 
Os comandos são iguais em todas, mas ferramentas como `htop` podem precisar instalar (ex: `sudo dnf install htop` no Rocky/Fedora, `sudo apt install htop` no Ubuntu/Debian).

Meu foco aqui é explicar o que cada comando faz, por quê usar, exemplos práticos com saídas e dicas para não errar — tudo pensando em quem está começando como eu.

## Ver processos rodando

- **ps**: Process Status — lista processos.
  - **O que faz**: Mostra snapshot de processos (PID, usuário, CPU, memória etc.). Útil para ver o que está ativo.
  - **Por quê usar**: Rápido para checar processos específicos ou do usuário atual.
  - **Exemplos básicos**:
    - `ps` → processos do terminal atual
      ```bash
         PID TTY          TIME CMD
       4689 pts/0    00:00:00 bash
       4695 pts/0    00:00:00 ps
      ```

      - `ps aux` → todos os processos do sistema (a = all, u = user-oriented, x = sem terminal)
      - Saída: Mostra %CPU, %MEM, VSZ (memória virtual), RSS (memória residente), STAT (estado: R=running, S=sleeping, Z=zombie).

 **Exemplo de saída:**

    ```bash
     USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
     root           1  0.1  0.3  22484 12224 ?        Ss   07:44   0:02 /sbin/init splash
     root           2  0.0  0.0      0     0 ?        S    07:44   0:00 [kthreadd]
     carlos      4750  3.5  1.2 468452 43924 ?        Sl   08:14   0:00 xfce4-terminal
     carlos      4756  0.1  0.1  11444  5624 pts/0    Ss   08:14   0:00 bash
     carlos      4762  200  0.1  13732  4768 pts/0    R+   08:14   0:00 ps aux
    ``` 
**Outros exemplos:**

- `ps -ef` → formato estendido (e = extended, f = full)
- `ps aux | grep firefox` → filtra processos do Firefox
- **Opções úteis**:
- `-p PID`: Só um processo específico.
- `--sort=-%cpu`: Ordena por CPU descendente.
- **Dica**: `ps` é estático — para monitoramento real-time, use `top` ou `htop`.

- **top**: Interactive process viewer — monitora em tempo real.
- **O que faz**: Mostra processos dinâmicos, com uso de CPU, memória e teclas interativas (ex: k para kill).
- **Por quê usar**: Ideal para identificar processos "guloso" (alta CPU/RAM) em máquinas lentas.
- **Exemplo**:
- `top` → inicia interface (pressione **q** para sair)
- Informações no Topo: resumo (uptime, load average, tasks: running/sleeping/zombie).
- Lista: PID, USER, PR (prioridade), NI (nice), VIRT, RES, SHR, %CPU, %MEM, TIME+, COMMAND.
- Interativo: Pressione 1 para ver por CPU, M para ordenar por memória, k + PID para matar.
- **Opções úteis, exemplos**:
- `top -p 1234` → monitora só um PID.
- `top -u usuario` → só processos do usuário.
- **Dica**: No Ubuntu/Rocky, instale `htop` para versão melhorada (cores, mouse, árvores de processos).

- **htop** (instale se não tiver — melhor que top).
- **O que faz**: Versão aprimorada do top, com interface gráfica no terminal (barras, árvores).
- **Por quê usar**: Mais intuitivo para iniciantes — selecione processo com mouse/setas e F9 para kill.
- **Exemplo**: `htop` → similar ao top, mas com mais visual.
- **Dica**: Pressione t para árvore, s para strace (debug), l para lsof (arquivos abertos).

## Matando processos

- **kill**: Envia sinal para terminar processo.
- **O que faz**: Manda sinal (ex: -9 para forçar) para um PID.
- **Por quê usar**: Para parar processos travados ou consumindo recursos.
- **Exemplos**:
- `kill 1234` → sinal padrão (-15 TERM, pede para sair graciosamente)
- `kill -9 1234` → força kill (-9 KILL, ignora tudo e manda fechar — use como último recurso)
- `kill -l` → lista todos os sinais (1 HUP, 2 INT, 9 KILL, 15 TERM).
- **Aviso**: Use `ps` para achar PID. Cuidado com kill -9, pode corromper dados dependendo do processo (ex: banco de dados).

- **pkill**: Kill por nome ou padrão.
- **O que faz**: Mata processos pelo nome em vez de PID.
- **Exemplo**: `pkill firefox` → mata todos os Firefox.
- `pkill -u carlos` → mata todos os processos do usuário carlos.
- **Dica**: `pgrep firefox` para achar PIDs primeiro (não mata).

- **killall**: Similar a pkill, mata por nome exato.
- Exemplo: `killall -9 chrome`.


**Avisos gerais**: Cuidado ao matar processos do sistema (ex: PID 1 init/systemd). Sempre use `top` ou `htop` para monitorar antes. 
  Zumbis (STAT Z) são inofensivos, mas indicam que o processo principal não limpou — então faça no processo principal primeiro.
 
Esses são comandos muito importantes, principalmente para lidar com processos que andam deixando o sistema lento. São apenas os essenciais esses, pois 
ainda existem outros comandos relacionados. 

Recomendo praticar em uma VM, para evitar qualquer problema no seu PC principal.
