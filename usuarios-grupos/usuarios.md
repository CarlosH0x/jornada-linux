# Gerenciamento de Usuários 👤

Essa parte foquei bastante porque criar usuários corretos é base para tudo no Linux. Testei as diferenças entre distros e notei que Ubuntu é mais "amigável", enquanto Rocky/Fedora é mais manual.

## Ver informações de usuários
- **id**: Mostra UID, GID e grupos.
  - `id` ou `id novo_usuario`
- **cat /etc/passwd**: Lista todos os usuários do sistema.

## Criando usuários

### adduser (Ubuntu/Debian — recomendado para iniciantes)
- Interativo: pergunta senha, nome completo etc., cria home automático.
- Exemplo:

```bash
  sudo adduser novo_usuario
```

### useradd (Rocky/Fedora - um pouco mais manual)
- Exemplo completo:

```bash
  sudo useradd -m -s /bin/bash -G wheel novo_usuario
  sudo passwd novo_usuario
```
- `-m`: cria home
- `-s /bin/bash`: define shell
- `-G wheel`: adiciona a grupo suplementar (sudo no Fedora/Rocky)
- `passwd`: define a senha do novo usuário

## Modificando usuários
**usermod**: Modifica usuário (adiciona/remove grupos, muda shell, etc.).
- `sudo usermod -aG financeiro paulo` → adiciona Paulo ao grupo financeiro (-a significa append (adicionar) e o -G indica o grupo)
- `sudo usermod -aG financeiro,adm,suporte paulo` → adiciona a múltiplos grupos
- No Rocky/Fedora para dar "poder" sudo ao usuário: `sudo usermod -aG wheel maria`

- No Debian/Ubuntu: `sudo usermod -aG sudo francisco`

  **Nunca esqueça o** -a, ou você removerá o usuário de todos os outros grupos que ele já participava!
  
- **passwd**: Muda senha.
- `sudo passwd fulano`

## Deletando usuários
- Ubuntu: `sudo deluser --remove-home francisco`
- Rocky: `sudo userdel -r maria`

Isso é o básico que todos precisam aprender em relação a gerenciamento de usuários. É importante também, entender as diferenças entre as bases de distro Linux, no caso base Debian(Debian, Ubuntu, etc) e base RHEL(Red Hat, Fedora, Rocky, etc).
