#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Transformada de Fourier de Tempo Discreto",
  subtitle: "Sinais e Sistemas",
  authors: ("Bernardo Souza Muniz.",),
  date: "24 de Novembro de 2025",
  doc,
)

= Introdução
Este documento tem como objetivo apresentar a resolução do trabalho da disciplina de Sinais e Sistemas, abordando a Transformada de Fourier para sinais em tempo discreto. Serão detalhados o passo a passo da resolução de cada exercício, bem como as justificativas e métodos utilizados em cada etapa.
= Questão 1
1) Usando a definição, obtenha a TFTD para o sinal $𝑥[𝑛] = (0.1)^(𝑛+2)𝑢[𝑛 + 3]$ .

\
Inicialmente, pela definição da TFTD, temos que:
$
X(e^(j omega)) = sum_(n= -infinity)^(infinity) x[n] e^(-j omega n)
$
Substituindo os valores do sinal $x[n]$:

$
X(e^(j omega)) = sum_(n= -infinity)^(infinity) (0.1)^(𝑛+2)𝑢[𝑛 + 3] e^(-j omega n)
$

O sinal de degrau unitário adiantado muda os limites de soma de -3 até infinito positivo:


$
X(e^(j omega)) = sum_(n= -3)^(infinity) (0.1)^(𝑛+2) e^(-j omega n) = sum_(n= -3)^(infinity) (0.1)^𝑛 (0.1)^2 e^(-j omega n) = (0.1)^2  sum_(n= -3)^(infinity) (0.1 e^(-j omega))^n
$
Para escrever essa soma no formato padrão de uma série geométrica, fazemos a mudança de variável:
$
k=n+3⟹n=k−3.
$
Com isso, quando $n = -3$, temos $k = 0$, e quando $n -> infinity$, então $k -> infinity$. Assim, o somatório passa a ser:

$
(0.1)^2  sum_(n= -3)^(infinity) (0.1 e^(-j omega))^n = (0.1)^2  sum_(k=0)^(infinity) (0.1 e^(-j omega))^(k-3) 
$
Fatorando o termo independente de $k$:

$
(0.1)^2  sum_(k=0)^(infinity) (0.1 e^(-j omega))^(k-3) = (0.1)^2 (0.1 e^(-j omega))^(-3)  sum_(k=0)^(infinity) (0.1 e^(-j omega))^(k)
$

Nota-se que agora o somatório pode ser simplificado para uma soma de série geométrica:

$
sum_(n=0)^(infinity) r^n = 1/(1-r),  "        com " r = 0.1 e^(-j omega)
$
#pagebreak()
Logo:

$
(0.1)^2  (0.1 e^(-j omega))^(-3)sum_(k = 0)^(infinity) (0.1 e^(-j omega))^n = (0.1)^2 (0.1 e^(-j omega))^(-3)(1/(1 - 0.1 e^(-j omega)))
$

Simplificando, temos:
$
((0.1)^2(0.1)^(-3) e^(3j omega))/(1 - 0.1 e^(-j omega)) = ((0.1)^(-1) e^(3j omega))/(1 - 0.1 e^(-j omega)) = (10 e^(3j omega))/(1 - 0.1 e^(-j omega)).
$
\
Portanto, a TFTD do sinal $x[n]$ é:

$
(0.1)^(𝑛+2)𝑢[𝑛 + 3] <=>  (10 e^(3j omega))/(1 - 0.1 e^(-j omega))

$


= Questão 2
2) Usando a propriedade do deslocamento e sabendo que a TFTD de $𝑎^𝑛 𝑢[𝑛]$ é $𝑒^(𝑗 𝜔)/(𝑒^(𝑗 𝜔)−𝑎) "para" |𝑎| < 1$ e $𝑛 𝑎^𝑛 𝑢[𝑛]$ é $(a 𝑒^(𝑗 𝜔))/(𝑒^(𝑗 𝜔)−𝑎)^2$, obtenha a Transformada de Fourier do sinal 
\
\
$"                                          "𝑥[𝑛] = (𝑛 − 1)(1/2)^𝑛 𝑢[𝑛 − 𝑚]$
\
\
\
Inicialmente, queremos chegar em termos iguais no expoente da fração $1/2$ e do termo multiplicativo $(n-1)$ a fim de utilizar as seguintes propriedades:





$
a^n u[n] <=> (e^(j omega))/(e^(j omega) - a) "para" |a| < 1 "         " n a^n u[n] <=> (a e^(j omega))/((e^(j omega) - a)^2)   
$

Com isso, fazemos a adição do termo $m-m$ no expoente da fração e dentro do termo multiplicativo, sem alterar o resultado do sinal de entrada.

$
𝑥[𝑛] = (n − 1 + m - m)(1/2)^(n+m-m) 𝑢[𝑛 − 𝑚]
$
Fazendo a distribuitiva a fim de obter termos semelhantes, temos:

$
(n - m)(1/2)^(n+m-m) 𝑢[𝑛 − 𝑚] + (m - 1)(1/2)^(n+m-m) 𝑢[𝑛 − 𝑚]
$

Ao expandir a expressão, observa-se que surgem termos equivalentes, permitindo aplicar diretamente as propriedades de simplificação apresentadas anteriormente. 
\
\
De fato,

$
(1/2)^(m) underbrace((n - m)(1/2)^(n-m) 𝑢[𝑛 − 𝑚], a^n u[n] ) + (1/2)^(m) underbrace((m - 1) (1/2)^(n-m) 𝑢[𝑛 − 𝑚], n a^n u[n])
$
\
Nota-se que o termo $u[n-m]$ faz um atraso no sinal. Para isso, utilizamos a propriedade de deslocamento no tempo:

$

"Se" x[n] <=> X(e^(j omega)), " então: " x[n-n_0] <=> X(e^(j omega))e^(-j omega)
$
\
Por fim, temos que a transformada do sinal $x[n]$ é:

$
(1/2)^(m) ·(0,5 e^(j omega))/((e^(j omega) - 0,5)^2) e^(-j omega m) + (m-1) (1/2)^(m)·(0,5 e^(j omega))/(e^(j omega) - 0,5) e^(-j omega m)
$

= Questão 3
3) Considere um sistema caracterizado pela equação de diferença:

$ 
y[𝑛] + 0.8𝑦[𝑛 − 1] + 0.12𝑦[𝑛 − 2] = 𝑥[𝑛 − 1]
$
a) Determine a resposta em frequência.
\
b) Determine $𝑦[𝑛]$ para $𝑥[𝑛] = (1/8)^n u[n]$.
\
\
\
*Item a)*
\
\
Sabe-se que a resposta em frequência de um determinado sinal é dado pela seguinte relação: 

$
y[n] = x[n] * h[n] " "<=> "  "Y(e^(j omega)) = X(e^(j omega)) ·H(e^(j omega)) => H(e^(j omega)) = Y(e^(j omega))/X(e^(j omega))
$

Fazendo a transformada do sistema para frequência, temos:

$
Y(e^(j omega)) + 0.8Y(e^(j omega))e^(-j omega) + 0.12Y(e^(j omega))e^(-2j omega) = X(e^(j omega))e^(-j omega)
$
\
Colocando o termo $Y(e^(j omega))$ em evidência:

$
\
Y(e^(j omega))(1+0.8e^(-j omega) + 0.12e^(-2j omega) ) = X(e^(j omega))e^(-j omega)
$

Reorganizando a equação para chegar no termo conhecido:

$
Y(e^(j omega))/X(e^(j omega))= e^(-j omega)/((1+0.8e^(-j omega) + 0.12e^(-2j omega) ) ) = H(e^(j omega))

$

Portanto, a resposta em frequência é:

$
H(e^(j omega)) = e^(-j omega)/(1+0.8e^(-j omega) + 0.12e^(-2j omega) )
$
#pagebreak()

*Item b)*
\
\
Sabe-se que a saída $y[n]$ pode ser expressa pela convolução $y[n] = x[n] * h[n]$. No domínio da frequência, essa relação torna-se $Y(e^(j omega)) = X(e^(j omega)) · H(e^(j omega))$. Como $H(e^(j omega))$ já é conhecido, basta aplicar a TFTD ao sinal de entrada $x[n]$ para obter $X(e^(j omega))$ e, consequentemente, determinar $Y(e^(j omega))$ por meio do produto. Por fim, aplicamos a transformada inversa de Fourier em tempo discreto para 
recuperar a saída $y[n]$ no domínio do tempo.
\
\
Inicialmente, multiplicamos numerador e denominador por $e^(2j omega )$ com o objetivo de obter uma forma algébrica equivalente, porém mais conveniente para simplificação.

$
H(e^(j omega)) = e^(-j omega)/(1+0.8e^(-j omega) + 0.12e^(-2j omega) ) · (e^(2j omega )/e^(2j omega )) = e^(j omega)/(e^(2j omega )+0.8e^(j omega) + 0.12)
$

Fazendo a TFTD do sinal de entrada, a partir de uma das propriedades vistas na definição $(8)$, temos:

$
𝑥[𝑛] = (1/8)^n u[n] <=> e^(j omega)/(e^(j omega) - 1/8)
$
Fatorando o denominador de $H(e^(j omega))$, obtemos as raízes $-0.2$ e $-0.6$. Assim, o produto dos sinais  fica:

$
Y(e^(j omega)) = e^(j omega)/(e^(j omega) - 1/8) · e^(j omega)/((e^(j omega )+ 0.6) (e^(j omega )+ 0.2)) 
$

Multiplicando ambos os lados da equação pelo termo $1/e^(j omega)$, temos que:
$
Y(e^(j omega))/e^(j omega) = e^(j omega)/((e^(j omega) - 1/8)(e^(j omega )+ 0.6) (e^(j omega )+ 0.2))
$

Resolvendo por partes:

$
e^(j omega)/((e^(j omega) - 1/8)(e^(j omega )+ 0.6) (e^(j omega )+ 0.2)) = A/((e^(j omega) - 1/8)) + B/((e^(j omega )+ 0.6)) + C/((e^(j omega )+ 0.2))
$
\
De maneira direta, sabe-se que o polinômio tem as raízes: $-0.6, -0.2$ e $1/8$. Multiplicando ambos os lados por $(e^(j omega) - 1/8)(e^(j omega )+ 0.6) (e^(j omega )+ 0.2)$, temos:
\
\
$"    " A(e^(j omega )+ 0.6) (e^(j omega )+ 0.2)+ B(e^(j omega) -1/8)(e^(j omega )+ 0.2) + C(e^(j omega )+ 0.6)(e^(j omega) - 1/8) = e^(j omega)$
\
\
Como essa igualdade deve valer para qualquer valor de $e^(j omega)$ podemos substituir as raízes de cada polinômio com o objetivo de anular cada um dos fatores, determinando diretamente as constantes de frações parciais

#pagebreak()
Substituindo as raízes a fim de encontrar os valores de $A,B$ e $C$:
\
\
*1)**$" " e^(j omega) = 1/8$*
$
A(e^(j omega )+ 0.6) (e^(j omega) + 0.2) = e^(j omega ) => A(1/8+ 6/10) (1/8 + 2/10) = 1/8
\
A(29/40·13/40) = 1/8 => A = 1/8 · 1600/377 therefore A  = 0,53
$

*2)**$" " e^(j omega) = -0.6$*

$
B(e^(j omega) -1/8)(e^(j omega )+ 0.2) = e^(j omega ) => B(-6/10 -1/8)(-6/10+ 2/10) = -6/10
\
B(-29/40·(-4/10)) = -6/10 => B = -6/10 · 400/116 therefore B = -2.07
$

*3)**$" " e^(j omega) = -0.2$*

$
C(e^(j omega )+ 0.6)(e^(j omega) - 1/8) = e^(j omega) => C(-2/10+ 6/10)(-2/10 - 1/8) = -2/10
\
C(4/10·(-13/40)) = -2/10 => C = -2/10 · (-400/52) therefore C = 1.54
$
\
Com as constantes $A,B$ e $C$, podemos verificar a resposta em frequência.

$
Y(e^(j omega))/e^(j omega) = 0.53/((e^(j omega) - 1/8)) -2.07/((e^(j omega )+ 0.6)) + 1.54/((e^(j omega )+ 0.2)) 
$

Multiplicando os dois lados da equação pelo termo $e^(j omega)$, temos:
$
Y(e^(j omega)) = e^(j omega)(0.53/((e^(j omega) - 1/8)) -2.07/((e^(j omega )+ 0.6)) + 1.54/((e^(j omega )+ 0.2))) 
$

Reorganizando, chegamos na resposta em frequência:

$
Y(e^(j omega)) = (0.53) e^(j omega)/((e^(j omega) - 1/8)) -(2.07) e^(j omega)/((e^(j omega )+ 0.6)) + (1.54)e^(j omega)/((e^(j omega )+ 0.2)) 
$

A partir da propriedade a baixo, podemos fazer a transformada inversa do sinal $Y(e^(j omega))$ para o domínio do tempo.

$
gamma^n u[n] <=> e^(j omega)/(e^(j omega) - gamma)
$

Portanto, a resposta $y[n]$ para o sinal de entrada é:

$
y[n] = (0.53) (1/8)^n u[n] -(2.07) (-0.6)^n u[n] + (1.54) (-0.2)^n u[n]
$
#pagebreak()
= Questão 4
4) Seja $x[n]$ uma sequência cuja TFTD é $𝑋(𝑒^(j omega))$. Para cada uma das seguintes sequências
relacionadas com $𝑥[𝑛]$, expresse a TFTD em termos de$ 𝑋(𝑒^(j omega))$.
\
\
a) $𝑥[𝑛] − 𝑥[𝑛 − 4]$
\
\
A partir da seguintes propriedades podemos expressar a transformada do sinal.

$

"Se" x[n] <=> X(e^(j omega)), " então: " x[n-n_0] <=> X(e^(j omega))e^(-j omega)
$

Portanto:

$
𝑥[𝑛] − 𝑥[𝑛 − 4] <=> X(e^(j omega)) -  X(e^(j omega))e^(-4j omega)
$
\
b) $𝑥[𝑛 − 1] ∗ 𝑥[𝑛 − 2]$
\
\
A partir da propriedade $(36)$ e da definida a seguir   podemos expressar a transformada do sinal.

$
y[n] = x[n] * h[n] " "<=> "  "Y(e^(j omega)) = X(e^(j omega)) ·H(e^(j omega)) 
$
\
Portanto:

$
𝑥[𝑛 − 1] ∗ 𝑥[𝑛 − 2] <=> X(e^(j omega))e^(-j omega) · X(e^(j omega))e^(-2j omega)
$

= Questão 5
5) Considere a interconexão de sistemas lineares invariantes ao deslocamento mostrada a
seguir:

#figure(
  figure(
    rect(image("sinais.png")),
    numbering: none,
  ),
)

a) Expresse a resposta em frequência do sistema completo em termos de $𝐻_1(e^(j omega))", "𝐻_2(e^(j omega))", "𝐻_3(e^(j omega))" e "𝐻_4(e^(j omega))$.
\
\
b) Encontre a resposta em frequência se $ℎ_1[𝑛] = 𝛿[𝑛 − 3]", " h_2[𝑛] = ℎ_3[𝑛]= (0.1)^n 𝑢[𝑛] " e" ℎ_4[𝑛] = 𝛿[𝑛 − 1]$.

\
*Item a)*
\
\
Sabendo que cada caminho corresponde a um sistema que segue a propriedade $(38)$, temos que a primeira convulução com o sistema $h_1[n]$ tem o seguinte resultado:

$
Z_1(e^(j omega)) = X(e^(j omega)) ·H_1(e^(j omega)) 
$
\
Seguindo para o caminhos de cima (1º caminho) e de baixo (2º caminho), temos os seguintes resultados:
\
\
*1º caminho:*

$
Z_2(e^(j omega)) =[ X(e^(j omega)) ·H_1(e^(j omega))] ·H_2(e^(j omega)) 
$

*2ºcaminho:*

$
Z_3(e^(j omega)) =[ X(e^(j omega)) ·H_1(e^(j omega))] ·H_3(e^(j omega)) ·H_4(e^(j omega)) 
$
\
Ao final dos caminhos, temos uma soma das funções $Z_2(e^(j omega))$ e $Z_3(e^(j omega))$ que mostra a resposta do sistema de maneira completa, fazendo a seguinte relação:

$
Y(e^(j omega)) = Z_2(e^(j omega)) + Z_3(e^(j omega))
$
Fazendo a soma, temos:
$

Y(e^(j omega)) = [ X(e^(j omega)) ·H_1(e^(j omega))] ·H_2(e^(j omega)) + [ X(e^(j omega)) ·H_1(e^(j omega))] ·H_3(e^(j omega)) ·H_4(e^(j omega)) 
$
\
Colocando o termo $X(e^(j omega)) ·H_1(e^(j omega))$ em evidência:

$

Y(e^(j omega)) =  (X(e^(j omega)) ·H_1(e^(j omega))) · [H_2(e^(j omega)) + H_3(e^(j omega)) ·H_4(e^(j omega))]
$
\
A partir da relação $(18)$, chegamos no termo conhecido dividindo os dois lados da equação por $ X(e^(j omega))$, obtendo a resposta em frequência do sistema:

$

Y(e^(j omega))/X(e^(j omega)) =  H_1(e^(j omega)) · [H_2(e^(j omega)) + H_3(e^(j omega)) ·H_4(e^(j omega))] = H(e^(j omega))
$
\
Portanto, a resposta em frequência do sistema é:

$
H(e^(j omega)) = H_1(e^(j omega)) · [H_2(e^(j omega)) + H_3(e^(j omega)) ·H_4(e^(j omega))]
$
#pagebreak()
*Item b)*
\
\
Inicialmente, fazemos a transformada dos sinais para frequência:

$
ℎ_1[𝑛] = 𝛿[𝑛 − 3] <=> H_1(e^(j omega)) = e^(-3j omega) "  " \
\
ℎ_2[𝑛] = ℎ_3[𝑛] = (0.1)^n u[𝑛] <=> H_2(e^(j omega)) = H_3(e^(j omega)) = 1/(1-0.1 e^(- j omega))
\
\
ℎ_4[𝑛] = 𝛿[𝑛 − 1] <=> H_4(e^(j omega)) = e^(-j omega) "  "
$
\
Fazendo a substituição dos sinais na relação $(47)$:

$
H(e^(j omega)) =  e^(-3j omega) · [1/(1-0.1 e^(- j omega)) + 1/(1-0.1 e^(- j omega)) ·e^(-j omega)]
$

Simplificando, obtemos a resposta do sistema:
$
H(e^(j omega)) =  e^(-3j omega) · [(1+ e^(-j omega))/(1-0.1 e^(- j omega)) ]
$

= Conclusão

Portanto, verifica-se que, por meio das propriedades da Transformada de Fourier em Tempo Discreto (TFTD), foi possível representar corretamente os diferentes sinais analisados, obtendo expressões em frequência consistentes e compatíveis com os resultados esperados.