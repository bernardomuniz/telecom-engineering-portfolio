#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 5 - Convecção e condução térmica",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "18 de Março de 2026",
  doc,
)

= Exercícios propostos

*5.1)* O cilindro de um motor de combustão interna tem 10cm de diâmetro por 15cm de altura. Este motor gera uma taxa de transferência de calor da ordem de 5 kW, que precisa ser dissipada por convecção. Considere que o cilindro troca calor apenas pela lateral. Calcule a temperatura da parede externa do cilindro, quando se utiliza os seguintes fluidos para resfriamento:
\
a) ar a 27°C (h = 280 W/m².K);
\
b) água a 80°C (h = 3000 W/m².K).

\
*Dados:*
\
$D_"cilindro" = 10"cm"$\
$H_"cilindro" = 15"cm"$\
$dot(Q) = 5k W$\
$T_p = ?$\
$T_infinity("ar") = 27 degree C$\
$T_infinity("água") = 80 degree C$\
$h_"ar" = 280W/(m² times K)$\
$h_"água" = 3000W/(m² times K)$\
\
*Resolução:* 
$ A_"superficial" = (D times H)pi $

 
$ dot(Q) = h times A times (T_p - T_infinity) \
  dot(Q) = h (D times H)pi times (T_p - T_infinity)\
  T_p = dot(Q)/(h(D times H)pi) + T_infinity\
$

a) $T_p$ caso o flúido for o ar:
$ T_p = 5000/(280(10 times 15)times 10^(-2) pi) + 27\
  T_p = 405,94 degree C
$

b)$T_p$ se o flúido for a água:
$ T_p = 5000/(3000(10 times 15)times 10^(-2) pi) + 80\
  T_p = 115,37 degree C
$
 
#pagebreak()
*5.2)* No problema anterior, supondo que o cilindro seja de aço (k = 60,5 W/m.K) e tenha 10mm de espessura, calcule a temperatura média dos gases no interior da câmara de combustão (cilindro) sabendo que o coeficiente de transferência de calor por convecção no interior do cilindro é de 150 W/m².K.
\
\
*Dados:*\
$D_"cilindro" = 10"cm"$\
$H_"cilindro" = 15"cm"$\
$dot(Q) = 5k W$\
$T_infinity("ar") = 27 degree C$\
$h_"ar externo" = 280W/(m² times K)$\
$h_"ar interno" = 150W/(m² times K)$\
$k_"aço" = 60,5W/(m times K)$\
$l_"aço" = 10"mm" = 0,01"m"$\
$T_p = ?$
\
\
*Resolução:*
\
Resistências térmicas em série 
$ R_"total" = R_"convecção interna" + R_"condução no aço" + R_"convecção externa" \
  R_"total" = 1/(h_"i" times A) + l_"aço"/(k_"aço" times A) + 1/(h_"e" times A)\
$

Substituindo pela área da superfície de cada componente, chegamos na seguinte relação:
$
  R_"total" = 1/(h_"i" (D times H)pi) + l_"aço"/(k_"aço" (D times H)pi) +1/(h_"e" (D times H)pi)\
  R_"total" = 1/((D times H)pi)(1/h_"int" + l_"aço"/k_"aço" + 1/h_"ext")\
$

Substituindo os valores conhecidos na relação de resistência encontrada:
$
  R_"total" = 1/((0,15 times 0,10)pi)(1/150 + (0,01)/(60,5) + 1/280)\
  R_"total" = 0,221 K/W
$
 
Podemos usar a relação de transferência de calor da superfície:
 
$ dot(Q) = Delta_T/R_"total" => dot(Q) = (T_p - T_infinity)/R_"total" => dot(Q) = T_p/R_"total" - T_infinity R_"total" => dot(Q) +T_infinity/R_"total" = T_p/R_"total" \
  T_p = (Q + T_infinity/R_"total")R_"total"\
$

#pagebreak()
Substituindo os valores conhecidos:
$
  T_p = (5000 + (27/(0,221)))0,221 = 1132 degree C
$
 
\
 *5.3)* Um dos lados de uma parede plana de 5cm de espessura está exposto a uma temperatura ambiente de 38°C. A outra face da parede se encontra a 315°C. A parede perde calor para o ambiente por convecção. Se a condutividade térmica da parede é de 1,4 W/m.K, calcule o valor do coeficiente de transferência de calor por convecção para 1 m² de parede que deve ser mantido na face da parede exposta ao ambiente, de modo a garantir que a temperatura nessa face não exceda 41°C.
 
\
*Dados:*\
$l_"parede" = 5"cm"$\
$T_infinity = 38 degree C$\
$T_(p"interno") = 315 degree C$\
$k = 1,4W/(m times K)$\
$A = 1m²$\
$T_(p"externo") = 41 degree C$\
$h =  ?$\

\
*Resolução:*
O fluxo de calor por condução através da parede é dado pela Lei de Fourier:
$ dot(Q)_"condução" = (k times A)/L (T_(p" interno") - T_(p" externo)")\
$
O fluxo de calor por convecção no ar é dado pela Lei de Resfriamento de Newton:
$
  dot(Q)_"conveção" = (h times A) times (T_(p"externo") - T_infinity) \
$
O calor que chega por condução na face externa é o mesmo que sai por convecção:
$
   (k times A)/L (T_(p"interno") - T_(p"externo")) = (h times A) times (T_(p"externo") - T_infinity) \
$
 
Simplificando a expressão:
 
$ 
h = (k (T_(p"interno") - T_(p"externo")))/(L(T_(p"externo") - T_infinity)) \
$
Substituindo os valores:
$
h = (1,4 times (315 - 41))/(0,05 times (41 - 38)) => h = 7672/3 (W/(m^2 times K)) therefore h = 2557,33  " "W/(m^2 times K)
$
 
#pagebreak()

*5.4)* Ar atmosférico a 25°C escoa sobre uma placa que se encontra a uma temperatura de 75°C. A placa tem 1,5m de comprimento por 75cm de largura. Calcule a taxa de transferência de calor que passa da placa para o ar, se o coeficiente de transferência de calor for de 5,0 W/m².K.
\
\
*Dados:*
\
$T_infinity = 25 degree C$\
$T_p = 75 degree C$\
$"A"_"placa" = 1,5m$\
$"L"_"placa" = 75"cm" = 0,75"m"$\
$dot(Q) = ?$\
$h = 5W/(m² times K)$\

\
*Resolução:*
$ dot(Q) = h times A (T_p - T_infinity)\
  dot(Q) = h times ("A"_"placa" times "L"_"placa") times (T_p - T_infinity)\
  dot(Q) = 5(1,5 times 0,75)(75 - 25)\
  dot(Q) = 281,25W
$