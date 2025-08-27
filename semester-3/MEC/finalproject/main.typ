#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#set highlight(
  fill: rgb("#c1c7c3"),
  stroke: rgb("#6b6a6a"),
  extent: 2pt,
  radius: 0.2em, 
  ) 

#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Avaliação 3",
  subtitle: "Mecânica dos sólidos",
  authors: ("Bernardo Souza Muniz",),
  date: "14 de Julho de 2025",
  doc,
)

= Introdução
Este relatório tem como objetivo apresentar a resolução das questões propostas no projeto final da disciplina de Mecânica dos sólidos. As questões abordam temas de momento fletor, esforço cortante e tensão de flexão.

= Dados fornecidos
Para a resolução das questões abaixo, foram utilizados os dados de força e tensão da linha B.
#figure(
  figure(
    table(
      align: auto,
      columns: 6,
      [*Aluno(a)*], [*F1 (kN)*], [*F2 (kN)*], [*F3 (kN/m)*], [*F4 (kN)*], [*T1 (kN·m)*],
      [A], [52], [26], [17], [34], [4],
      [B], [17], [9], [6], [12], [2],
      [C], [97], [49], [32], [64], [1],
      [D], [12], [6], [27], [8], [2],
      [E], [80], [40], [27], [54], [1],
      [F], [14], [9], [6], [12], [1],
      [G], [24], [49], [32], [64], [2],
      [H], [12], [26], [17], [34], [1],
      [I], [20], [40], [27], [54], [1],
      [J], [10], [9], [6], [12], [2],
    ),
    numbering: none,
    caption: [Tabela de valores fornecidos para resolução das questões]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 1
Desenhe os diagramas de esforço cortante e momento fletor para a viga bi-apoiada. Considere que a viga tenha secção de 12cm x 30cm. Determine qual é a tensão máxima de flexão.

#figure(
  figure(
    rect(image("Q1/Q1.png")),
    numbering: none,
    caption: [Questão 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Inicialmente, temos que o somatório das forças no eixo $y$ é zero, considerando as forças de reação $R_A$  e $R_B$ na viga:

#figure(
  figure(
    rect(image("Q1/reacoesq1.png", width: 93%)),
    numbering: none,
    caption: [Reações na viga bi-apoiada - Questão 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
$
  sum F_y = 0 arrow.r.double R_A - 17 k N - 9 k N + R_B = 0
$

Desta forma, temos a seguinte relação:

$
  R_A + R_B = 26 "kN"
$

Em seguida, temos que o somatório dos momentos no ponto A é zero:

$
  sum M_A =  0 arrow.r.double R_B ⋅ 14 - 17k N ⋅ 6 - 9k N ⋅ 14 - 22 ⋅ 12 = 0
$

Resolvendo, temos que:

$
  R_B = (68 + 72)/12 = (140 k N)/12 therefore R_B = 11,67 "kN"
$

Substituindo o valor de $R_B$ na relação $R_A + R_B = 26 "kN"$, temos que:

$
 R_A + R_B = 26k N arrow.r.double R_A = 26 - R_B arrow.r.double R_A = 26 - 11,67 therefore R_A = 14,33 "kN"
$

== Cálculo do esforço cortante e momento fletor
=== Seção 1 ($0 <= x <= 4$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
  V(x) = R_A therefore V(x) = 14,33 "kN"
$

Para o cálculo do momento fletor, temos

$
M (x)= R_A ⋅x arrow.r.double M(x) = 14,33x
$

Substituindo os valores do intervalo:
\
\
Para $x = 0$:
$
M(0) = 14,33 "kN" ⋅ 0 = 0
$

Para $x = 4$:
$
M(4) = 14,33k N ⋅ 4 = 57,32 "kN⋅m"
$

=== Seção 2 ($4 <= x <= 8$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:
$
  V(x) = 17 - 14,33 therefore V(x) = - 2,67 "kN"
$
\
Em seguida, fazemos o cálculo do o momento fletor:

$
  M(x) = R_A  ⋅x - 17(x-4)
$

Resolvendo, temos:

$
M(x) = 14,33x - 17x + 68 arrow.r.double M(x) = -2,67x + 68
$
Substituindo o valor do intervalo:
\
\
Para $x = 4$:

$
M(4)  =- 2,67 ⋅ 4 + 68 = 57,32 "kN"
$

Para $x = 8$:

$
M(8)  =- 2,67 ⋅ 8 + 68 = 46,64 "kN⋅m"
$


=== Seção 3 ($8 <= x <= 12$): 
Para o cálculo do esforço cortante,  temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
V(x) = -2,67 - 9 therefore V(x) = -11,67 "kN"
$

Em seguida, fazemos o cálculo do o momento fletor:
$
M(x) = R_A ⋅ x −17(x−4)−9(x−8)
$

Resolvendo, temos:

$
M(x) = 14,33x - 17x +68 - 9x + 72 arrow.r.double M(x) = -11,67x + 140
$

Para $x = 8$:

$
M(8) = −11,67⋅8+140= 46,64 "kN⋅m"
$

Para $x = 12$:

$
M(12) = -11,67⋅12+140=−140,04+140 = -0,04 "kN⋅m"
$
\
Com isso, finaliza-se a análise de cada secção da viga bi-apoiada. Nota-se que temos o valor de momento fletor máximo $57,32 k N ⋅m$ atingido no ponto $x = 4$. Utilizaremos o valor de $M_max$ para calcular a tensão máxima de flexão. 


=== Diagramas de momento fletor e esforço cortante
Uma vez calculados os valores de momento fletor e esforço cortante, temos os seguintes gráficos:

#figure(
  figure(
    rect(image("Q1/esforcocortanteq1.png")),
    numbering: none,
    caption: [Gráfico de esforço cortante da Questão 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("Q1/momentofletorq1.png")),
    numbering: none,
    caption: [Gráfico de momento fletor da Questão 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Tensão máxima de flexão
Primeiramente, calculamos o centro de gravidade $c$ na secção transversal da viga:

$
c = h/2 = 30/2=15 c m therefore c = 0,15 "m"
$

Agora fazemos o cálculo do momento de inércia da viga utilizando os valores de largura e altura:

$
I = (b h³)/12 = (0,12 ⋅ (0,3)³)/12 = (0,12 ⋅(0,027))/12 = 0,00027 "kg⋅m²"
$

Para calcular a tensão máxima de flexão, utilizamos a seguinte fórmula:

$
sigma_max = (M_max ⋅ c)/I
$

O valor da variável $M_max$ é conhecido do cálculo de momentos de flexão, sendo $M_max = 57,32k N$.
\
\
Substituindo os valores na equação, temos:

$
  sigma_max = (57320 ⋅ 0,15)/(0,00027) = 31,85 "MPa"
$

= Questão 2
Desenhe os diagramas de esforço cortante e momento fletor para a viga bi-apoiada. A viga tem perfil retangular com medidas de 8cm x 25cm. Determine também qual é a tensão máxima de flexão.

#figure(
  figure(
    rect(image("Q2/Q2.png")),
    numbering: none,
    caption: [Questão 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Inicialmente, temos que o somatório das forças no eixo $y$ é zero, considerando as forças de reação $R_A$  e $R_B$ na viga:

#figure(
  figure(
    rect(image("Q2/reacoesq2.png",width: 90%)),
    numbering: none,
    caption: [Reações na viga bi-apoiada - Questão 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
$
  sum F_y = 0 arrow.r.double R_A - 17 k N  + R_B = 0
$

Desta forma, temos a seguintes relação:

$
R_A + R_B = 17 "kN"
$

Em seguida, temos que o somatório dos momentos no ponto A é zero:

$
  sum M_A =  0 arrow.r.double R_B ⋅ 6 - 17 "kN" ⋅ 4 = 0
$

Resolvendo, temos que:

$
  R_B = (17 ⋅ 4)/6 = (68 k N)/6 therefore R_B = 11,34 "kN"
$

Substituindo o valor de $R_B$ na relação $R_A + R_B = 17 "kN"$, temos que:

$
 R_A + R_B = 17k N arrow.r.double R_A = 17 - R_B arrow.r.double R_A = 17 - 11,34 therefore R_A = 5,67 "kN"
$

== Cálculo do esforço cortante e momento fletor
=== Seção 1 ($0 <= x <= 4$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
  V(x) = R_A therefore V(x) = 5,67" kN"
$
\
\
Para o cálculo do momento fletor, temos

$
M (x)= R_A ⋅x arrow.r.double M(x) = 5,67x
$

Substituindo os valores do intervalo:
\
\
Para $x = 0$:
$
M(0) = 5,67k N ⋅ 0 = 0
$

Para $x = 4$:
$
M(4) = 5,67k N ⋅ 4 = 22,68 "kN⋅m"
$
=== Seção 2 ($4 <= x <= 6$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
  V(x) = R_A - 17 arrow.r.double V_x = 5,67-17therefore V(x) = -11,33" kN"
$
Para o cálculo do momento fletor, temos

$
M(x) = R_A ⋅ x −17(x−4)
$

Resolvendo, temos que:

$
M(x) = 5,67x - 17x + 68 arrow.r.double M(x) = -11,33x + 68
$
Substituindo os valores do intervalo:
\
\
Para $x = 4$:

$
M(4) = -11,33⋅ 4 + 68 = 22,68 "kN⋅m"
$

Para $x = 8$:

$
M(8) = -11,33⋅ 8 + 68 = - 22,64 "kN⋅m"
$
\
Com isso, finaliza-se a análise de cada secção da viga bi-apoiada. Nota-se que temos o valor de momento fletor máximo $22,68 "kN⋅m"$ atingido no ponto $x = 4$. Utilizaremos o valor de $M_max$ para calcular a tensão máxima de flexão.
\
\
\
\
\
\
\
\
=== Diagramas de momento fletor e esforço cortante
Uma vez calculados os valores de momento fletor e esforço cortante, temos os seguintes gráficos:

#figure(
  figure(
    rect(image("Q2/esforcocortanteq2.png")),
    numbering: none,
    caption: [Gráfico de esforço cortante da Questão 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("Q2/momentofletorq2.png")),
    numbering: none,
    caption: [Gráfico de momento fletor da Questão 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
\
\
== Tensão máxima de flexão
Primeiramente, calculamos o centro de gravidade $c$ na secção transversal da viga:

$
c = h/2 = 25/2=12,5 "cm" therefore c = 0,15 "m"
$

Agora fazemos o cálculo do momento de inércia da viga utilizando os valores de largura e altura:

$
I = (b h³)/12 = (0,08 ⋅ (0,25)³)/12 = (0,08 ⋅(0,015625))/12 = 0,010416 "kg⋅m²"
$

Para calcular a tensão máxima de flexão, utilizamos a seguinte fórmula:

$
sigma_max = (M_max ⋅ c)/I
$

O valor da variável $M_max$ é conhecido do cálculo de momentos de flexão, sendo $M_max = 22,68 "kN"$.
\
\
Substituindo os valores na equação, temos:

$
  sigma_max = (22680 ⋅ 0,125)/(0,010416) = 27,2 "MPa"
$

= Questão 3
Desenhe os diagramas de esforço cortante e momento fletor para a viga mostrada abaixo:

#figure(
  figure(
    rect(image("Q3/Q3.png")),
    numbering: none,
    caption: [Questão 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Inicialmente, temos que o somatório das forças no eixo $y$ é zero, considerando as forças de reação $R_A$  e $R_B$ na viga:

#figure(
  figure(
    rect(image("Q3/reacoesq3.png")),
    numbering: none,
    caption: [Questão 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

$
  sum F_y = 0 arrow.r.double R_A - 17 k N - 9 k N  - 12k N+ R_B = 0
$

Desta forma, temos a seguinte relação:

$
  R_A + R_B = 38" kN"
$

Em seguida, temos que o somatório dos momentos no ponto A é zero:

$
 sum M_A =  0 arrow.r.double R_B ⋅ 14 - 17k N ⋅ 6 - 9k N ⋅ 14 - 22 ⋅ 12k N = 0
$

Resolvendo, temos que:

$
  R_B = (264 + 126 + 102)/12 = (492 k N)/14 therefore R_B = 35,14" kN"
$

Substituindo o valor de $R_B$ na relação $  R_A + R_B = 38k N$, temos que:

$
 R_A + R_B = 38k N arrow.r.double R_A = 38 - R_B arrow.r.double R_A = 38 - 35,14 therefore R_A = 2,85 " kN"
$
\
== Cálculo do esforço cortante e momento fletor
=== Seção 1 ($0 <= x <= 6$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao fazer o balanço de forças:

$
 -R_A + V(x) = 0 arrow.r.double  V(x) = R_A
$
Logo:
$
V(x) = 2,85" kN"
$



Para o cálculo do momento fletor, temos

$
M (x)= R_A ⋅x arrow.r.double M(x) = 2,85x
$
Substituindo os valores do intervalo:
\
\
Para $x = 0$:
$
M(0) = 2,85k N ⋅ 0 = 0
$

Para $x = 6$:
$
M(6) = 2,85k N ⋅ 6 = 17,1 "kN⋅m"
$
=== Seção 2 ($6 <= x <= 14$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao fazer o balanço de forças:
$
 17k N-R_A + V(x) = 0 arrow.r.double  V(x) = R_A - 17 "kN"
$

Logo:

$
V(x) = 2,85-17 therefore V(x) = -14,15 "kN"
$

Para o cálculo do momento fletor, temos

$
M (x)= R_A ⋅x - 17(x - 6)
$

Resolvendo, temos que:

$
 M(x) = 2,85x - 17x + 102 arrow.r.double M(x) = -14,15x + 102 " kN"
$

Substituindo os valores do intervalo:

\
Para $x =6$:
$
M(6) = -14,15 ⋅ 6 + 102 = 17,1 "kN⋅m"
$

Para $x = 14$:

$
M(14) =  -14,15 ⋅ 14 + 102 = -96,1 "kN⋅m"
$

=== Seção 3 ($14 <= x <= 22$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao fazer o balanço de forças:
$
 17k N + 9k N-R_A -R_B+ V(x) = 0 arrow.r.double  V(x) = R_A  + R_B - 17k N - 9k N
 $

Logo:

$
V(x) = 2,85 + 35,14-17-9 therefore V(x) = 12 "kN"
$

Para o cálculo do momento fletor, temos

$
M (x)= -17(x - 6) -9(x-14)+R_B (x-14) + R_A x 
$

Resolvendo, temos que:

$
M(x) = -17x + 102 -9x + 126 + 35,15x - 492 + 2,85x 
$

Portanto:

$
M(x)  = 12x - 264 "kN"
$
Substituindo os valores do intervalo:

\
Para $x =14$:
$
M(14) = 12 ⋅ 14 - 264 = -96 "kN⋅m"
$

Para $x = 22$:

$
M(22) = 12⋅ 22 - 264 = 0
$

== Diagrama de momento fletor e esforço cortante
Uma vez calculados os valores de momento fletor e esforço cortante, temos os seguintes gráficos:

#figure(
  figure(
    rect(image("Q3/esforcocortanteq3.png", width: 90%)),
    numbering: none,
    caption: [Gráfico de esforço cortante da Questão 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("Q3/momentofletorq3.png")),
    numbering: none,
    caption: [Gráfico de momento fletor da Questão 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
= Questão 4
Considere uma viga bi-apoiada com 12m de comprimento submetida a uma força distribuída triangular que começa em zero no apoio tipo vínculo e termina com valor F1 no segundo apoio de rolete. A viga tem secção com medidas de 12cm x 60cm. Determine qual é o Momento Fletor máximo dessa viga e desenhe o diagrama de momento fletor. Qual a Tensão máxima de Flexão?

Com base nas informações fornecidas, foi elaborado um desenho esquemático para representar o cenário analisado:

#figure(
  figure(
    rect(image("Q4/questão4.png")),
    numbering: none,
      caption: [Questão 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Inicialmente, temos que o somatório das forças no eixo $y$ é zero, considerando as forças de reação $R_A$  e $R_B$ e a força $W$, representando força total distribuida na viga:

$
  sum F_y = 0 arrow.r.double R_A - W + R_B = 0
$

Desta forma, temos a seguinte relação:

$
  R_A + R_B = W
$

Para calcular a força total distribuída $W$, usamos a seguinte fórmula:

$
W = w_f/2(x_f - x_i)
$

Onde:
- $w_f$: Força no ponto final da viga
- $x_f$: Pontoo final de aplicação da força 
- $x_i$: Ponto inicial de aplicação da força

Utilizamos a força dividida por dois pois estamos lidando com uma força distribuída no formato de triângulo. Neste caso, $W$ seria a área total do triângulo, que pode ser calculada pelo produto da base pela altura dividido por 2. A base neste seria a diferença entre os pontos inicial e final e a altura a força distribuída.
\
\
De acordo com o cenário analisado temos que: $w_f = 17 "kN"$, $x_f = 12 "m"$ e $x_i = 0$.
\
\
Substituindo os valores conhecidos na equação, temos:

$
W = 17/2(12 - 0) arrow.r.double 204/2 = 102 "kN"
$
Substituindo na relação  $R_A + R_B = W$, temos que:

$
R_A + R_B = 102 "kN"
$
O centro da viga é dado por:

$
x = 2/3L = 2/3(12) = 8 "m"
$

Em seguida, temos que o somatório dos momentos no ponto A é zero, com a força equivalente agindo no centro da viga:
:

$
  sum M_A =  0 arrow.r.double R_B ⋅ 12 - 102 ⋅ 8 = 0
$

Resolvendo, temos que:

$
R_B = (102 ⋅ 8) / 12 therefore R_B = 68 " kN"
$

Substituindo o valor de $R_B$ na relação $R_A + R_B = 102 "kN"$, temos que:

$
R_A = 102 - R_B arrow.r.double R_A = 102 - 68 therefore R_A = 34 " kN"
$
== Cálculo do esforço cortante e momento fletor
=== Seção 1 ($0 <= x <= 12$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
W - R_A +V(x) = 0 arrow.r.double V(x) = R_A - W
$
Através da fórmula abaixo é possível verificar o valor de carga distribuída na secção da viga:
$
W = w_f/(2(x_f - x_i))(x - x_i)²
$

Substituindo os valores conhecidos, temos que:

$
W = 17000/(2(12 - 0))(x - 0)² = (17000x²)/24 therefore W =  708,333x²
$

Uma vez verificado o valor da carga, substituímos os valores conhecidos de $W$ e $R_A$ para encontrar a função do esforço cortante:

$
V(x) = 34000 - 708,333x²
$

Verificando os valores da função para o intervalo analisado, temos que:
\
\
Para $x = 0$:

$
V(0) = 34 "kN"
$

Para $x = 12$:

$
V(12) = 34000 - 708,333(12)² = -68 "kN"
$
\
Para o cálculo do momento fletor no mesmo intervalo analisado, temos que:

$
W(x -x_c) - R_A x + M(x) = 0 arrow.r.double M(x) = R_A x - W(x - x_c)
$

Da solução anterior, temos que $W = 708,333x²$ e o valor de $x_c$ é dado por:

$
x_c = 2/3x
$

O valor de $x_c$ é determinado pois temos uma força que cresce da esquerda para a direita formando um triângulo retângulo (ver figura 13). Da geometria, tem-se que o centro de gravidade de um triângulo está localizado a 2/3 da base a partir da parte mais baixa.

\
\
\
\
\
Substituindo os valores temos que:

$
M(x) = 34000x - 708,333x²(x - 2/3x) = 34000x - 708,333x³+(708,33x³⋅2)/3
\
= 34000x - 708,333x³ + 472,22x³ therefore M(x) = 34000x-236,111x³
$

Verificando os valores da função para o intervalo analisado, temos que:
\
\
Para $x = 0$:

$
M(0) = 0 "kN"
$

Para $x = 12$:

$
M(12) = 34000⋅12 - 236,11(12)² = 374 "kN"
$

=== Diagramas de momento fletor e esforço cortante
Uma vez calculados os valores de momento fletor e esforço cortante, temos os seguintes gráficos:

#figure(
  figure(
    rect(image("Q4/esforcocortanteq4.png")),
    numbering: none,
    caption: [Gráfico de esforço cortante da Questão 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("Q4/momentofletorq4.png")),
    numbering: none,
    caption: [Gráfico de momento fletor da Questão 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Tensão máxima de flexão
Inicialmente calculamos o ponto de valor máximo da função de momento fletor, para isso, derivamos a função igualamos a mesma a zero:

$
M(x) = 34000x - 236,111x^3 => (d M)/(d x) = 34000 - 708,333x²
$
Igualando a zero:
$
 M'(x) = 0 => 34000 - 708,333x² = 0 => x = sqrt(34000/(708,333)) therefore x = 6,928 "m"
$

Uma vez verificado o ponto de máximo a função de momento de flexão, calculamos a função de momento fletor avaliada neste ponto:

$
M(6,928) = 34000⋅6,928 - 236,111(6,928)³ = 235563−78512 = 157,05 " kN"
$

Portanto, temos que:
$
M_max = 157,05 " kN"
$

Posteriormente, calculamos o centro de gravidade $c$ na secção transversal da viga:

$
c = h/2 = 60/2=30 c m therefore c = 0,30"m"
$

Agora fazemos o cálculo do momento de inércia da viga utilizando os valores de largura e altura:

$
I = (b h³)/12 = (0,12 ⋅ (0,6)³)/12 = 0,001728 "kg⋅m²"
$

Para calcular a tensão máxima de flexão, utilizamos a seguinte fórmula:

$
sigma_max = (M_max ⋅ c)/I
$
\
Substituindo os valores na equação, temos:

$
  sigma_max= (157,05 ⋅ 0,30)/(0,001728) = 27,3 "MPa"
$
\
\
\
= Questão 5
Considere uma viga retangular bi-apoiada com 10m de comprimento submetida a uma força uniformemente distribuída de 2kN/m. A viga tem secção com medidas de 15cm x 40cm. Desenhe o diagrama de Momento Fletor e de Esforço cortante. Determine qual é a Tensão máxima de Flexão. 
\
\
Com base nas informações fornecidas, foi elaborado um desenho esquemático para representar o cenário analisado:

#figure(
  figure(
    rect(image("Q5/Q5.png")),
    numbering: none,
      caption: [Questão 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\
Inicialmente, temos que o somatório das forças no eixo $y$ é zero, considerando as forças de reação $R_A$  e $R_B$ e a força $W$, representando força total distribuida na viga:

$
  sum F_y = 0 arrow.r.double R_A - W + R_B = 0
$

Desta forma, temos a seguinte relação:

$
  R_A + R_B = W
$

Para calcular a força total distribuída $W$, usamos a seguinte fórmula:

$
W = w_f (x_f - x_i)
$
Onde:
- $w_f$: Força no ponto final da viga
- $x_f$: Pontoo final de aplicação da força 
- $x_i$: Ponto inicial de aplicação da força

Neste caso não utilizamos a força distribuída dividida por 2, pois estamos tratando uma área de um triângulo retângulo, que pode ser calculada pelo produto da base pela altura. A base neste caso seria a diferença dos pontos inicial e final e a altura a força distribuída.\
\
De acordo com o cenário analisado temos que: $w_f = 2 "kN"$, $x_f = 10 "m"$ e $x_i = 0$.
\
\
Substituindo os valores conhecidos na equação, temos:

$
W = 2(10 - 0) = 20 "kN"
$
Substituindo na relação  $R_A + R_B = W$, temos que:

$
R_A + R_B = 20 "kN"
$

O centro da viga é dado por:
$
x = L/2 = 10/2 = 5 "m"
$

Em seguida, temos que o somatório dos momentos no ponto A é zero, com a força equivalente agindo no centro da viga:

$
  sum M_A =  0 arrow.r.double R_B ⋅ 10 - 20 ⋅ 5 = 0
$

Resolvendo, temos que:

$
R_B = (20 ⋅ 5) / 10 therefore R_B = 10 " kN"
$

Substituindo o valor de $R_B$ na relação $R_A + R_B = 20 "kN"$, temos que:

$
R_A = 20 - R_B arrow.r.double R_A = 20 - 10 therefore R_A = 10 " kN"
$

== Cálculo do esforço cortante e momento fletor
=== Seção 1 ($0 <= x <= 10$): 
Para o cálculo do esforço cortante, temos a seguinte relação ao resolver o balanço de forças presente na viga:

$
W - R_A +V(x) = 0 arrow.r.double V(x) = R_A - W
$
Através da fórmula abaixo é possível verificar o valor de carga distribuída na secção da viga:
$
W = w_f (x - x_i)
$

Substituindo os valores conhecidos, temos que:

$
W = 2000(x - 0) therefore W =  2000x
$

Uma vez verificado o valor da carga, substituímos os valores conhecidos de $W$ e $R_A$ para encontrar a função do esforço cortante:

$
V(x) = 10000 - 2000x
$

Verificando os valores da função para o intervalo analisado, temos que:
\
\
Para $x = 0$:

$
V(0) = 10 "kN"
$

Para $x = 10$:

$
V(10) = 10000 - 2000(10) = -10 "kN"
$
\
Para o cálculo do momento fletor no mesmo intervalo analisado, temos que:


$
W(x -x_c) - R_A x + M(x) = 0 arrow.r.double M(x) = R_A x - W(x - x_c)
$

Da solução anterior, temos que $W = 2000x$ e o valor de $x_c$ é dado por:

$
x_c = x/2
$
O valor de $x_c$ é determinado pois temos uma força uniforme formando retângulo (ver figura 16). De maneira direta, tem-se que o centro  de um retângulo é o lado dividido por 2.
\
\
Substituindo os valores temos que:

$
M(x) = 10000x - 2000x(x - x/2) = 10000x - 2000x²+(2000x²)/2
\
= 10000x - 2000x² + 1000x² therefore M(x) = 10000x-1000x²
$
\
\
Verificando os valores da função para o intervalo analisado, temos que:
\
\
Para $x = 0$:

$
M(0) = 0 "kN"
$

Para $x = 10$:

$
M(10) = 10000⋅10 - 1000(10)² = 0 "kN"
$

=== Diagramas de momento fletor e esforço cortante
Uma vez calculados os valores de momento fletor e esforço cortante, temos os seguintes gráficos:

#figure(
  figure(
    rect(image("Q5/esforcocortanteq5.png", width: 90%)),
    numbering: none,
    caption: [Gráfico de esforço cortante da Questão 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
\

#figure(
  figure(
    rect(image("Q5/momentofletorq5.png", width: 90%)),
    numbering: none,
    caption: [Gráfico de momento fletor da Questão 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Tensão máxima de flexão
Inicialmente calculamos o valor do momento fletor máximo pela fórmula conhecida para força uniforme:

$
M_max = (w L²)/8
$

Substituindo os valores, temos que:

$
M_max = (2000⋅(10)²)/8 = (2000⋅100)/8 = 25 " kN"
$

Portanto, temos que:
$
M_max = 25 " kN"
$

Posteriormente, calculamos o centro de gravidade $c$ na secção transversal da viga:

$
c = h/2 = 40/2=20 c m therefore c = 0,20"m"
$

Agora fazemos o cálculo do momento de inércia da viga utilizando os valores de largura e altura:

$
I = (b h³)/12 = (0,15 ⋅ (0,4)³)/12 = 0,0008 "kg⋅m²"
$

Para calcular a tensão máxima de flexão, utilizamos a seguinte fórmula:

$
sigma_max = (M_max ⋅ c)/I
$
\
Substituindo os valores na equação, temos:

$
  sigma_max= (25000 ⋅ 0,20)/(0,0008) = 6,25 "MPa"
$
\
\
\
\
\
\
\
\
\
\
= Tabelas de resultados gerais
Com o objetivo de organizar melhor os resultados, foi montado uma tabela de valores. 

== Questão 1
#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Secção*], [*Esforço cortante (kN)*], [*Momento fletor (kN)*],
      [$0 <= x <= 4$], [14,33], [$14,33x$],
      [$4 <= x <= 8$], [-2,67], [$-2,67x + 68$], 
      [$8 <= x <= 12$], [-11,67], [$-11,67x + 140$], 
    ),
    numbering: none,
    caption: []
  ),
)
Tensão máxima de flexão: $sigma_max = 31,85 " MPa"$

== Questão 2
#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Secção*], [*Esforço cortante (kN)*], [*Momento fletor (kN)*],
      [$0 <= x <= 4$], [5,67], [$5,67x$],
      [$4 <= x <= 6$], [-11,33], [$-11,33x + 68$], 
    
    ),
    numbering: none,
    caption: []
  ),
)
Tensão máxima de flexão: $sigma_max = 27,2 " MPa"$

== Questão 3
#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Secção*], [*Esforço cortante (kN)*], [*Momento fletor (kN)*],
      [$0 <= x <= 6$], [ 2,85], [$2,85x$],
      [$6 <= x <= 14$], [-14,15], [$-14,15x + 102$], 
      [$14 <= x <= 22$], [12], [$12x - 264$], 
    
    ),
    numbering: none,
    caption: []
  ),
)

== Questão 4

#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Secção*], [*Esforço cortante*], [*Momento fletor*],
      [$0 <= x <= 12$], [ $34000 - 708,333x²$], [$34000x-236,111x³$],
  
    ),
    numbering: none,
    caption: []
  ),
)
Tensão máxima de flexão: $sigma_max = 27,3 " MPa"$

== Questão 5

#figure(
  figure(
    table(
      align: auto,
      columns: 3,
      [*Secção*], [*Esforço cortante*], [*Momento fletor *],
      [$0 <= x <= 10$], [ $10000 - 2000x$], [$10000x-1000x²$],
  
    ),
    numbering: none,
    caption: []
  ),
)
Tensão máxima de flexão: $sigma_max = 6,25 " MPa"$

= Conclusão
A partir dos resultados obtidos e dos conceitos estudados em relação aos conteúdos de momento de flexão, esforço cortante e tensão máxima de flexão, foi possível verificar que o cálculo de cada componente é importante para entender o comportamento de determinadas estruturas e como são suas reações em vista de diferentes forças. 

= Referências

- Jesué Graciliano da Silva. Momento fletor. Youtube - JESUE REFRIGERACAO CLIMATIZACAO, 2018.

- Jesué Graciliano da Silva. Tensão de flexão. Youtube - JESUE REFRIGERACAO CLIMATIZACAO, 2024.

- Jesué Graciliano da Silva. Centro de Gravidade de uma viga. Youtube - JESUE REFRIGERACAO CLIMATIZACAO, 2018.