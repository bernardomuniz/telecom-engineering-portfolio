#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Laboratório 5 - Programação com Threads",
  subtitle: "Sistemas Operacionais",
  authors: ("Bernardo Souza Muniz",),
  date: "31 de Março de 2026",
  doc,
)

= Experimento 1

Ao executar o comando `ps -fgl`, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("experimento1.png", width: 100%)),
    numbering: none,
    caption: [Retorno do comando `ps -fgl`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

É possível observar que o processo filho tem o PID 27559. Se observamos na aba deste processo ele tem o PPID 27558, que é o mesmo PID do processo acima. Ou seja, neste caso o processo pai é o 27559 e o filho 27558.

= Experimento 2
Ao executar o comando `ps -fgl`, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("experimento2.png", width: 100%)),
    numbering: none,
    caption: [Retorno do comando `ps -fgl`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- O processo que executou o comando `ls` foi o processo com PID 27382. No código do programa é possível observar que se a chamada   `fork()` for executada (processo filho criado), o programa executa o `excve` com o comando `ls`. Além disso, no retorno do comando da figura 2, o PID do processo filho tem uma flag `[ls] <defunct>`, indicando que o processo filho ainda não terminou de executar a listagem de arquivos no diretório atual. 

- No código original, é feito um fork(), o processo filho é criado e antes de acontecer o `execve()`, é mostrado na tela o PID do processo pai, o código `execve()` é executado e após isso é feito uma esperada de 30 segundos com a função `sleep()`. 

- Em comparação com o experimento 1, neste é possível ver que o PID dos processos pai e filho mudam e o código nova faz a chamada da função `execve()`.
#pagebreak()

= Experimento 3
Ao executar o comando `pstree | grep multi_fork` e `pstree -p | grep multi_fork`, foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("experimento3.png", width: 100%)),
    numbering: none,
    caption: [Retorno do comando `pstree | grep multi_fork`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("experimento3_2.png", width: 100%)),
    numbering: none,
    caption: [Retorno do comando `pstree -p | grep multi_fork`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


- Foram criados ao todo 8 processos.

- Porque a cada fork é gerado um processo pai e um processo filho. Como são 3 laços de repetição, cada laço cria mais um pai e mais um filho, pois cada processo gerado executa o fork, criando uma ordem de $2³$.

- A árvore de processo pode ser visualizada da seguinte maneira:

#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#diagram(
  spacing: (2mm, 6mm),
  node-stroke: 0.5pt,
  edge-stroke: 0.5pt,
  
  // Nível 0
  node((0, 0), `multi_fork (35672)`, name: <root>),
  node((1, 1), `multi_fork (35673)`, name: <n1>),
  node((2, 2), `multi_fork (35675)`, name: <n2>),
  node((3, 3), `multi_fork (35679)`, name: <n3>),
  node((2, 4), `multi_fork (35678)`, name: <n4>),
  node((1, 5), `multi_fork (35674)`, name: <n5>),
  node((2, 6), `multi_fork (35677)`, name: <n6>),
  node((1, 7), `multi_fork (35676)`, name: <n7>),

  edge(<root>, <n1>, corner: left),
  edge(<n1>, <n2>, corner: left),
  edge(<n2>, <n3>, corner: left),
  edge(<n1>, <n4>, corner: left),
  edge(<root>, <n5>, corner: left),
  edge(<n5>, <n6>, corner: left),
  edge(<root>, <n7>, corner: left),

)

= Experimento 4
== Código 1
- Seguindo a mesma lógica do código anterior, serão gerados 4 processos. Como temos 2 forks, o trecho de código segue a ordem de $2^n$, sendo n o número de processos duplicados.
- Será exibida 4 vezes. Cada um dos processos duplicados executa a linha da mensagem de "Oi".
- São 4 processos, no primeiro fork são gerados dois processos e estes quando executam novamente o segundo fork, geram mais dois filhos. Temos a seguinte árvore de processos:

#diagram(
  spacing: (12mm, 8mm),
  node-stroke: 0.5pt,
  edge-stroke: 0.5pt,
  
  // Nível 0
  node((0, 0), `exemplo1`, name: <root>),
  node((1, 1), `exemplo1`, name: <n1>),
  node((2, 2), `exemplo1`, name: <n2>),
  node((2, 3), `exemplo1`, name: <n3>),

  edge(<root>, <n1>, corner: left),
  edge(<n1>, <n2>, corner: left),
  edge(<root>, <n3>, corner: left),
)
\
\
Executando o código, foi possível observar que o as expectativas foram atingidas. O código gerou quatro processos e cada um deles imprimiu uma mensagem de "Oi"
#figure(
  figure(
    rect(image("exemplo4.png", width: 100%)),
    numbering: none,
    caption: [Execução do código do exemplo 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Código 2
- Seguindo a mesma lógica do código anterior, serão gerados 8 processos. Como temos 3 forks, o trecho de código segue a ordem de $2^n$, sendo n o número de processos duplicados.
- Será exibido 8 vezes. Cada um dos processos duplicados executa a linha da mensagem "Oi"
- São 8 processos, no primeiro fork são gerados dois processos e estes quando executam novamente o segundo fork, geram mais dois filhos. Temos a seguinte árvore de processos:

#diagram(
  spacing: (12mm, 8mm),
  node-stroke: 0.5pt,
  edge-stroke: 0.5pt,
  
  // Nível 0
  node((0, 0), `exemplo2`, name: <root>),
  node((1, 1), `exemplo2`, name: <n1>),
  node((2, 2), `exemplo2`, name: <n2>),
  node((3, 3), `exemplo2`, name: <n3>),
  node((2, 4), `exemplo2`, name: <n4>),
  node((1, 5), `exemplo2`, name: <n5>),
  node((2, 6), `exemplo2`, name: <n6>),
  node((1, 7), `exemplo2`, name: <n7>),

  edge(<root>, <n1>, corner: left),
  edge(<n1>, <n2>, corner: left),
  edge(<n2>, <n3>, corner: left),
  edge(<n1>, <n4>, corner: left),
  edge(<root>, <n5>, corner: left),
  edge(<n5>, <n6>, corner: left),
  edge(<root>, <n7>, corner: left),

)
\
\
Executando o código, foi possível observar que o as expectativas foram atingidas. O código gerou oito processos e cada um deles imprimiu uma mensagem de "Oi"
\
\
#figure(
  figure(
    rect(image("exemplo4_2.png", width: 90%)),
    numbering: none,
    caption: [Execução do código do exemplo 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- O crescimento exponencial pode ser explicado da seguinte maneira: Quando fazemos um único fork, dois processos são gerados (o pai, que ja existia, e o filho, que foi duplicado). Se realizarmos mais um fork, o pai original cria mais um filho e o filho original cria outro filho. Conforme mais forks vão sendo executados, o código é executado tanto pelo pai e filho original,  quanto pelo seus filhos.

= Experimento 5
1) Quem encaminha a última mensagem é o processo pai. Isso acontece porque a chamada `wait()` faz com que o processo pai entre em processo de espera e volte a executar somente quanto seu filho foi encerrado.

#figure(
  figure(
    rect(image("exemplo5.png", width: 100%)),
    numbering: none,
    caption: [Execução do código do exemplo 5 com `wait()`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


2) Não, o processo pai terminou antes do filho e o filho ficou imprimindo mensagens depois que o pai havia encerrado.

#figure(
  figure(
    rect(image("exemplo5_2.png", width: 100%)),
    numbering: none,
    caption: [Execução do código do exemplo 5 sem `wait()`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

3) *WIFEXITED* verifica se o filho encerrou normalmente. Ele utiliza uma chamada com return ou `exit()` retornando um valor maior que zero. No exemplo, depois que o código do filho  foi executado, foi feito um `exit(42)` para verificar se o filho encerrou.
\

*WEXITSTATUS* guarda o código de retorno do processo filho. No exemplo, o filho usou `exit(42)`. O macro *WEXITSTATUS* guarda o valor 42 para que o processo pai consiga imprimi-lo.
\
\
4) Um processo zumbi é um filho que terminou, porém ainda não desapareceu do sistema completamente. Se usarmos o comando `htop` veremos o estado do processo como zumbi, guardando seu PID e ocupando um lugar na tabela de processos. A chamada `wait()` entrega o status do filho ao pai. Como o pai sabe que o filho terminou e que não é mais necessário a existência do processo, a tabela de processos é liberada.
#pagebreak()

= Experimento 6
- Listando as threads que foram criadas.
#figure(
  figure(
    rect(image("exp6.png", width: 100%)),
    numbering: none,
    caption: [Execução do comando `ps -eL | grep exp01`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- Listando os arquivos que o processo abriu.
#figure(
  figure(
    rect(image("exp6_2.png", width: 100%)),
    numbering: none,
    caption: [Execução do comando `lsof -p`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Experimento 7
Ao visualizar a árvore de processos depois de ter executado o código. foi obtido o seguinte resultado:

#figure(
  figure(
    rect(image("ex7.png", width: 100%)),
    numbering: none,
    caption: [Processos no `htop`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

1)  A cada 30 segundos uma thread filha é encerrada e a linha desaparece da visualização no `htop`. A linha a ser apagada fica na cor azul.
\
\
2) Cada thread possui um PID diferente da thread pai.
\
\
3) O processo pai é o último a finalizar por causa do uso da função `pthread_join(threads[i], NULL)` dentro do laço de repetição. Como foi o processo pai que fez a chamada, ele suspende a execução da thread principal até que cada thread com índice `i` termine sua tarefa.
\
\
4) Ao executar o programa e pressionar Crtl+C, o programa finaliza e todas as threads são encerradas. Isso acontece pois estamos encerrando o processo pai, como as threads filhas compartilham o mesmo espaço de memória, também são encerradas junto com o pai e não se tornam threads orfãs.

= Experimento 8
1 e 2) Executando o código várias vezes, foi obtido diferentes valores do contador.
#figure(
  figure(
    rect(image("ex8.png", width: 55%)),
    numbering: none,
    caption: [Execução do código `race_condition`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

3) O resultado muda pois as duas threads estão rodando simultaneamente dentro do processados, desta forma, cada etapa do contador pode ser sobrescrita por outra thread. Cada vez que o código é executado, o processador pode dar mais tempo para um thread rodar e pode interromper a outra.
\
4) Executando três vezes o mesmo código, foi observado valores diferentes no tempo de execução.


#figure(
  figure(
    rect(image("ex8_2.png", width: 60%)),
    numbering: none,
    caption: [Tempo de execução do código `race_condition`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Experimento 9 
- Executando o código e abrindo o `htop`, foi possível observar a seguinte árvore de processos

#figure(
  figure(
    rect(image("exp9.png")),
    numbering: none,
    caption: [Visualização dos processos no `htop`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- Foi mudado a prioridade do processo pai de 0 para -20 com o comando `renice -n  20 13912`


#figure(
  figure(
    rect(image("exp9_2.png")),
    numbering: none,
    caption: [Mudando a prioridade do processo pai usando `renice`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- No `htop` foi possível observar o processo pai com a nova prioridade

#figure(
  figure(
    rect(image("exp9_3.png")),
    numbering: none,
    caption: [Nova prioridade do processo pai no `htop`]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Experimento 10
- Inicialmente, foi executado o código seguido de um `Crtl+Z` e `bg` para deixar o programa em background.

#figure(
  figure(
    rect(image("exp10.png")),
    numbering: none,
    caption: [Execução do código]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- Para derrubar o servidor, foi inicialmente buscado seu PID em um novo terminal. Posteriormente utilizado o comando `kill -9 [PID]` para encerrar o processo.

#figure(
  figure(
    rect(image("exp10_2.png")),
    numbering: none,
    caption: [Encerrando o processo do servidor]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- No terminal antigo, foi possível observar que o código encerrou e parou sua execução depois do comando `kill`.

#figure(
  figure(
    rect(image("exp10_3.png"), width: 80%),
    numbering: none,
    caption: [Código parando execução]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)