# Configuração de Interfaces de Rede ⚙️

Essa é a base de redes: ver e configurar IPs, rotas, interfaces etc. Aprendi que distros modernas usam ferramentas como `ip` (do iproute2) em vez do antigo `ifconfig`. 
No Fedora/Rocky, NetworkManager é comum de ser usado, já no Ubuntu, netplan.

## ip - Ferramenta principal para IP e rotas
- **O que faz**: Mostra/manipula interfaces, endereços, rotas, ARP etc. Substitui ifconfig, route, arp.
- **Por quê usar**: Padrão moderno, mais poderoso e consistente.
- **Exemplos**:
  - `ip addr show` ou `ip a` → mostra todas interfaces e IPs

    Exemplo de saída:
    ```bash
       2: ens20p: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1000 qdisc noqueue state UP group default qlen 100
       link/ether 00: 00: 00: aa: aa: aa
       inet 192.168.100.152/24 brd 192.168.100.255 scope global dynamic noprefixroute ens20p
       inet6 fe80::a00:27ff:fea1:b2c3/64 scope link   
    ```
    No exemplo acima, mostra a sua placa de rede, o ipv4, ipv6 e outras informações relacionadas a sua rede.

  - **Outros exemplos:**
  - `ip link set ens20p down` / `up` → desliga/liga interface
  - `ip addr add 192.168.1.200/24 dev ens20p` → adiciona IP temporário
  - `ip route show` → rotas
  - `ip neigh show` → tabela ARP
  - **Opções úteis**: `-s` para stats, `-c` para cores.

## nmcli - Gerenciador de rede (Fedora/Rocky)
- **O que faz**: Comando para NetworkManager — configura conexões.
- **Exemplo**: `nmcli con show` → lista conexões
- `nmcli device wifi list` → WiFi disponíveis
- `nmcli con up id "MinhaConexao"` → ativa conexão

## netplan (Ubuntu Server)
- **O que faz**: Configuração declarativa via YAML.
- **Exemplo**: Edite com nano ou vi /etc/netplan/01-netcfg.yaml, depois `sudo netplan apply`.

**Aviso**:
    - Mudanças temporárias somem no reboot — use configs persistentes para produção.
    - No Ubuntu, deve editar um arquivo, cujo final sejam **yaml**, o nome pode variar, mas no final sempre vai ter esse nome.

Esses são apenas alguns exemplos de configuração de redes, ao pouco vou ir atualizando aqui com mais comandos e exemplos.
          
  
