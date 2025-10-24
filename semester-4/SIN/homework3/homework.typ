#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Representação de sinais periódicos de tempo
  discreto em série de Fourier",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz.",),
  date: "23 de Outubro de 2025",
  doc,
)

= Introdução
Este documento tem o objetivo de mostrar a mostrar os passos para representar um sinal periódico de tempo discreto através da Série de Fourier. Além disso, será mostrado os gráficos de fase e módulo do sinal em questão e os passos feitos para chegar até a resposta do exercício.

= Questão A
O sinal para ser representado em séries de Fourier em tempo discreto da Questão A é representado pela seguinte imagem:
\
\
#figure(
  figure(
    image("q1_a.png", width: 100%),
    numbering: none,
    caption: [Sinal $x[n]$ da questão A]
  ),
  caption: figure.caption([Material disponibilizado pela docente], position: top)
)

\
Para determinar os coeficientes de Fourier, iremos utilizar a seguinte fórmula para $k = 0$ e $k != 0$, onde $N$ é o período do sinal a ser analisado:
$
a_k = 1/N sum_(n=<N>)^(N-1) x[n] e^(-j k (2 pi)/N)^n
$

Analisando o sinal, temos que o período é $N = 5$, começando em $n=0$. Nota-se que o $x[n] = 1$ para todo $n$.
\
\
Substituindo os valores na equação $(1)$, para $K = 0$, temos:

$
a_0 = 1/N sum_(n=0)^(4) x[n] e^0 = 1/N sum_(n=0)^(4) x[n] = 1/N (1+1+1+1+1) = 5/N
$

Para $k != 0$, ao substituir os valores na equação (1), temos o seguinte somatório:

$
a_k = 1/N sum_(n=0)^(4) x[n] e^(-j k (2 pi)/N)^n 
$

Como $x[n] = 1$ para quaisquer valores de $n$, podemos simplificar a expressão para um somatório de PG finita:

$
a_k = 1/N sum_(n=0)^(4) e^(-j k (2 pi)/N)^n 
$

Fazendo o somatório, temos que:

$
a_k = 1/N sum_(n=0)^(4) e^(-j k (2 pi)/N)^n  = 1/N ((e^(-j k (2 pi)/N)^5 - e^(-j k (2 pi)/N)^0)/(e^((-j k (2 pi)/N)) - 1) ) = 1/N ((e^(-j k (2 pi)/N)^5 - 1)/(e^((-j k (2 pi)/N)) - 1) ) .
$

Portanto, temos que os coeficientes $a_0$ e $a_k$ são: 


$
a_0 = 5/N " e "  a_k = 1/N ((e^(-j k (2 pi)/N)^5 - 1)/(e^((-j k (2 pi)/N)) - 1) )  
$
\
Colocando os valores no Matlab, temos o seguinte código para representar o sinal:

#sourcecode[```matlab
n = -20:20;
N = 7;
N1 = 4;
x = 5/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1)))*exp(j*k*(2*pi/N).*n);
end

figure(1)
stem(n,real(x))
title('Representacao de Fourier - Questão A') grid();
axis([-20 20 -1 2])
```]

Ao plotar o gráfico, foi possível verificar que o resultado obtido coincide com o sinal original analisado.

#figure(
  figure(
    image("plotA.png", width: 100%),
    numbering: none,
    caption: [Plotagem do gráfico $x[n]$ da questão A a partir dos coeficientes de Fourier]
  ),
  caption: figure.caption([Autoria própria], position: top)
)

= Questão B
O sinal para ser representado em séries de Fourier em tempo discreto da questão B é representado pela seguinte imagem:
\
\
#figure(
  figure(
    image("q1_b.png", width: 100%),
    numbering: none,
    caption: [Sinal $x[n]$ da questão B]
  ),
  caption: figure.caption([Material disponibilizado pela docente], position: top)
)

\
Analisando o sinal, temos que o período é $N = 4$, começando em $n=0$. Nota-se $x[n] = 1$ para todo $n$.
\
\
Substituindo os valores na equação $(1)$, para $K = 0$, temos:

$
a_0 = 1/N sum_(n=0)^(3) x[n] e^0 = 1/N sum_(n=0)^(3) x[n] = 1/N (1+1+1+1) = 4/N
$

Para $k != 0$, ao substituir os valores na equação (1), temos o seguinte somatório:

$
a_k = 1/N sum_(n=0)^(3) x[n] e^(-j k (2 pi)/N)^n 
$

Como $x[n] = 1$ para quaisquer valores de $n$, podemos simplificar a expressão para um somatório de PG finita:

$
a_k = 1/N sum_(n=0)^(3) e^(-j k (2 pi)/N)^n 
$

Fazendo o somatório, temos que:

$
a_k = 1/N sum_(n=0)^(3) e^(-j k (2 pi)/N)^n  = 1/N ((e^(-j k (2 pi)/N)^4 - e^(-j k (2 pi)/N)^0)/(e^((-j k (2 pi)/N)) - 1) ) = 1/N ((e^(-j k (2 pi)/N)^4 - 1)/(e^((-j k (2 pi)/N)) - 1) ) .
$

Portanto, temos que os coeficientes $a_0$ e $a_k$ são: 


$
a_0 = 4/N " e "  a_k = 1/N ((e^(-j k (2 pi)/N)^4 - 1)/(e^((-j k (2 pi)/N)) - 1) )  
$
#pagebreak()
Colocando os valores no Matlab, temos o seguinte código para representar o sinal:

#sourcecode[```matlab
n = -20:20;
N = 6;
N1 = 3;
x = 4/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1) ))*exp(j*k*(2*pi/N).*n);
end



figure(2)
stem(n,real(x))
title('Representacao de Fourier - Questão B')
grid();
axis([-20 20 -1 2])
```]
\
Ao plotar o gráfico, foi possível verificar que o resultado obtido coincide com o sinal original analisado.

#figure(
  figure(
    image("plotB.png", width: 100%),
    numbering: none,
    caption: [Plotagem do gráfico $x[n]$ da questão B a partir dos coeficientes de Fourier]
  ),
  caption: figure.caption([Autoria própria], position: top)
)
#pagebreak()

= Questão C
O sinal para ser representado em séries de Fourier em tempo discreto da questão C é representado pela seguinte imagem:
\
\
#figure(
  figure(
    image("q1_C.png", width: 100%),
    numbering: none,
    caption: [Sinal $x[n]$ da questão C]
  ),
  caption: figure.caption([Material disponibilizado pela docente], position: top)
)

\
Analisando o sinal, temos que o período é $N = 6$, começando em $n=0$. Nota-se $x[n]$ tem valores diferentes para cada valor de $n$:
\
\
$ x[n] =  cases(
  1 ", "  n= 0,
  2  ", "  n= 1,
  -1", "n= 2,
  0 ", " n= 3,
  -1 ", "n= 4,
  2 ", " n= 5,
  1 ", " n= 6,
  "     "...
) $
\
Substituindo os valores na equação $(1)$, para $K = 0$, temos:

$
a_0 = 1/N sum_(n=0)^(5) x[n] e^0 = 1/N sum_(n=0)^(5) x[n] = 1/N (x[0] + x[1]+ x[2]+ x[3]+ x[4] + x[5]) 
\
= 1/N (1 + 2 -1 + 0 -1 + 2) = 3/N
$

Para $k != 0$, ao substituir os valores na equação (1), temos o seguinte somatório:

$
a_k = 1/N sum_(n=0)^(5) x[n] e^(-j k (2 pi)/N)^n 
$
\
Neste caso como $x[n] != 1$ para todo $n$, não temos a relação de somatório de PG finita.

#pagebreak()

Fazendo o somatório, temos que:
\

$
a_k = 1/N sum_(n=0)^(5) e^(-j k (2 pi)/N)^n  = 1/N (x[0] e⁰ + x[1]e^((-j k (2 pi)/N))¹ + x[2]e^((-j k (2 pi)/N))² + \
+ " "x[3]e^((-j k (2 pi)/N))³ + x[4]e^((-j k (2 pi)/N))⁴ + x[5]e^((-j k (2 pi)/N))⁵)
$
\
Substituindo os valores de $x[n]$ utilizando a definição dada em $(12)$, temos:

$
a_k = 1/N sum_(n=0)^(5) e^(-j k (2 pi)/N)^n  = 1/N (1 + 2e^((-j k (2 pi)/N)) - e^((-j k (2 pi)/N))² -e^((-j k (2 pi)/N))⁴ +2e^((-j k (2 pi)/N))⁵)
$
\
Portanto, temos que os coeficientes $a_0$ e $a_k$ são: 


$
a_0 = 3/N " e "  a_k = 1/N (1 + 2e^((-j k (2 pi)/N)) - e^((-j k (2 pi)/N))² -e^((-j k (2 pi)/N))⁴ +2e^((-j k (2 pi)/N))⁵)
$
\
Colocando os valores no Matlab, temos o seguinte código para representar o sinal:

#sourcecode[```matlab
n = -20:20;
N = 6;
N1 = 5;
x = 3/N;



for k=1:N-1
    x = x + (1/N*(1 + (2*exp(-j*k*(2*pi/N))) - (exp(-j*k*(2*pi/N)*2)) - (exp(-j*k*(2*pi/N)*4)) + (2*exp(-j*k*(2*pi/N)*5)) ))*exp(j*k*(2*pi/N).*n);
end



figure(3)
stem(n,real(x))
title('Representacao de Fourier - Questão C')

grid();
axis([-20 20 -2 4])
```]
\
#pagebreak()
Ao plotar o gráfico, foi possível verificar que o resultado obtido coincide com o sinal original analisado.

#figure(
  figure(
    image("plotC.png"),
    numbering: none,
    caption: [Plotagem do gráfico $x[n]$ da questão C a partir dos coeficientes de Fourier]
  ),
  caption: figure.caption([Autoria própria], position: top)
)
#pagebreak()
= Código completo no Matlab

#sourcecode[```matlab


%LETRA A

n = -20:20;
N = 7;
N1 = 4;
x = 5/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1)))*exp(j*k*(2*pi/N).*n);
end

figure(1)
stem(n,real(x))
title('Representacao de Fourier - Questão A')
grid();
axis([-20 20 -1 2])

%LETRA B

n = -20:20;
N = 6;
N1 = 3;
x = 4/N;

for k=1:N-1
    x = x + (1/N*((exp(-j*k*(2*pi/N)*(N1+1)) - 1)/(exp(-j*k*(2*pi/N)) - 1) ))*exp(j*k*(2*pi/N).*n);
end

figure(2)
stem(n,real(x))
title('Representacao de Fourier - Questão B')
grid();
axis([-20 20 -1 2])

%LETRA C

n = -20:20;
N = 6;
N1 = 5;
x = 3/N;

for k=1:N-1
    x = x + (1/N*(1 + (2*exp(-j*k*(2*pi/N))) - (exp(-j*k*(2*pi/N)*2)) - (exp(-j*k*(2*pi/N)*4)) + (2*exp(-j*k*(2*pi/N)*5)) ))*exp(j*k*(2*pi/N).*n);
end

figure(3)
stem(n,real(x))
title('Representacao de Fourier - Questão C')
grid();
axis([-20 20 -2 4])

```]


= Conclusão

Portanto, verifica-se que, por meio do desenvolvimento da Série de Fourier para sinais discretos, foi possível representar o sinal a partir dos coeficientes calculados, atendendo plenamente aos resultados esperados.