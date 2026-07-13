#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Dimensionamento de Estação de Bombeamento",
  subtitle: "Fenômenos do Trasporte",
  authors: ("Bernardo Souza Muniz.",),
  date: "24 de Junho de 2026",
  doc,
)

= Atividade A
Uma estação de irrigação capta 20 l/s de água de um canal. A temperatura da água é de 25°C ($rho$=1000 kg/m³ e $ν=1,127 times 10^6$ m²/s ). Os diâmetros da tubulação de aspiração e de recalque são iguais a 130mm (aprox. 5”). Considere uma tubulação de PVC com rugosidade absoluta igual a 0,013mm. Determine a altura manométrica e a potência de acionamento da bomba considerando um rendimento global de 80%. Dado g = 9,81
m/s².
\
\
Acessórios:
\
- Sucção: 1 válvula de pé (considere que inclui a parte da tubulação submersa); 1 curva
de 90º:
\
- Descarga: 1 curva de 90º; 1 válvula de retenção após a bomba (metálica); 1 saída de
tubulação 

#figure(
  figure(
    rect(image("questao.png", width: 100%)),
    numbering: none,
  ),
)

= Resolução


#figure(
  figure(
    rect(image("q1.png", width: 100%)),
    numbering: none,
  ),
)

#pagebreak()
#figure(
  figure(
    rect(image("q4.png", width: 100%)),
    numbering: none,
  ),
)

\
#figure(
  figure(
    rect(image("q3.png", width: 100%)),
    numbering: none,
  ),
)
\
Portanto, com base nos cálculos realizados, obtemos:

- *Altura Manométrica*
$
Z_m = 22,32 "m"
$

- *Potência de Acionamento da bomba*
$
W_("bomba") = 5473,92 "W"
$
