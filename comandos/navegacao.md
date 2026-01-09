# Comandos de Navegação no Terminal

Esses são os comandos básicos para "se movimentar" dentro do sistema de arquivos do Linux. São os primeiros que todo mundo aprende, porque você precisa deles para quase tudo.

## pwd - (Mostrar o diretório atual)
- **O que faz**: Mostra o caminho completo do diretório onde você está no momento.
- **Sintaxe**: `pwd`
- **Exemplo**:
`$ pwd
/home/user/Documentos`

- **Por que usar**: Útil quando você se perde e quer saber exatamente onde está.

## cd - (Mudar de diretório)
- **O que faz**: Troca o diretório atual para outro.
- **Sintaxe**: `cd [caminho]`
- **Exemplos comuns**:
- `cd /etc` → vai para a pasta /etc (configurações do sistema)
- `cd ..` → volta um nível (para a pasta "pai")
- `cd ../..` → volta dois níveis
- `cd ~` → vai para a sua pasta home (/home/seuusuario)
- `cd -` → volta para o diretório anterior que você estava
- `cd` (sem nada) → também vai para a home
- **Dica**: Use Tab para autocompletar nomes de pastas.

## ls - List (Listar conteúdo de diretórios)
- **O que faz**: Mostra os arquivos e pastas dentro do diretório atual (ou de um especificado).
- **Sintaxe**: `ls [opções] [caminho]`
- **Exemplos comuns**:
- `ls` → lista simples (só nomes)
- `ls -l` → lista detalhada (com permissões, dono, tamanho, data)
- `ls -a` → mostra arquivos ocultos (que começam com .)
- `ls -la` ou `ls -alh` → combinação mais usada (detalhada + ocultos + tamanho humano)
- **Saída de exemplo com `ls -la`**:
  
 `drwxr-xr-x  2 user user 4096 jan  9 15:00 Documentos`
 
 `-rw-r--r--  1 user user 1234 jan  9 15:10 arquivo.txt`

(O primeiro caractere indica tipo: `d` = diretório, `-` = arquivo normal, as vezes também pode aparecer um tipo `l`= link)

## tree - Mostrar estrutura em árvore
- **O que faz**: Exibe pastas e arquivos em formato de árvore (muito visual).
- **Sintaxe**: `tree [opções] [caminho]`
- **Exemplos**:
- `tree` → mostra a partir do diretório atual
- `tree -L 2` → limita a 2 níveis de profundidade
- `tree -a` → inclui arquivos ocultos
- `tree -d` → mostra só diretórios
- **Nota**: No Ubuntu/Debian pode precisar instalar com `sudo apt install tree`. No Rocky/Fedora já vem ou instala com `sudo dnf install tree`.

Esses comandos são a base para explorar o sistema, seja em distros base Debian/Ubuntu, seja em Red Hat/Fedora/Rocky.
