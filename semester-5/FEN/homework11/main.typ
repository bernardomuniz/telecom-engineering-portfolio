#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Atividade 11 - Hidrostática",
  subtitle: "Fenômenos de Transporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "29 de Abril de 2026",
  doc,
)

= Questões

*11.1.* Qual a pressão total que atua em mergulhador que está a 20 m deprofundidade? Caso o mergulhador escale uma montanha com 2.000 m de altura, qual a nova pressão que atuará sobre ele? Considere a massa específica da água como sendo 1.000 kg/m3, a massa específica do ar como sendo 1,2 kg/m3, a aceleração gravitacional é 9,81 m/s2 e a pressão atmosférica é 101,3 kPa.
\
\
Pressão total a 20 metros de profundidade:
$
p = p_("atm") + p g h = 101,3*10^3 + 100 * 9.81*20 = 297,5 "kPa"
$

Pressão total a 2000 metros de altura:

$
p = p_("atm") + p g h = 101,3*10^3 - (1,2 * 9.81*2000) = 77,76 "kPa"
$
\
*
11.2.* Considerando um elevador hidráulico, estime o peso e a massa possíveis de serem sustentados pelo peso de uma criança de 30kg se a relação de entre as áreas dos êmbolos é de 1 para 8.
\
\
A relação entre as áreas conforme o enunciado é dada por:
$
A_1/A_2 = 1/8 => F_1/F_2 = 1/8 therefore F_2 = 8 * F_1
$
Assim:

$
F_2 = 8 * F_1 <=> m_2 g = 294,3*8 => m_2 = (294,3)/(9,81) = 240 "kg"
$

Podemos encontrar o peso a partir da seguinte equação:

$
P_2 = m_2 * g => P_2 = 240* 9,81 = 2354,4 "N"
$

\
*11.3.* Se o pistão menor de um elevador hidráulico tem diâmetro de 3,72cm e o maior tem um diâmetro de 51,3cm, que peso colocado sobre o menor será capaz de sustentar 18,6 kN (carro) aplicados sobre o pistão maior? Qual a distância que o pistão menor percorrerá para levantar o carro de 1,65m? Qual o trabalho realizado pelo elevador?
\
\
A área de cada pistão é dada por:
$
A_1 = pi * r_1^2 = pi * (D_1/2)² = 0,001 "m²"\
A_2 = pi * r_2^2 = pi * (D_2/2)² = 0,513 "m²"\
$

#pagebreak()

Peso a ser colocado no pistão menor:

$
F_1/A_1 = F_2/A_2 => F_1 = (F_2 *A_2)/A_2 = (18,6*10³*0,001)/02 therefore F_1 = 93 N
$

Distância percorrida pelo pistão menor:

$
d_1A_1 = d_2A_2 => d_1 = d_2 * (A_2/A_1) = 1,65 * (0,2/0,001) therefore d_1 = 330 "m"
$

Trabalho realizado:
\
\
O trabalho realizado é dado pela seguinte equação:
$
W = F_2 d_2 => W = 18600 * 1,65 = 30690 "j" 
$

*11.4.* Calcule qual o volume total de um iceberg, cujo volume visível é de  200m3. Qual a massa do iceberg? Dados massa específica da água do mar: líquida: 1.030 kg/m3; sólida: 917 kg/m3.

Sabe-se que o volume total é dado pela seguinte relação:
$
V_("tot") = V_("visível") + V_("submerso")
$

Assim:

$
m_("corpo") * g = m_("fluído")*g \
rho_c * V_c = rho_f * V_f\
V_("corpo") = (rho_f * V_f)/rho_c = (1030*200)/917 = 224 "m³"
$

O volume total é:

$
V_("tot") = V_("visível") + V_("submerso") = 424 m³
$

A massa é dada pela seguinte relação:
$
rho = m/v => m=rho v = 917*424 = 389*10³ "kg"
$

*11.5.* Um bloco de madeira flutua na água com 64,6% do seu volume submerso. No óleo 91,8% do seu volume fica submerso. Considere a massa específica da água 1.000 kg/m3. Determine: a) massa específica da madeira e b) do  óleo.
\
\
Água:
$64,6% V_("tot")$ $=>$ 35,4% submerso
\
\
Óleo:
$91,8% V_("tot")$ $=>$ 8,2% submerso
\
\
#pagebreak()
Massa específica da madeira:

$
rho_m * V_c = rho_f * V_a => rho_c * V_c = rho_f * 0,354 *V_c\
rho_m = 354 "kg"/m³
$

Massa específica do óleo:

$
rho_m * V_c = rho_o * V_o => rho_c * V_c = rho_o * 0,082 *V_c\
rho_o = 4317 "kg"/m³
$


$
B(-1+sqrt(2)/2) * (sqrt(2)/2 +  sqrt(2)/2) = 12 (-1+sqrt(2)/2)^2-4(-1+sqrt(2)/2) +5\

C(-1-sqrt(2)/2) * (-sqrt(2)/2 -  sqrt(2)/2) = 12 (-1-sqrt(2)/2)^2-4(-1-sqrt(2)/2) +5
$

$
Y(s) = 1/((s^2+0,5s+1))
$