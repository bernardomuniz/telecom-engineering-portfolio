#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Laboratório 4 - Ciclo de Vida e Estados de Processos
",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz",),
  date: "28 de Março de 2026",
  doc,
)

= Questões

*1) Qual a diferença entre os estados Ready (Pronto) e Running (Executando) observada durante o uso do comando top?*

- *Running:* neste estado, o processo está usando um núcleo da CPU e processando linhas de instruções para ser operado.

- *Ready:* quando um processo possui todos os recursos necessários para executar mas está esperando sua vez na fila.
\
\
*2. Ao executar pstree, você notou que o xeyes é filho de qual processo?*
\
\
Ao executar o comando `pstree`, foi possível observar que ele é filho do processo *`bash`*, que foi aonde o processo foi executado.

#figure(
  figure(
    rect(image("pstreexeyes.png", width: 90%)),
    numbering: none,
    caption: [Retorno do comando `pstree`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
Se buscarmos pelo PID do processo, podemos ver os processos pai e avô do processo *bash*.
#figure(
  figure(
    rect(image("pstreexeyes2.png", width: 90%)),
    numbering: none,
    caption: [Árvore de processo do comando `xeyes`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
*3) Explique por que, ao aumentarmos o valor de nice para 15, o processo tende a usar menos
CPU quando há outros processos ativos.*
\
\
Ele usa menos processamento pois está com uma ordem de prioridade menor que os outros processos da fila. Como o valor de nice é 15, o  kernel do computador utiliza menos tempo de execução para o processo em questão, ou seja, quando ele consegue usar a CPU, é finalizado em menos tempo do que processos que possuem prioridades menores.
#pagebreak()
*4) O que acontece com o registro de um processo no SO quando enviamos um sinal kill -9?*
\
\
O comando kill serve para encerrar processos em execução. Neste caso, se temos um processo em está em execução (running) e o usuário faz uma chamada de sistema com "kill -9", o kernel interrompe o fluxo de execução do processo e faz a limpeza total do programa.