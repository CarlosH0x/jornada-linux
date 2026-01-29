# Comandos de Navegação no Terminal

Esses são os comandos básicos para "se movimentar" dentro do sistema de arquivos do Linux. São os essenciais que todo mundo aprende, porque você precisa deles para quase tudo.

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
- `ls -la` ou `ls -alh` → combinação mais usada (detalhada + ocultos + tamanho humano, onde mostra os tamanhos em M, K ou G)
- **Saída de exemplo com `ls -la`**:
  
![Saída do comando 'ls -la'](https://github.com/CarlosH0x/jornada-linux/blob/82e5555734a3fd5a629d48502bb0865887d3aaad/comandos/imagens/cmd_la.png)

(O primeiro caractere indica tipo: `d` = diretório, `-` = arquivo normal, as vezes também pode aparecer um tipo `l`= link)

## tree - Mostrar estrutura em árvore
- **O que faz**: Exibe pastas e arquivos em formato de árvore (muito visual).
- **Sintaxe**: `tree [opções] [caminho]`
- **Exemplos**:
- `tree` → mostra tudo a partir do diretório atual (Se o diretorio for muito grande, pode ficar demorado pra carrregar e até confuso de se analisar)
- `tree -L 2` → limita a 2 níveis de profundidade (pode ser ideal em caso de diretorios muito grandes)
- `tree -a` → inclui arquivos ocultos
- `tree -d` → mostra só diretórios
- **Saída de exemplo com `tree`**
 
 ![Saída do comando 'tree'](https://github.com/CarlosH0x/jornada-linux/blob/82e5555734a3fd5a629d48502bb0865887d3aaad/comandos/imagens/cmd_tree.png)
  
- **Nota**: No Ubuntu/Debian pode precisar instalar com `sudo apt install tree`. No Rocky/Fedora já vem ou instala com `sudo dnf install tree`.

Esses comandos são a base para explorar o sistema, seja em distros base Debian/Ubuntu, seja em Red Hat/Fedora/Rocky.
