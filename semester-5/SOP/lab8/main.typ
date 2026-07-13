#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Gerência de Memória",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz.",),
  date: "2 de Junho de 2026",
  doc,
)

= Conhecendo a Memória do Sistema
Dentro da máquina local, foi executado o seguinte comando:

#sourcecode[```
free -h
```]

Ao executar o comando supracitado, foi obtido o seguinte resultado:
\
\
#figure(
  figure(
    rect(image("parte1/fig1-parte1.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `free -h`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
A partir do retorno, foi possível anotar os seguintes valores referentes a utilização da memória do computador:

- Memória RAM total: 14 GBs
- Memória RAM utilizada: 4,6 GBs
- Memória RAM livre: 8,1 GBs
- Espaço total de Swap: 4,5 GBs
\
*O que é memória Swap?*

A memória Swap é uma parte do HD ou SSD que é utilizada como extensão  da memória RAM do Sistema Operacional. Ela é utilizada quando a memória RAM do computador fica cheia, armazenando temporariamente processos que estão inativos para liberar espaço de utilização para os programas que estão sendo executados no momento, evitando travamentos no sistema operacional

\
= Informações Detalhadas da memória
Para realizar o acesso as informações sobre a memória através do sistema de arquivos, foi executado o seguinte comando:

#sourcecode[```
cat /proc/meminfo

```]
#pagebreak()
Ao executar o comando, foi obtido o seguinte resultado:


#figure(
  figure(
    rect(image("parte2/fig1-parte2.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `cat /proc/meminfo`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Com isso, foi possível anotas as seguintes informações sobre a memória do sistema operacional:
- *MemTotal:* 15726908 kB = 15.72 Gbps
- *MemFree:* 8432356 kB = 8.43 Gbps
- *Buffers:* 175696 kB = 175.696 Mbps
- *Cached:* 2632500 kB = 2.6325 Gbps
- *Swap Total:* 4729852 kB = 4.72 Gbps
- *SwapFree:* 4729852 kB = 4.72 Gbps

\
*O que representa a memória cache?*

A memória cache é um tipo de armazenamento aleatório de dados que é utilizado para armazenar informações que são acessadas frequentemente para obter um tempo de resposta mais rápido em comparação com outros tipos de armazenamentos. A medida que mais dados vão sendo armazenados no cache, menos tempo se perde acessando os dados da memória RAM.
\
\
*Por que o Linux utiliza parte da RAM como cache?*

O Linux utiliza parte da memória RAM livre como cache para aumentar o desempenho do sistema. Em vez de deixar a memória que não está sendo usada sem utilidade, o sistema operacional armazena nela arquivos e dados acessados recentemente, para que quando forem novamente acessados, o tempo de resposta seja muito menor.

= Monitorando Processos
Foi executado o seguinte comando para observar o consume de memória dos processos em execução:

#sourcecode[```
top
```]

Ao executar o comando, foi obtido o seguinte resultado:
#figure(
  figure(
    rect(image("parte3/fig1-parte3.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `top`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

*Identifique os cinco processos que mais consomem memória:*
\
Os processos que mais consomem memória são:
- PID 3439: firefox-esr -  MEM: 5,6%
- PID 16505: Isolated Web Co - MEM: 4,7%
- PID 16164: Isolated Web Co - MEM: 3,9%
- PID 3150: gnome-software - MEM: 2,3%
- PID 2989: cinnamon - MEM: 1,7%

*Responda:*
\
*(a) Qual processo consome mais memória?*
\
O processo que mais consome memória é o firefox-esr, utilizando 5,6% da memória disponível.
\
*(b) Esse processo pertence ao sistema operacional ou ao usuário?*
\
Pertence ao usuário, conforme indicado na coluna `USUARIO`. Como se trata de um navegador, faz parte de uma aplicação para usuário e não um serviço essencial do sistema operacional.
#pagebreak()


= Criando Consumo Artificial de Memória
Para criar um programa que consome boa parte da memória RAM, foi utilizado os seguintes comandos:
\
1) Foi aberto o interpretador python utilizando o terminal do computador:
#sourcecode[```
python3
```]
2) Foi digitado o seguinte comando:
#sourcecode[```
dados = [0] * 1000000000
```]

3) Foi um terminal para monitorar o consumo da memória RAM:
#sourcecode[```
free -h
```]

#figure(
  figure(
    rect(image("parte4/fig1-parte4.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `free -h`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

4) Em seguida foi listado os processos do sistema com o seguinte comando:
#sourcecode[```
top
```]

#figure(
  figure(
    rect(image("parte4/fig2-parte4.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `free -h`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
#pagebreak()
*Responda:*
\
\
*(a) Quanto a memória utilizada aumentou?*
\
De acordo com a figura 4, a memória RAM usado passou a ser de 12 GB. De acordo com a figura 1, que lista a memória utilizada antes do código ser executado, a memória era de 4,6 GB, resultando em um aumento de 7,4 GB de consumo. 
\
\
*(b) O processo Python apareceu entre os maiores consumidores de memória?*
\
Sim. De acordo com a listagem de processos da figura 5, é possível observar que o processo Python consumiu 49,7% da memória RAM do sistema, sendo listado como o que mais consome memória RAM.
\
\
*(c) O que aconteceu com a quantidade de memória livre?*
\
Foi diminuída consideravelmente. De acordo com a figura 5, o sistema operacional possui  263 MB livres. Em comparação com a figura 1, que lista a memória livre antes do código ser utilizado, é possível observar que havia 8,1 GB livres.
\
\
= Mapeando a Hierarquia de Memória (Caches e RAM)
Foi utilizado o seguinte comando para listar informações sobre os níveis de cache instalados no processador:

#sourcecode[```
lscpu | grep -i "cache"
```]

Ao executar o comando, foi obtido o seguinte resultado:
\
\
#figure(
  figure(
    rect(image("parte5/fig1-parte5.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `lscpu | grep -i "cache"`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Para entender a geometria do cache de L1 de dados, foi utilizado os seguintes comandos:
#sourcecode[```
cat /sys/devices/system/cpu/cpu0/cache/index0/size

cat /sys/devices/system/cpu/cpu0/cache/index0/type
```]
#pagebreak()
Ao executar o comando, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("parte5/fig2-parte5.png", width:100%)),
    numbering: none,
    caption: [Execução dos comandos de validação de cache L1 ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

*Qual é o tamanho dos caches L1, L2 e L3 da sua máquina? Explique, com base na teoria
da pirâmide de memória, por que o cache L1 é drasticamente menor do que a memória RAM
instalada.*


O tamanho da memória cache L1 é drasticamente menor que a da memória RAM devido ao fato de que ela é utilizada para armazenar temporariamente os dados e instruções que são acessados frequentemente, o que normalmente ocupa um espaço muito pequeno. Diferentemente da memória RAM, que necessita armazenar programas e dados que ocupam mais espaço dentro do sistema operacional. 

Analisando o retorno do comando da figura 6, foi possível observar os seguintes valores referentes as memórias de cache:
- *L1:* 192 KB
- *L2:* 3 MB 
- *L3:* 16 MB
#pagebreak()

= Explorando a Memória Virtual
Foi executado o seguinte comando para verificar as estatísticas relacionadas ao uso da memória virtual:

#sourcecode[```
vmstat 2
```]
Ao executar o comando, foi obtido o seguinte resultado:
\
#figure(
  figure(
    rect(image("parte6/fig1-parte6.png", width:100%)),
    numbering: none,
    caption: [Execução do comando `vmstat 2`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

*(a) Houve movimentação entre RAM e swap?*\
Não. Os campos si (swap in) e so (swap out) estão zerados (0) em todo o histórico de observação. Isso significa que nenhum dado foi lido do disco para a RAM e nenhum dado foi gravado da RAM para a área de swap durante o período observado.
\
\
*(b) O sistema apresentou sinais de falta de memória?*
\
Não. O sistema está trabalhando com total folga de memória, pois a coluna de *memória livre* permanece constante e sem realizar swap de memória RAM.

#pagebreak()
= Explorando Endereços Lógicos
1) Foi criado o arquivo `endereco.c` com o seguinte código:

#sourcecode[```c
#include <stdio.h>
int global = 10;
int main() {
int local = 20;
printf("Endereco da variavel global: %p\n", &global);
printf("Endereco da variavel local : %p\n", &local);
getchar();
return 0;
}
```]

Ao compilar e executar o código, foi obtido o seguinte retorno:

#figure(
  figure(
    rect(image("parte7/fig1-parte7.png", width:100%)),
    numbering: none,
    caption: [Retorno do código `endereco.c`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Foi mantido o programa em execução e aberto outro terminal para obter o PID do processo do código com o seguinte comando:

#sourcecode[```
ps aux | grep endereco
```]

Ao executar o comando, foi obtido o seguinte PID:
#figure(
  figure(
    rect(image("parte7/fig2-parte7.png", width:100%)),
    numbering: none,
    caption: [PID do processo ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Por fim, foi visualizado o mapa de memória do processo com o seguinte comando:
#sourcecode[```
cat /proc/28427/maps
```]

Ao executar o comando, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("parte7/fig3-parte7.png", width:100%)),
    numbering: none,
    caption: [Retorno do comando `cat /proc/28427/maps` ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Ao visualizar o mapa de memória, é possível observar as seguintes regiões:

- *Código do programa:* 562e46d63000 - 562e46d68000
- *Heap:* 562e7bde5000 - 562e7be06000
- *Stack:* 7ffee0965000 - 7ffee0986000
- *Bibliotecas compartilhadas:* 7fb113acd000 - 7fb113d14000

#pagebreak()
= Explorando Espaços de Endereçamento
Foi aberto dois terminais e executado de maneira simultânea o programa `endereco.c` do exercício anterior.

#figure(
  figure(
    rect(image("parte8/fig1-parte8.png", width:90%)),
    numbering: none,
    caption: [Execução simultânea do programa `endereco.c` ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
- É possível verificar que o endereço da variável global é o mesmo para ambos os programas. Somente o endereço da variável local é alterado.
- Isso acontece porque o armazenamento da variável global é feito de maneira estática enquanto o da variável local é feita de maneira automática.

Ao buscar o PID de cada processo em execução do código, foi obtido o seguinte retorno

#figure(
  figure(
    rect(image("parte8/fig2-parte8.png", width:100%)),
    numbering: none,
    caption: [PIDs dos processos do código `endereco.c` ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#pagebreak()

Fazendo a busca pelo mapa de memória de cada processo:

#figure(
  figure(
    rect(image("parte8/fig3-parte8.png", width:100%)),
    numbering: none,
    caption: [Mapa de memória do processo com PID 28961 ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("parte8/fig4-parte8.png", width:100%)),
    numbering: none,
    caption: [Mapa de memória do processo com PID 28964 ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Com isso, foi possível verificar que cada processo possui seu próprio espaço de endereçamento lógico, pois possuem o mesmo mapa de memória para PIDs diferentes.