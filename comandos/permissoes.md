# Permissões de Arquivos e Diretórios 🔒

Esses comandos são super importantes porque no Linux tudo gira em torno de permissões: quem pode ler, escrever ou executar um arquivo. Aprender isso me ajudou muito a entender por que às vezes um comando "não deixa" fazer algo.

Tudo no Linux tem dono (usuário) e grupo, e as permissões são divididas em três categorias:
- **Dono** (u - user)
- **Grupo** (g - group)
- **Outros** (o - others)

As permissões aparecem no `ls -l` como algo tipo `-rwxr-xr-x`:
- r = leitura (read)
- w = escrita (write)
- x = execução (execute)

## chmod - Change Mode (Alterar permissões)
- **O que faz**: Muda as permissões de leitura, escrita e execução de arquivos ou pastas.
- **Sintaxe**: `chmod [quem][+ou-][permissão] arquivo` ou com números octais (mais comum).
- **Modo simbólico (mais fácil de entender)**:
  - `chmod u+x arquivo.sh` → dá permissão de execução só para o dono
  - `chmod go-rw arquivo.txt` → remove leitura e escrita do grupo e outros
  - `chmod a+r arquivo.txt` → dá leitura para todos (a = all)
- **Modo numérico (mais rápido)**:
  - 4 = leitura (r)
  - 2 = escrita (w)
  - 1 = execução (x)
  - Soma: 7 = rwx, 6 = rw-, 5 = r-x, 0 = ---
  - Exemplo: `chmod 755 script.sh` → dono rwx (7), grupo e outros r-x (5)
  - Exemplo: `chmod 644 arquivo.txt` → dono rw- (6), grupo e outros r-- (4) — padrão para arquivos normais
- **Opções úteis**:
  - `chmod -R 755 pasta/` → aplica recursivamente em toda a pasta
- **Dica**: Scripts bash precisam de `x` para rodar com `./script.sh`.

## chown - Change Owner (Alterar dono e grupo)
- **O que faz**: Muda o usuário dono e/ou o grupo de um arquivo ou pasta. Só root pode usar livremente.
- **Sintaxe**: `chown [opções] [usuário][:grupo] arquivo`
- **Exemplos**:
  - `sudo chown carlos arquivo.txt` → muda só o dono para carlos
  - `sudo chown carlos:devs arquivo.txt` → dono carlos e grupo devs
  - `sudo chown :devs arquivo.txt` → muda só o grupo (deixa o dono igual)
  - `sudo chown -R carlos:devs pasta/` → recursivo em toda a pasta
- **Opção útil**:
  - `--reference=arquivo_ref` → copia dono e grupo de outro arquivo

**Aviso importante**: Erros de permissão são comuns em quem está começando. Sempre use `ls -l` antes e depois para conferir. E cuidado com `chmod 777` — dá tudo para todo mundo, o que faz que qualquer um pode fazer o que quiser, o que pode gerar muitos problemas de segurança.

Esses comandos são essenciais para segurança e para trabalhar com múltiplos usuários, também são muito utulizados no dia dia de uma empresa.
