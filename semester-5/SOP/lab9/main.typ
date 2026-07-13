#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Gerência de Memória - Parte II",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz.",),
  date: "2 de Junho de 2026",
  doc,
)

= Hardware de Memória
== Descobrindo o Tamanho da Página e Limites do Sistema
Para descobrir o tamanho de página, foi executado os seguintes comandos:
#sourcecode[```
getconf PAGESIZE
sysctl kernel.shmall
```]
Foi obtido o seguinte resultado:
#figure(
  figure(
    rect(image("fig-1-parte1.png", width:85%)),
    numbering: none,
    caption: [Valor do tamanho de página]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- O valor do tamanho de página é de 4096 Bytes (4 KB). Este valor é disponibilizado a um processo sempre quando é solicitado memória para o sistema operacional. Mesmo que um processo precise de somente 1 KB, ainda sim será alocado um tamanho de página de 4 KB para que o programa consiga operar.
- O valor obtido em `kernel.shmall` foi de 18446744073692774399, que representa o número máximo de páginas de memória compartilhada que podem ser alocadas. 
Multiplicando valor pelo tamanho de página, temos:
$

18446744073692774399 times 4096 = 7,555786373×10^(22) "bytes"
$

Convertendo para Gigabytes (GB):

$
75.557.863.737.424.995.964.034 div 10000000000 = 75.557.863.737.425 "GB"
$

Entretanto, esse valor não corresponde à memória física disponível no computador, sendo apenas um limite teórico para não haver restrição na alocação de memória compartilhada. O limite é imposto pela quantidade de memória física disponíveis no sistema.
#figure(
  figure(
    rect(image("fig3-parte1.png", width:100%)),
    numbering: none,
    caption: [Valor do tamanho de memória física]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()
== Alocação Dinâmica e Páginas Virtuais vs. Físicas

Foi criado o uma arquivo chamado `paginacao.c` e adicionado o seguinte código:

#sourcecode[```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define DEZESSEIS_MEGA (16 * 1024 * 1024) // 16 MB

int main() {
int pid = getpid();
printf("=== PROCESSO INICIADO (PID: %d) ===\n", pid);
printf("Passo A: Antes de alocar memoria. Verifique o consumo.\n");
printf("Pressione ENTER para alocar 16 MB (mas sem usar)...");
getchar();
// Alocando 16 Megabytes de memoria virtual
char *memoria = (char *)malloc(DEZESSEIS_MEGA);
if (memoria == NULL) {
perror("Erro ao alocar");
return 1;
}
printf("\nPasso B: 16 MB alocados virtualmente.\n");
printf("Pressione ENTER para ESCREVER nas paginas de memoria...");
getchar();
// Escrevendo em cada pagina (pulando de 4096 em 4096 bytes)
// Isso forca o Kernel a alocar os quadros fisicos na RAM
for (int i = 0; i < DEZESSEIS_MEGA; i += 4096) {
memoria[i] = 'X';
}
printf("\nPasso C: Dados escritos na memoria (Paginas fisicas associadas).\n");
printf("Pressione ENTER para encerrar o programa...");
getchar();
free(memoria);
return 0;
}
```]
== Compilação e Monitoramento com ferramentas ps e /proc
Para monitorar o funcionamento do programa, foi aberto dois terminais na máquina local. No terminal 1, foi feito a compilação de execução do programa. No terminal 2, foi utilizado comandos utilitários do sistema para coletar os valores da memória virtual (_VSZ/VmSize_) e o tamanho físico presente na RAM (_RSS/VmRSS_).

Ao executar o programa, foi retornado o valor de PID  15987. No terminal 2, foi executado os seguintes comandos para monitoramento da memeória:

#sourcecode[```
ps -o pid,vsz,rss,comm -p 15987
cat /proc/[PID]/status | grep -E "VmSize|VmRSS"
```]

#figure(
  figure(
    rect(image("fig1-parte2.png", width:95%)),
    numbering: none,
    caption: [Execução do programa `paginacao.c` e monitoramento da memória virtual do processo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Ao avançar a execução do código com o botão de `ENTER` no terminal 1 e monitorar a alocação de memória do processo no terminal 2, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("fig2-parte2.png", width:95%)),
    numbering: none,
    caption: [Execução dos passos A, B e C do programa `paginacao.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Para os valores do tamanho da memória virtual e o tamanho físico alocado na RAM, foi preenchido a seguinte tabela:

#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Momento do Programa*],[*VSZ / VmSize (KB)*], [*RSS / VmRSS (KB)*], 
      [*Passo A* (Início)], [2468], [936], 
      [*Passo B* (`malloc` feito)], [18856], [936], 
      [*Passo C* (Escrita feita)],[18856], [17772], 
     
    ),
    numbering: none,
    caption: [Tabela de resultados de compilação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- Quando o código executou o comando `malloc`, a memória virtual (_VSZ/VmSize_) aumentou de 2468 KB para 18856 KB. A diferença entre os dois valores corresponde aos 16 MB que foram alocados.
- A memória física (_RSS/ VmRSS)_ permaneceu constante com o valor de 936 KB.
- Isso acontece devido ao fato de que o sistema operacional Linux utiliza _Lazy Allocation_ para alocação de memória. Quando o programa solicita memória usando `malloc`, o sistema reserva as páginas no espaço virtual de endereçamento do processo, mas adia a associação de frames físicos na RAM até que o programa tente escrever dados nelas. Por isso a memória virtual cresce, mas a memória física fica sem alterações.
- Após o passo C, a memória física (_RSS/ VmRSS_) foi alterada para 17772 KB, pois o programa escreveu dados na RAM física.
- O pulo de 4096 bytes no laço for está ligado ao tamanho de página que é alocado para cada processo quando é solicitado memória ao sistema operacional (4 KB).

== Inspecionando a Tabela de Páginas com o pmap
Foi mantido a execução do programa anterior parado exatamente no passo C. Foi aberto um terminal secundário e executado o utilitário de mapeamento de processos (`pmap`) com base no PID 15987:

#figure(
  figure(
    rect(image("fig3-parte2.png", width:90%)),
    numbering: none,
    caption: [Monitoramento de processos usando `pmap`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- É possível verificar na imagem acima a linha correspondente à alocação que foi efetuada.
- Os valores para essa alocação referente as colunas `Kbytes`, `RSS` e `Dirty` são respectivamente 16400, 16392 e 16392.
- A coluna Suja (`Dirty`), indica a quantidade de memória virtual que foi escrita pelo processo na RAM dentro do laço `for`. Convertendo o valor observado, é possível ver que 16 KB foram escritos dentro da memória RAM.

== Análise de Páginas Globais e Atividade de Swap (/proc/meminfo e vmstat)
Foi executado o seguinte comando no terminal para inspecionar os contadores de páginas de cache de disco mantidos pelo Kernel:

#sourcecode[```
cat /proc/meminfo | grep -E "Cached|Buffers"
```]
Foi obtido o seguinte retorno com a execução do comando:

#figure(
  figure(
    rect(image("fig1-parte3.png", width:100%)),
    numbering: none,
    caption: [Inspeção dos contadores de paginas de cache de disco]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Foi aberto várias abas de navegador de internet e utilizado o utilitário `vmstat` para atualizar as estatísticas de desempenho a cada 2 segundos do sistema operacional:
\

#figure(
  figure(
    rect(image("fig2-parte3.png", width:97%)),
    numbering: none,
    caption: [Monitoramento das estatísticas de desempenho]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- As colunas de si (_swap in_) e so (_swap out_), indicam, respectivamente, a quantidade de memória que está sendo trazida do disco de volta para a RAM física e a quantidade de memória que está sendo salva da RAM física para o disco.

Executando apenas o comando `cat /proc/meminfo`, é possível encontrar linhas relacionadas ao termo chamado HugePages.

#figure(
  figure(
    rect(image("fig3-parte3.png", width:100%)),
    numbering: none,
    caption: [Retorno do comando `cat /proc/meminfo` ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

_HugePages _se trata de um recurso de gerenciamento de memória que permite a utilização de paginação com tamanhos maiores que 4 KB. Normalmente as _HugePages_ medem 2 MB ou 1 GB e são destinadas a programas que necessitam de uma alocação de memória muito alta. Para não ter que gerenciar muitas de páginas com um tamanho de 4 KB, as _HugePages_ permitem a mesma disponibilidade de armazenamento de dados mas com uma gerência menor de quantidade de páginas.

== Mapeamento de Arquivos em Páginas (mmap)
Foi inicialmente criado um arquivo de texto para testes usando o terminal:

#sourcecode[`
echo "Arquitetura de Computadores e Sistemas Operacionais" > texto.txt
`]

Posteriormente foi criado um arquivo chamado `mapeado.c`:

#sourcecode[```c
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
int main() {
int fd = open("texto.txt", O_RDWR);
if (fd < 0) {
perror("Erro ao abrir arquivo");
return 1;
}
struct stat sb;
fstat(fd, &sb);
// Mapeando o arquivo diretamente em uma pagina de memoria virtual
char *arquivo_em_memoria = mmap(NULL, sb.st_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
if (arquivo_em_memoria == MAP_FAILED) {
perror("Erro no mmap");
return 1;
}
// O arquivo agora pode ser lido como se fosse um vetor na memoria
printf("Conteudo lido da pagina de memoria: %s", arquivo_em_memoria);
// Modificando a memoria diretamente. A MMU e o Kernel sincronizarao com o disco.
arquivo_em_memoria[0] = 'O';
printf("Modificacao feita na memoria. Pressione ENTER para finalizar...");
getchar();
munmap(arquivo_em_memoria, sb.st_size);
close(fd);
return 0;
}
```]

Após compilar e executar o programa, foi verificado o conteúdo final do arquivo de texto criado anteriormente:

#figure(
  figure(
    rect(image("fig1-parte4.png", width:97%)),
    numbering: none,
    caption: [Execução do código `mapeado.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
- É possível verificar que a letra "A" da palavra "_arquitetura_" foi substituída pela letra "O". O mecanismo que permite mapear arquivos em disco diretamente no espaço de endereçamento virtual de um processo, se chama `mmap`. 
- A função `mmap()`, presente na linha 16, permite criar um mapeamento entre o arquivo que está em disco e as páginas da memória virtual do processo. Inicialmente o arquivo é associado a uma região de endereçamento virtual do processo pertencente ao código em execução. 
- Quando o código acessa essa região, a MMU(_Memory Management Unit_) carregam as páginas correspondentes ao arquivo para a memória RAM. O ponteiro `arquivo_em_memoria` aponta para as páginas que foram carregadas pela MMU e qualquer alteração feita nessa memória marca a página com uma memória suja (dirty).
- Por fim, quando as chamadas `munmap()` e `close()` são feitas, as páginas que foram modificadas são gravadas no disco.


#pagebreak()
= Uso de Memória
== Código hello.c
Foi criado o seguinte código:
#sourcecode[```c
#include <stdio.h>
#include <unistd.h>
int global_init = 42; // DATA
int global_uninit; // BSS
int main() {
printf("Hello World!\n");
sleep(600);
}
```]
Para monitorar o uso de memória, foi mapeado utilizando o comando `pmap`.

#figure(
  figure(
    rect(image("fig1-parte5.png", width:100%)),
    numbering: none,
    caption: [Execução e monitoramento do código `hello.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Código alocacao.c
Foi criado o seguinte código para exemplificar a alocação estática, automática e dinâmica:

#sourcecode[```c
#include <stdio.h>
#include <stdlib.h>
int global = 10; // Est´atica
void funcao_auto(int n) {
int local = n; // Autom´atica
printf("Local = %d\n", local);
}
int main() {
funcao_auto(5);
int *ptr = malloc(sizeof(int)); // Dinamica
*ptr = 99;
printf("Dinamica = %d\n", *ptr);
free(ptr);
return 0;
}
```]

Foi realizado a compilação e execução do código:

#figure(
  figure(
    rect(image("fig2-parte5.png", width:100%)),
    numbering: none,
    caption: [Execução do código `alocacao.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Código fatorial.c
Para análise de um exemplo recursivo, foi criado o seguinte código:

#sourcecode[```c
#include <stdio.h>
long fatorial(int n) {
long parcial;
printf("inicio: n = %d\n", n);
if (n < 2)
parcial = 1;
else
parcial = n * fatorial(n - 1);
printf("final : n = %d, parcial = %ld\n", n, parcial);
return parcial;
}
int main() {
printf("Fatorial(4) = %ld\n", fatorial(4));
return 0;
}
```]

Foi realizado a compilação e execução do código:

#figure(
  figure(
    rect(image("fig3-parte5.png", width:100%)),
    numbering: none,
    caption: [Execução do código `fatorial.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= MMU (Memory Management Unit)
A MMU (Memory Management Unit), tem a função de realizar a tradução dos endereços lógicos, que fica dentro do escopo da visão do processo, para o endereço físico, que se trata da localização real na memória RAM. Quando um programa é compilado e executado, o sistema operacional disponibiliza uma parte da memória RAM para o processo conseguir operar. Toda vez que o processador tentar executar uma função de escrita ou leitura, é enviado um endereço virtual. A MMU consulta sua tabela de paginação armazenada na RAM e traduz o endereço virtual para o endereço físico correspondente na memória RAM.
