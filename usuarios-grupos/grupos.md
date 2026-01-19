# Gerenciamento de Grupos 👥

Grupos ajudam a organizar permissões para múltiplos usuários. Aqui os comandos principais — funcionam parecido em todas as distros.

No Linux, cada usuário tem um grupo primário (geralmente com o mesmo nome do usuário), mas pode pertencer a grupos suplementares para acessar arquivos ou rodar comandos específicos (tipo sudo).

## Ver informações de grupos

Antes de criar ou modificar, sempre confiro o que já existe para não duplicar.
  - **id**: Mostra informações do usuário atual ou de outro.
  - `id` → info do usuário atual
 
    **Saída esperada(Fedora/Rocky):**
```bash
uid=1000(carlos) gid=1000(carlos) groups=1000(carlos),10(wheel),980(docker) #No Ubuntu no lugar de (wheel), iria ser (sudo)
```
- **cat /etc/group**: Mostra todos os grupos do sistema. O arquivo é no formato: `nome_do_grupo:x:GID:lista_de_usuários`.
  - **O que faz**: Lista nome, GID (ID do grupo) e membros.
  - **Por quê usar**: Visão geral rápida para ver se o grupo já existe ou quem está nele.
  - **Exemplo**:

  `sudo groupadd financeiro` → cria com GID automático.
  
  `financeiro:x:1001:paulo joao maria` → nesse exemplo, criei o grupo financeiro, o **x** seria a senha criptografada, se tiver senha, enquanto o **1001** ID do grupo e por fim os membors do grupo.

  `sudo groupadd -g 2000 marketing` → força GID 2000 (útil para padronizar em múltiplas máquinas).

  **Diferença entre distros**: Funciona igual em Rocky/Fedora e Ubuntu/Debian.

  ## Adicionando e removendo usuários de grupos

- **usermod**: Modifica grupos de um usuário (mais comum em todas as distros).
- **O que faz**: Adiciona ou remove grupos suplementares (não mexe no primário).
- **Por quê usar**: Para dar permissões compartilhadas, como adicionar a "wheel" para sudo.
- **Exemplos para adicionar**:
- `sudo usermod -aG financeiro novo_usuario` → adiciona ao grupo financeiro (-a = append, G = groups)
- Sempre use -a para não substituir grupos existentes!
- Depois confira: `groups joao`
  

  `sudo usermod -aG financeiro,adm,marketing joao` → adiciona o usuário a multiplos grupos.

- **Exemplos para remover**:
- `sudo gpasswd -d paulo financeiro` → remove o usuário só do grupo financeiro.
- `sudo usermod -G '' maria` → remove de todos os grupos suplementares (cuidado!)

## Deletando grupos

- **groupdel**: Remove um grupo.
- **O que faz**: Apaga a entrada do /etc/group.
- **Por quê usar**: Limpar grupos não usados para manter o sistema organizado.
- **Exemplo**:
- `sudo groupdel financeiro` → remove o grupo financeiro
- Só funciona se ninguém tiver ele como grupo primário.
- **Aviso**: Se o grupo tiver arquivos, eles ficam sem grupo (GID vira número).

Isso ai seria o básico que todos precisam saber sobre esse tema, apesar que em grandes empresas, se vai usar outras formas de adicionar usuários e grupos, só que ainda assim é importante entender esse básico.
