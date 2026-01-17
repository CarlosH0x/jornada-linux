# Gerenciamento de Usuários e Grupos 👥

Essa é uma das partes que mais pratiquei recentemente nas minhas VMs, porque entender usuários e grupos é essencial para segurança e organização no Linux. No dia a dia como técnico, já vi problemas de permissões por causa de usuários mal configurados, e agora estudando mais a fundo quero dominar isso para quando chegar em SysAdmin.

Testei tudo em três ambientes diferentes para comparar:
- **Fedora Workstation 43** (base RPM/DNF, parecido com Rocky)
- **Rocky Linux 10** (servidor, RPM/DNF)
- **Ubuntu Server 24.04 LTS** (DEB/APT)

A maior diferença que notei: distribuições Debian/Ubuntu (como o Ubuntu) têm comandos mais "amigáveis" (`adduser`), enquanto Red Hat/Rocky/Fedora usam comandos mais "baixo nível" (`useradd`). Vou explicar os dois jeitos e quando usar cada um.

## Comandos para ver informações de usuários e grupos

Antes de criar ou modificar, sempre confiro o que já existe:

- **id**: Mostra informações do usuário atual ou de outro.
  - `id` → info do usuário atual
 
    **Saída esperada(Fedora/Rocky):**
```bash
uid=1000(carlos) gid=1000(carlos) groups=1000(carlos),10(wheel),980(docker) #No Ubuntu no lugar de (wheel), iria ser (sudo)
```


- **groups**: Lista grupos do usuário atual ou especificado.
- `groups` ou `groups usuario`

- **Saída**
  ```bash
  usuario wheel docker #Saída no Fedora e Rocky

  ```

   ```bash
  usuario sudo docker #Saída no Ubuntu

  ```


- **cat /etc/passwd**: Lista todos os usuários do sistema (formato: nome:senha:x:uid:gid:descrição:home:shell)
- **cat /etc/group**: Lista todos os grupos

## Criando usuários

### adduser (mais comum no Ubuntu/Debian — interativo e recomendado para iniciantes)
- **O que faz**: Cria usuário de forma amigável: pergunta nome completo, senha, etc., e já cria home, copia arquivos padrão.
- **Exemplo no Ubuntu Server**:
  ```bash
  sudo adduser novo_usuario
  ```
  - Ele pergunta:
  - Senha
  - Nome completo
  - Telefone, etc. (pode pular com Enter)
- Automaticamente cria grupo com o mesmo nome e home em /home/novo_usuario

- **Opções úteis**:
- `sudo adduser --uid 1005 novo_usuario` → força um UID específico
- `sudo adduser novo_usuario sudo` → já adiciona ao grupo sudo (no Ubuntu)

### useradd (padrão em Rocky/Fedora — mais baixo nível)
- **O que faz**: Cria o usuário "cru" — não cria home nem pede senha por padrão. Precisa configurar manualmente.
- **Exemplo básico no Rocky Linux**:
  ```bash
  sudo useradd novo_usuario
  ```

  - **Depois precisa:**
  ```bash  
    sudo passwd novo_usuario  # define senha
    sudo mkdir /home/novo_usuario
    sudo chown novo_usuario:novo_usuario /home/novo_usuario
    sudo usermod --shell /bin/bash novo_usuario  # se quiser bash como shell
    sudo cp -r /etc/skel/. /home/novo_usuario  # copia arquivos padrão (.bashrc etc.)
    sudo chown -R novo_usuario:novo_usuario /home/novo_usuario
  ```

- **Exemplo completo com opções** (recomendo para evitar passos extras):

```bash
    sudo useradd -m -s /bin/bash -G wheel novo_usuario
    sudo passwd novo_usuario
```

- `-m`: cria home
- `-s /bin/bash`: define shell
- `-G wheel`: adiciona a grupo suplementar (sudo no Fedora/Rocky)

**Minha dica**: No Ubuntu uso `adduser`. No Rocky/Fedora prefiro `useradd -m` + `passwd`. Os dois acabam no mesmo resultado.

## Criando grupos(Exemplo):

**groupadd**: Cria um novo grupo (funciona igual em todas as distros).
- `sudo groupadd suporte`
- `sudo groupadd -g 2000 infra` → força GID específico

## Adicionando usuário a grupos

- **usermod**: Modifica usuário (adiciona/remove grupos, muda shell, etc.).
- `sudo usermod -aG suporte novo_usuario` → adiciona ao grupo suporte (-a = append, importante!)
- `sudo usermod -aG suporte,adm,docker novo_usuario` → múltiplos grupos
- No Rocky/Fedora para sudo: `sudo usermod -aG wheel novo_usuario`

- No Ubuntu também tem `adduser novo_usuario sudo` (mais simples).

## Alterando senha

- **passwd**: Muda senha de usuário.
- `passwd` → muda a própria
- `sudo passwd novo_usuario` → muda de outro
- `sudo passwd -e novo_usuario` → força troca na próxima login

## Deletando usuários e grupos

- **userdel** ou **deluser**:
- Rocky/Fedora: `sudo userdel -r novo_usuario` (-r remove home e mail)
- Ubuntu: `sudo deluser --remove-home novo_usuario`

- **groupdel**: Remove grupo (só se não for grupo primário de alguém).
- `sudo groupdel suporte`

**Avisos importantes**:
- Sempre use `sudo` para esses comandos.
- Cuidado ao deletar usuários — use `-r`/`--remove-home` para limpar tudo.
- Grupo primário do usuário é criado automaticamente com o mesmo nome (na maioria dos casos).
- Erros comuns: esquecer `-a` no `usermod -G` (substitui grupos em vez de adicionar).

Ainda estou praticando, pois tem muita coisa para aprender ainda em relação a usuários e grupos. Mas isso ai seria o básico que todos precisam saber sobre esse tema, apesar que em grandes empresas, se vai usar outras formas de adicionar usuários e grupos, só que ainda assim é importante entender esse básico.
