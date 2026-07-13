#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 12 - Equação da continuidade",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "06 de Março de 2026",
  doc,
)

= Questões

*12.1. *Em uma tubulação convergente, sabendo que a área na seção (1) é 30 cm² e na seção (2) é 15 cm² e que a velocidade do fluido triplica após a pasagem, determine qual será a massa específica na saída sabendo que o fluido de trabalho é o ar (compressível) e inicialmente ele está com uma massa específica igual a 1,2 kg/m³.
\
\
- *Dados:*\
$A_1 = 30 " cm"^2 = 3 times 10^(-3) "m²"$\
$A_2 = 15 " cm"^2 = 1,5 times 10^(-3) "m²"$\
$rho_1 = 1,2 "kg/m³"$\
$rho_2 = ?$\
\
- *Resolução:*
De acordo com o enunciado da questão, temos a seguinte relação com as velocidades de entrada e saída:

$
v_2 = 3*v_1
$

Pela equação da continuidade:

$
rho_1 * v_1*A_1 = rho_2 * v_2 *A_2\
rho_2 = (rho_1 * v_1*A_1)/(v_2*A_2) = (rho_1 * v_1*A_1)/(3*v_1*A_2) = (rho_1*A_1)/(3*A_2) = (1,2 * 3times 10^(-3))/(3*1,5 times 10^(-3)) = 0,8 "kg/m³"
$

*12.2.* Em um tanque misturador são adicionados 20 litros/s de água ($ρ_("água")$=1.000 kg/m³) e 10 litros/s de um óleo $(ρ_("óleo")$=900 kg/m3). O resultado da mistura escoa por um duto de saída com área igual a 30 cm². Determine a massa específica e a velocidade da mistura no duto de saída. Considere os dois fluidos incompressíveis.
- *Dados:*\
$A = 30 " cm"^2 = 3 times 10^(-3) "m²"$\
$rho_("água") = 1000 "kg/m³"$\
$rho_("óleo") = 900 "kg/m³" $\
$V_("água") = 20 "l/s" = 0,020 "kg/m³" $\
$V_("óleo") = 10 "l/s" = 0,010 "kg/m³" $\
\
- *Resolução:*

A vazão mássica total é dado por:
$
m_("2") = rho_("água") * V_("água") + rho_("óleo") * V_("água") = (1000*0,020)+(900*0,010) = 29 "kg/s"
$
A vazão total do sistema é dada por:
$
V_("2") = V_("água")*V_("óleo") = 0,020+,0,010 = 0,0,30 "m³/s"
$
#pagebreak()
Podemos calcular a densidade de massa pela relação:
$
rho_("2") = V_("2")/m("total") = 29/(0,03) = 966,67 "Kg/m³"
$

Por fim, a velocidade na saída é dada por:

$
m_("2") = rho_("2")*v_2*A => v_2 = m_2/(A*rho_2) = 29/(966,67*33 times 10^(-3)) = 10 "m/s"
$
