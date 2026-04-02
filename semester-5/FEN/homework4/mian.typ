#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 4 - Transferância de Calor",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "09 de Março de 2026",
  doc,
)

= Exercícios propostos

*4.1. *Uma barra de 2,5cm de diâmetro e 15cm de comprimento é mantida a 260°C. A temperatura do ambiente é 16°C e o coeficiente de transferência de calor por convecção é 15 W/m².C. Calcule o calor perdido pela barra (taxa de transferência de calor).

\
\
*Dados:*\
$d = "2.5 cm"$\                
$L = "15 cm"$\
$T_(infinity) = "260 C°"$\
$T_(p) = "16 C°"$\
$h = "15" "w"/(m^2 C°)$\
$Q = "?" $\
\
*Resolução:*

\
$
A_("barra") = 2 pi r(r + h) = 2 pi 1,25 (1,25 + 15) = 127,62 "cm²" therefore A_("barra") = 0,01275 "m²" 
$
\
$
Q = h A (T_p - T_(infinity)) = 15 (0,01276)*(16-260)=-46,70 "W".
$\
\
*4.2. *Uma placa metálica colocada na horizontal, e perfeitamente isolada na parte de trás absorve um fluxo de radiação solar de 700 W/m². Se a temperatura ambiente é de 30°C, e não havendo circulação forçada do ar, calcule a temperatura da placa nas condições de equilíbrio (isto é, quando todo o calor que está sendo recebido é eliminado). Para obter o coeficiente de convecção, consulte a Tabela H da apostila.
\
\
*Dados:*\
$Q/A = "700 " "w"/(m²)$\                
$h = "29 " "w"/(m^2 C°)$\
$T_(infinity) = "30 C°"$\
$T_(p) = "? " $\
\
*Resolução:*
$
Q = h A (T_p - T_(infinity)) => T_p = Q/(A h) + T_(infinity) = 700/29+30 = 54,13 "C°"
$

#pagebreak()
*4.3.* Uma parede de concreto em um prédio comercial tem uma área superficial de 30 m² e uma espessura de 0,30 m. No inverno, o ar ambiente (interno) é mantido a 25°C enquanto o ar externo encontra-se a 0°C. Qual é a perda de calor através da parede? A condutividade do concreto é de 0,72 W/m.K
\
\
*Dados:*\
$A = "30 " "m²"$\
$L = 0,30 "m"$\
$h = "0,72 " "w"/(m^2 C°)$\
$T_(e) = "0 C°"$\
$T_(i) = "25 C°"$\
$h_e = "25 " "w"/(m^2 C°)$\
$h_(i)= "8 " "w"/(m^2 C°)$\
$Q= "?"$\
\
*Resolução:*
\
\
Podemos usar a relação de transferência de calor na parede:
$
Q = (Delta T)/(R_("tot")) = (T_i - T_e)/(R_("tot"))
$

A resistência total na parede é definida por:
$
R_("tot") = 1/(h_i A) + 1/(h_e A) + L/(h A) 
$

Calculando cada resistência:

$
R_i = 1/(h_i A) = 1/(8*30) = 0,004167 " K/W"
\
R_e = 1/(h_e A) = 1/(25*30) = 0,00133 " K/W"
\
R_h= L/(h A) = (0,30)/(8*30) = 0,01389 " K/W"
$

Somando cada resistência obtida para calcular o $R_("tot")$:

$
R_("tot") = R_i + R_e + R_h = 0,0194 " K/W"
$

Substituindo na equação $(4)$:

$
Q = (Delta T)/(R_("tot")) = (T_i - T_e)/(R_("tot")) = (25 - 0)/(0,0194) = 1289,39 "W" 
$
