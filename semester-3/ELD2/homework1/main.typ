#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Contador BCD",
  subtitle: "Eletrônica Digital II",
  authors: ("Bernardo Souza Muniz",),
  date: "09 de Maio de 2025",
  doc,
)

= Introdução

O objetivo deste documento é apresentar um código em *_VHDL (VHSIC Hardware Description Language)_* que realiza a contagem binária de 000 até 999, estruturado em dois segmentos: um de lógica sequencial e outro de lógica combinacional. Além do desenvolvimento do código, são apresentados dados de verificação de desempenho, como a frequência máxima (Fmax), número de pinos utilizados e quantidade de elementos lógicos consumidos. A plataforma de desenvolvimento utilizada foi o Quartus Prime, e a simulação foi realizada com o ModelSim.

= Código BDC
O código de contagem é dividido em dois blocos principais: um responsável pela lógica sequencial (State Register) e outro pela lógica combinacional (Next State Logic). Ele realiza a contagem binária de 000 até 999, separando os dígitos em unidade, dezena e centena. O objetivo final é que todas as casas numéricas atinjam o valor "1001" ao término da contagem.

== Parte sequencial - State Register
O primeiro segmento do código se trata do State register, que é sensível ao clock e ao reset. O objetivo do State Register é resetar todas as unidades de contagem para "000" quando a varíavel *_enable_* for igual a "1". Caso não estiver ativo, o processo só executa durante uma borda de subida (rising edge) do clock. Durante o clock os valores do próximo estado são armazenados nos registradores. 

#sourcecode[```tcl process(clock, reset)
begin
    if (reset = '1') then
        reg_unidade <= (others => '0');
        reg_dezena  <= (others => '0');
        reg_centena <= (others => '0');
        
    elsif rising_edge(clock) then
        reg_centena <= centena_next;
        reg_dezena  <= dezena_next;
        reg_unidade <= unidade_next;
    end if;
end process;```]
== Parte combinacional - Next State Logic
O segundo segmento se baseia no cálculo do próximo estado. Dentro desete processo, as variáveis de próximo estado são atualizadas cada vez que as varíaveis de registro são igual a "1001" --- 9 em binário.

#sourcecode[```tcl process(reg_unidade, reg_dezena, reg_centena, enable)
begin
    -- para evitar o latch quando enable for diferente de 1,
    -- nesse caso os valores permanecem os mesmos e nao mudam
    unidade_next <= reg_unidade;
    dezena_next  <= reg_dezena;
    centena_next <= reg_centena;

    if enable = '1' then
        if reg_unidade = "1001" then  -- 9 em binário
            unidade_next <= (others => '0');

            if reg_dezena = "1001" then
                dezena_next <= (others => '0');

                if reg_centena = "1001" then
                    centena_next <= (others => '0');
                else
                    centena_next <= reg_centena + 1;
                end if;
            else
                dezena_next <= reg_dezena + 1;
            end if;
        else
            unidade_next <= reg_unidade + 1;
        end if;
    end if;
end process;```]


= Desempenho do Código
Uma vez feito a descrição do código em VHDL, foi utilizado a família de FPGA *CYCLONE IV* e o dispositivo *EP4CE6E22A7*. Foram verificados os valores de tensão de alimentação do núcleo e o número de elementos lógicos.


#figure(
  figure(
    image("imagem2.png"),
    numbering: none,
    caption: [Core voltage]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    image("imagem1.png", width: 80%),
    numbering: none,
    caption: [Número de elementos lógicos]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Após a compilação do projeto, foi verificado um total de 16 elementos lógicos e uma tensão de 1.2 V.



== Fmax
Para a obtenção dos valores da Fmax do projeto, foram utilizados dados presentes no *Compilation Report* na pasta *Timing Analyzer*. Os resultados obtidos estão presentes na figura 3.

#figure(
  figure(
    image("imagem3.png", width: 110%),
    numbering: none,
    caption: [Fmax na primeira compilação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Ao fazer a primeira compilação do projeto sem demais alterações para otimização, foi obtido um valor Fmax de 353.4 Mhz.

=== Fmax com restrição de frequência máxima de Clock
No intuito de diminui a frequência do Fmax, foi utilizado um arquivo *.sdc* contendo um comando para a configuração de restrição do Clock do projeto.

#sourcecode[```tcl create_clock -name CLOCK -period 20 [get_ports -no_case {clock}]```]

Após a execução do projeto utilizando o código com restrições no arquivo *.sdc*, o valor de Fmax foi reduzido para um valor de 259.47 MHz e os mesmos valores de pinos e elementos lógicos.

#figure(
  figure(
    image("imagem4.png"),
    numbering: none,
    caption: [Valor do Fmax após a utilização da restrição de frequência do Clock]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Fmax com Seed
Foi feito também a utilização de uma Seed para a configuração do compilador com o intuito de obervar os valores do Fmax após a alteração.

#figure(
  figure(
    image("imagem5.png", width: 80%),
    caption: [Optimization mode]
  ),
   numbering: none,
  caption: figure.caption([Fonte: Elaborado pelo autor], position: top)
)

Foi selecionado as opções de "Power (High effort - increases runtime)" e configurado uma Seed com valor 1.
#figure(
  figure(
    image("imagem6.png", width: 60%),
    caption: [Seed]
  ),
   numbering: none,
  caption: figure.caption([Fonte: Elaborado pelo autor], position: top)
)

#figure(
  figure(
    image("imagem7.png", width: 100%),
    caption: [Fmax com Seed]
  ),
   numbering: none,
  caption: figure.caption([Fonte: Elaborado pelo autor], position: top)
)

Ao compilar novamente o projeto, foi obtido um tempo de Fmax igual a 259.47 MHz e os mesmos valores de pinos e elementos lógicos.

= Resultados
Após a compilação do projeto, foi efetuado o teste do código no Modelsim para a visualização das unidades do contador.

#figure(
  figure(
    image("imagem8.png", width: 100%),
    caption: [Início do contador]
  ),
   numbering: none,
  caption: figure.caption([Fonte: Elaborado pelo autor], position: top)
)

Após definir uma variação de clock e definir o reset com valor 1, todas as variáveis ficaram zeradas.

#figure(
  figure(
    image("imagem9.png", width: 100%),
    caption: [Início do contador]
  ),
   numbering: none,
  caption: figure.caption([Fonte: Elaborado pelo autor], position: top)
)

Agora com o enable e a variação de clock ativa, após avançar no tempo verifica-se que todas as variáveis de contagem ficaram com valor "1001", como era esperado. 

== Tabela de resultados
A tabela a seguir mostra todos os resultados obtidos durante as 3 compilações feitas, incluindo o número de elementos lógicos, pinos e Fmax obtida.



#figure(
  figure(
    table(
      align: auto,
      columns: 4,
      [*Compilação*],[*Fmax (MHz)*], [*Elementos lógicos*], [*Pinos*],
      [Primeira compilação], [353,48], [16], [15],
      [Restrição de Clock], [259,47],  [16], [15],
      [Compilação com Seed],  [259,47],  [16], [15]
    ),
    numbering: none,
    caption: [Tabela de resultados de compilação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão
Conclui-se que a utilização de dois segmentos no desenvolvimento do código proporcionou resultados significativamente mais consistentes em comparação à abordagem com apenas um segmento. Os objetivos definidos no início do projeto foram plenamente alcançados, culminando na implementação bem-sucedida de um contador binário que vai de 000 até 999.

