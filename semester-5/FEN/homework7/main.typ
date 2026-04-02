#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 7 - Convecção e condução térmica",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "1 de Abril de 2026",
  doc,
)

= Questões
*7.1.* Um tubo horizontal de 125 mm de diâmetro passa através de uma sala onde as paredes se encontram a uma temperatura de 37°C, e o ar tem uma temperatura de 25°C. A temperatura da superfície externa do tubo, que é de ferro fundido, é medida e está a 125°C. Considere o coeficiente de convecção ao redor do tubo igual a 20 W/(m².K).
\
\
a) Calcule a perda de calor por metro de comprimento do tubo, por convecção e radiação. (considere convecção natural);
\
\
b) De quanto seria a redução percentual da perda de calor por radiação, ao se revestir este tubo com uma película de alumínio?
\
\
- *Dados:*

$D = 125" mm" = 0,125m$\
$T_s= 125 degree C = 398,5 "K"$\
$T_infinity= 25 degree C = 298,15 "K"$\
$T_("parede") = 37 degree C = 310,15 "K"$\
$epsilon_("Fe") = 0,80$\
\
- *Resolução:*

a)
$
A_("cilíndro") = 2 pi r h = 2pi D/2 1 = 0,3927 " "m^2/m 
$
Perda de calor por convecção:
$
Q = h A (T_s - T_(infinity)) = 20 * 0,392 (125-25) = 785 " "W/m
$
Perda de calor por radiação:
$
Q = epsilon_("Fe") A_("cilindro") sigma (T_s⁴ - T_("parede")⁴)\
= 0,80*0,392*5,67 times 10^(-8) (398,15 - 310,15) = 283,8  " " W/m
$

b) 
$epsilon_("Fe") = 0,80$ e $epsilon_("Alumínio") = 0,05$

$
Q_("novo") = epsilon_("Alumínio")/epsilon_("Fe") * Q_("antigo") = 17,7 " "W/m 
$

Redução percentual: 

$
Delta R = ((epsilon_("Fe") - epsilon_("Alumínio"))/epsilon_("Alumínio"))*100 =((0,80-0,05)/(0,05))*100 = 93,75%.

$
\
\
*7.2.* Uma pessoa se encontra em uma sala climatizada, mantida a 24°C. Sabendo-se que um ser humano tem no total aproximadamente 3,0 m² de área de pele, que a temperatura superficial da pele é de 32°C em média, e que essa pessoa tem 15% do corpo descoberto (isto é, não coberto por roupas), calcule a quantidade de calor que essa pessoa emite para o ambiente, por radiação.
\
\
- *Dados:*

$T_s= 32  degree C = 305,15 "K"$\
$T_infinity= 24 degree C = 297,15 "K"$\
$A = 3 "m²"$\
$epsilon_("pele") = 0,80$\
\
- *Resolução:*

Calculando a área da pele que vai ficar descoberta:
$
A_("pele") = 15/100 * 3 = 045 "m²"
$

Calculando a taxa de emissão de radiação:
$
Q = epsilon_("peelee") A_("pele") sigma (T_s^4 - T_(infinity)^4)\
= 0,98 * 0,45 * 5,67 times 10^(-8)(305,15^4 - 297,15^4) = 21,85 "W"
$

 

 

 
*7.3.* Numa usina nuclear, o tubo contendo o combustível nuclear, de 15 mm de diâmetro, passa pelo interior de outro tubo, de 40 mm de diâmetro. Entre os dois tubos escoa a água de refrigeração. Supondo a água transparente à radiação (isto é, a água não absorve nem emite calor por radiação), calcule a transferência de calor por radiação, por metro linear de tubo (problema dos cilindros concêntricos). Ambos os tubos são de aço inoxidável comum limpo, porém o tubo interno é revestido com uma camada de tinta negra. A temperatura da superfície externa do tubo que contém o combustível nuclear é de 250°C, e o fluxo de água é tal que mantém a temperatura da superfície interna do tubo externo a 80 °C.
\
\
- *Dados:*
$D_1 = 15" mm" = 15 times 10^(-3) "m"$\
$D_2 = 40" mm" = 40 times 10^(-3)$\
$T_1 = 250  degree C = 523,15 "K"$\
$T_2= 80 degree C = 353,15 "K"$\
$epsilon_("tinta") = 0,95$\
$epsilon_("aço inoxidável") = 0,24$\
\
-*Resolução*
\
\
Área externa de cada cilindro:
$
A_1 = 2pi (D_1/2) 1 = 0,047 " m"^2\
A_2 = 2pi (D_2/2) 1 = 0,12 " m"^2
$

Calculando a taxa de transferência de calor:

$
Q = (A_1 sigma (T_1^4 - T_2^4))/(1/epsilon_1 + A_1/A_2 (1/epsilon_2 - 1)) = (0,047 * 5,67 times 10^(-8) (523,15^4-353,15^4))/(1/(0,95) + (0,047)/(0,12) (1/(0,24) - 1))\
= (158,16)/(2,29) = 69,06 " "W/m
$