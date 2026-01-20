# Segurança de Rede 🛡️

Firewalls são essenciais para bloquear tráfego indesejado e ajduar na segurança. 

Diferenças de distros sobre **firewall**: Rocky/Fedora usam firewalld; Ubuntu ufw (simples sobre iptables). 
No Debian, também se pode usar o ufw, que é mais fácil pra iniciantes, mas precisa instalar, usando o comando `sudo apt install ufw`

## firewalld (Rocky/Fedora)
- **O que faz**: Gerencia regras dinâmicas com zonas (public, internal etc.).
- **Exemplo**: `sudo firewall-cmd --list-all`→ lista todos serviços de firewall 
  - `sudo firewall-cmd --add-service=http --permanent` → abre HTTP
  - `sudo firewall-cmd --reload` → recarrega os serviços de firewall, aplicando as alterações da configuração permanente à configuração em tempo de execução

## ufw (Ubuntu)
- **O que faz**: Frontend simples para iptables.
- **Exemplo**: `sudo ufw allow 80/tcp` → abre porta http
  - `sudo ufw status verbose` → verificar o status do firewall
  - `sudo ufw enable` → habilita o firewall

## iptables - Base avançada
- **O que faz**: Regras de baixo nível.
- **Exemplo**: `sudo iptables -L -v -n` → lista regras ativas de firewall e outros status.

Esse é o básico sobre firewall e segurança no Linux. Sempre vou está atualizando aqui com novos comandos relacionados a segurança
e novas opções para se trabalhar com o firewall, que são muito importantes.
