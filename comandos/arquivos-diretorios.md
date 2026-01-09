# Comandos para Manipulação de Arquivos e Diretórios

Aqui estão os comandos para criar, copiar, mover, remover e buscar arquivos/pastas. **Cuidado**: alguns são perigosos (como rm, onde você pode remover coisas além do que queria), então sempre confirme antes de rodar em pastas importantes.

## mkdir - Make Directory (Criar diretório)
- **O que faz**: Cria uma nova pasta.
- **Sintaxe**: `mkdir [opções] nome_da_pasta`
- **Exemplos**:
  - `mkdir projetos` → cria pasta "projetos"
  - `mkdir -p projetos/linux/2026` → cria pastas aninhadas (não dá erro se já existir)

## cp - Copy (Copiar arquivos ou pastas)
- **O que faz**: Copia arquivos ou diretórios.
- **Sintaxe**: `cp [opções] origem destino`
- **Exemplos**:
  - `cp arquivo.txt arquivo_backup.txt` → copia arquivo
  - `cp -r pasta/ pasta_backup/` → copia pasta inteira (-r = recursivo)
  - `cp *.txt destino/` → copia todos os .txt para outra pasta

## mv - Move (Mover ou renomear)
- **O que faz**: Move arquivos/pastas ou renomeia (é a mesma coisa).
- **Sintaxe**: `mv origem destino`
- **Exemplos**:
  - `mv arquivo.txt /home/carlos/Documentos/` → move para outra pasta
  - `mv arquivo.txt novo_nome.txt` → renomeia

## rm - Remove (Remover arquivos ou pastas)
- **O que faz**: Apaga arquivos ou pastas **permanentemente** (não vai para lixeira!).
- **Sintaxe**: `rm [opções] alvo`
- **Exemplos**:
  - `rm arquivo.txt` → remove arquivo
  - `rm -r pasta/` → remove pasta e tudo dentro (-r = recursivo)
  - `rm -rf pasta/` → força remoção sem perguntar (-f = force) — **muito perigoso!**
- **Aviso importante**: Não use `rm -rf /` ou similares — pode destruir o sistema inteiro.

## find - Buscar arquivos
- **O que faz**: Procura arquivos/pastas por nome, tamanho, tipo etc.
- **Sintaxe**: `find [caminho] [critérios]`
- **Exemplos**:
  - `find . -name "*.txt"` → busca arquivos .txt a partir do diretório atual
  - `find /home -type d -name "projetos"` → busca pastas chamadas "projetos"
  - `find . -size +100M` → arquivos maiores que 100MB

## du - Disk Usage (Uso de disco de uma pasta)
- **O que faz**: Mostra quanto espaço uma pasta ou arquivo ocupa.
- **Sintaxe**: `du [opções] caminho`
- **Exemplos**:
  - `du -sh pasta/` → tamanho total em formato humano (-s = summary, -h = human-readable)
  - `du -sh * | sort -h` → lista tamanho de tudo na pasta atual, ordenado

## df - Disk Free (Espaço livre no disco)
- **O que faz**: Mostra espaço usado/livre em todos os discos/partições.
- **Sintaxe**: `df [opções]`
- **Exemplos**:
  - `df -h` → formato humano (GB, MB etc.)
- **Saída típica**:
  
`Sist.Arquivos   Tam  Usado Disp Uso% Montado em`

`/dev/sda1       100G   45G   55G  45% /`

Esses comandos são essenciais para gerenciar arquivos no dia a dia. Mas alguns como o `rm`, tem que usar com cuidado, pois podem apagar até pastas de funcionamento do sistema.
