# Gerenciamento de Disco e Partições 💾

Essa parte é uma das que mais pratiquei nas minhas VMs, porque mexer com disco sempre tem que ser com cautela, pois qualquer coisa errada, corre risco de perder tudo no sistema. 

E aqui vou documentar comandos para monitorar espaço, listar dispositivos, particionar e montar/desmontar. Tudo com foco em explicações simples, exemplos reais que rodei no Fedora(meu sistema principal),e em VMs com Rocky Linux 10 e Ubuntu Server 24.04 LTS.

Meu objetivo é deixar claro para quem está começando (como eu estava há pouco tempo): o que o comando faz, por quê usar, exemplos práticos e saídas esperadas.

## du - Disk Usage (Ver quanto espaço uma pasta ou arquivo ocupa)
- **O que faz**: Calcula o tamanho exato de arquivos e pastas. Útil para descobrir o que está "comendo" espaço no disco.
- **Por quê usar**: Quando `df` mostra que o disco está cheio, `du` ajuda a achar o culpado.
- **Exemplos práticos**:
  - `du -sh /home/usuario/Documentos/` → mostra só o total da pasta em formato humano (GB/MB)
  - Saída esperada:
  ```bash
    1G    /home/usuario/Documentos/
  ```

  ```bash
  du -sh *  #tamanho de tudo na pasta atual (arquivos e pastas)
  du -sh * | sort -h  #mesma coisa, mas ordenado do menor para o maior
  ```
  - Saída esperada:
    ```bash
      4.0K    arquivo.txt
    
      8M    pasta
    ```

- `du -ah /var/log | head -20` → lista todos os arquivos com tamanho (bom para logs grandes)
- **Opções principais**:
- `-s`: só o total (summary)
- `-h`: human-readable (fácil de ler)
- `-a`: inclui arquivos individuais
- **Dica**: Rode como root (`sudo du ...`) se tiver pastas que o usuário normal não acessa.

## df - Disk Free (Ver espaço livre nas partições)
- **O que faz**: Mostra o espaço total, usado e disponível em todas as partições montadas.
- **Por quê usar**: Visão geral rápida do estado dos discos.
- **Exemplos**:
- `df -h` → tudo em formato humano.
- Saída esperada(exemplo)
  ```bash
    Sistem.Arq      Tam  Usado Disp Uso%   Montado em
  /dev/nvme0n1p2    100G   45G   55G  45%   /
  /dev/nvme0n1p1    512M   12M  500M   3%   /boot/efi
  tmpfs             16G   2.3G   14G  15%   /tmp
  ```
  - `df -h /` → só a partição raiz
- `df -h --output=source,size,used,avail,pcent,target` → colunas personalizadas (para relatórios)
- **Dica**: Se Uso% > 90%, é hora de limpar ou investigar com `du`.

## lsblk - List Block Devices (Listar discos e partições)
- **O que faz**: Mostra todos os dispositivos de bloco (HDs, SSDs, pendrives, partições) e como estão montados.
- **Por quê usar**: Antes de qualquer coisa com disco, rode isso para não errar o dispositivo!
- **Exemplos**:
- `lsblk` → lista básica

```bash
  NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
  nvme0n1     259:0    0 119,2G  0 disk 
  ├─nvme0n1p1 259:1    0   512M  0 part /boot/efi
  └─nvme0n1p2 259:2    0 118,7G  0 part /
```
- `lsblk -f` → com tipo de filesystem (útil para ver ext4, ntfs, etc.)
- `lsblk -o NAME,SIZE,TYPE,MOUNTPOINT,FSTYPE` → colunas específicas
- **Dica**: Sempre confira o nome (/dev/sda, /dev/nvme0n1 etc.) antes de particionar.

## fdisk - Manipular tabela de partições (cuidado máximo!)
- **O que faz**: Cria, deleta ou modifica partições em um disco. É o clássico, mas use com extremo cuidado.
- **Por quê usar**: Para preparar um disco novo ou redimensionar (mas em produção prefira ferramentas gráficas ou LVM).
- **Exemplo básico** (em uma VM com disco vazio /dev/sdb):
- `sudo fdisk /dev/sdb`
- Digite `n` → nova partição
- `p` → primária
- Número 1
- Aceite defaults para tamanho total
- `w` → escreve e sai
- Depois: `sudo mkfs.ext4 /dev/sdb1` para formatar
- **Comandos dentro do fdisk**: p (print), n (new), d (delete), w (write), q (quit sem salvar)
- **Aviso importante**: Errar o dispositivo (ex: fdisk /dev/sda em vez de /dev/sdb) pode destruir o sistema inteiro. Sempre rode `lsblk` antes e pratique só em VMs!

## mount e umount - Montar e desmontar dispositivos
- **O que faz**:
- `mount`: Conecta uma partição ou dispositivo (pendrive, HD externo) a uma pasta no sistema.
- `umount`: Desconecta com segurança.
- **Exemplos**:
- Criar ponto de montagem: `sudo mkdir /mnt/dados`
- Montar: `sudo mount /dev/sdb1 /mnt/dados`
- Verificar: `ls /mnt/dados` ou `df -h`
- Desmontar: `sudo umount /mnt/dados` (ou `sudo umount /dev/sdb1`)
- **Opções úteis**:
- `mount -t ntfs /dev/sdc1 /mnt/windows` → especifica tipo (para partições Windows)
- `mount --bind /origem /destino` → monta pasta em outra pasta
- **Dica**: Para montagem automática, edita /etc/fstab (mas com cuidado — erro trava o boot!).
- **Aviso**: Sempre desmonte antes de remover pendrive, senão pode corromper dados.

Esses são apenas alguns exemplos do que se pode fazer em relação a gerenciamento de discos e partições. Ainda estou estudando sobre isso e conforme for aprendendo, vou adicionando aqui.
