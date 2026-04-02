#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 6 - Radiação",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "25 de Março de 2026",
  doc,
)

= Exercícios propostos

*6.1. *Um corpo cuja superfície externa tem área 0,5 m², emissividade 0,8 e temperatura 150°C é colocado em uma câmara evacuada, muito maior que o corpo. As paredes da câmara são mantidas a 25°C. Qual a taxa de troca líquida de radiação entre o corpo e as paredes da câmara?

\
*Dados:*
\
$A = 0,5"m²"$\
$epsilon= 0,8$\
$T_s = 150 "°C" = 423.15 "K"$\
$T_infinity = 25 "°C" = 298,15 "K"$\
\
*Resolução:* 
\
Aplicando a fórmula de transferência de calor entre corpo e ambiente:

$
Q = epsilon times A times sigma times (T_s^4 - T_(infinity)^4)
\
=0,8 times 0,5 times 5,67 times 10^(-8)  (423,15^4 - 298,15^4)
\
Q = 547,92 "W"
$
\
\
*6.2.* Uma placa horizontal e opaca, totalmente isolada em sua parte traseira, recebe um fluxo de radiação de 2500 W/m², dos quais 500 W/m² são refletidos. Calcule a refletividade, a absortividade, transmissividade e a emissividade da placa.
\


- *Refletividade:*
A refletividade pode ser calculada a partir da seguinte relação:
$
rho = Q_("incidente")/Q_("refletido")
$

Sabemos que o $Q_("incidente")$ é 2500 W/m² e $Q_("refletido")$ é 500 W/m². Assim:

$
rho = Q_("incidente")/Q_("refletido") = 500/2500 = 0,2
$

- *Transmissividade*
Como o material é opaco:
$
tau = 0
$

- *Absortividade*
A partir da relação de propriedade de materiais, temos que:
$
rho + alpha + tau = 0 => alpha = 1-0,2 therefore alpha = 0,8
$
#pagebreak()
- *Emissividade*
Em regime permanente a emissividade é igual a absortividade:

$
epsilon = alpha therefore epsilon = 0,8
$
\
*6.3.* Um"chip de computador" quadrado, de lado igual a 5 mm, isotérmico, é montado em um substrato de modo que as suas superfícies laterais e traseira estejam perfeitamente isoladas, enquanto a superíficie frontal está exposta ao ar, à temperatura 15°C, e coeficiente de convecção de 200 W/m².K. Devido a critérios de confiabilidade, a temperatura da superfície do chip não pode exceder 85°C.
\
\
a) calcule a taxa de transferência de calor liberada pelo chip, considerando apenas a convecção;
\
\
b) calcule o acréscimo percentual na taxa de transferência de calor, levando-se em conta também a taxa de transferência de calor liberada pelo chip por radiação. Considere que todo o meio circundante esteja a 15°C. A superfície do chip tem emissividade 0,9.
\
\
*Dados:*
\
$L = 0,5times 10^(-3) "m²"$\
$T_s = 15 "°C"$\
$T_p = 83 "°C" = 356 "K"$\
$h = "200" "w"/(m^2 C°)$\
\
*Resolução*
\
\
*a) Taxa por convecção:*
\
Considerando somente o processo de convecção, podemos calcular a taxa de transferência usando a Lei de Newton:
$
Q = h times A (T_p - T_(infinity))
\
Q = 200 times (0,005)² times (83 - 15)
\
Q = 0,34 "W"
$
\
*b) Taxa de calor acrescida e taxa de calor por radiação*
\
A partir do enunciado, temos:
\
$T_infinity = 15 "°C" = 288 "K"$\
$epsilon= 0,9$\
\
Aplicando a taxa de calor por radiação:
$
Q = epsilon times A times sigma times (T_s^4 - T_(infinity)^4)
\
=0,9 times (0,005)² times 5,67 times 10^(-8)  (356^4 - 288^4)
\
Q = 0,012 "W"
$



#pagebreak()

Calculando o acréscimo de troca por radiação:

$
%_"acrescido" = Q_("radiação")/Q_("convecção") times 100 = 3,529%
$

\
\
*6.4*. Uma placa horizontal de alumínio, oxidada, de 3m de comprimento por 2m de largura, mantém uma temperatura de 77°C em sua superfície e está exposta a uma corrente de ar com temperatura de 27°C e coeficiente de transferência de calor por convecção de 28,0 W/m².K. Calcule a taxa total de transferência de calor.
\
\
*Dados:*
\
$A = 3 times 2 = 6 "m²"$\
$T_p = 77 "°C"$\
$T_infinity = 27 "°C"$\
$h = "28" "w"/(m^2 C°)$\
\
*Resolução:*
\
Usando a Lei de Newton de resfriamento:
$
Q = h times A (T_p - T_(infinity))
$
Substituindo os valores conhecidos:

$
Q = h A (T_p - T_(infinity)) = 
\
Q = 28 times 6 (77 - 27)
\
Q = 8400 "W"
$
