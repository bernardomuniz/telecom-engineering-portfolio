Protocolos RIP e OSPF
Redes de Computadores
Bernardo Souza Muniz.
16 de Junho de 2026
Engenharia de Telecomunicações - IFSC-SJ
Sumário
1.
Introdução . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ⁠ 3
2.
Topologia de rede para experimentação . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ⁠ 3
3.
RIP . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ⁠ 4
4.
OSPF . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ⁠ 9
5.
Conclusão . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ⁠ 12
Engenharia de Telecomunicações - IFSC-SJ
1.Introdução
Este relatório apresenta as análises práticas realizadas no Laboratório de Redes de Computadores sobre os protocolos de roteamento da Camada 3 (Rede): OSPF (Open Shortest Path First) e RIP (Routing Information Protocol).
2.Topologia de rede para experimentação
O cenário experimental adotado para as análises está ilustrado na Figura 1. A topologia é composta por três roteadores interconectados , delimitando diferentes domínios de broadcast e interligando as subredes dos hosts locais (PC0, PC1 e PC2).
Figura 1: Elaborada pelo Autor
Topologia de computadores e roteadores
Engenharia de Telecomunicações - IFSC-SJ
3.RIP
Inicialmente, foi realizado a anotação das rotas existentes do PC0 para o PC1 e PC2.
Figura 2: Elaborada pelo Autor
Rotas no PC0
Também foram anotadas as tabelas de roteamento de todos os roteadores:
Figura 3: Elaborada pelo Autor
Tabela de roteamento no R0
Figura 4: Elaborada pelo Autor
Tabela de roteamento no R1
Figura 5: Elaborado pelo Autor
Tabela de roteamento no R2
Podemos notar nas tabelas de roteamento que as entregas que são feita de maneira direta possuem a flag U (Up) e a entregas que são feitas de maneira indireta possuem a flag UG (Uplink Gateway).
Engenharia de Telecomunicações - IFSC-SJ
Para avaliar o tempo de convergência da tabela de roteamento utilizando o protocolo RIP, foi desativado o enlace entre os roteadores R0 e R2 e realizado o monitoramento dos pacotes na interface eth2 do R2. Paralelamente, foi mantido um teste de ping contínuo entre o PC0 e o PC2. Em seguida, no R2, foi executado o seguinte comando:
1
ifconfig eth1 down
Ao realizar a queda do enlace, ocorreu a perda de pacotes no ping com sequência 56.
Figura 6: Elaborado pelo Autor
Perca de pacotes de ping ao realizar a queda do enlace R2
Foi possível registrar que a comunicação retornou no ping com sequência 180.
Figura 7: Elaborado pelo Autor
Reativação dos pacotes de ping ao realizar a queda do enlace R2
Engenharia de Telecomunicações - IFSC-SJ
É possível calcular o o tempo de reativação do ping pela diferença entre os números de sequência:
Sequência inicial - Sequência final=180−56=12460≈2minutos(1)
A nova rota do PC0 para o PC2 após a queda do enlace entre R1 e R1 é exibida a seguir:
Figura 8: Elaborado pelo Autor
Nova rota para do PC0 para o PC2
Em comparação com a rota utilizada antes da queda do enlace (apresentada na Figura 1), é possível observar que o tráfego passou a ser encaminhado inicialmente para o endereço IP 10.0.10.2, correspondente ao R1, e somente depois segue para o R2. Anteriormente, o encaminhamento era realizado de forma direta entre R0 e R2, sem a necessidade de passar pelo R1.Também foi possível observar alterações nas rotas de cada roteador:
Figura 9: Elaborado pelo Autor
Nova rota no R2
Figura 10: Elaborado pelo Autor
Nova rota no R0
Engenharia de Telecomunicações - IFSC-SJ
Figura 11: Elaborado pelo Autor
Nova rota no R1
Foi reativado o enlace entre os roteadores R0 e R2. O ping entre o PC0 e o PC2 foi mantido. No R2 foi executado o seguinte comando:
1
ifconfig eth1 up
Ao realizar a reativação do enlace entre os roteadores R0 e R2, não foi possível observar nenhuma queda de ping.
Depois de aguardar cerca de dois minutos, foi traçado um rota novamente para o PC2. É possível observar que o caminho dos pacotes entre R0 e R1 agora é o mesmo que no início do laboratório (figura 1).
Figura 12: Elaborado pelo Autor
Rota no PC0 após o enlace ser reestabelecido
Comparando as rotas antes e depois da queda do enlace, é possível verificar que, na Figura 1, o tráfego originado no PC0 com destino ao PC2 era encaminhado inicialmente para o R0, que por sua vez enviava os pacotes diretamente para o R2. Em seguida, o R2 realizava o encaminhamento final para o PC2.
Após a falha do enlace, conforme ilustrado na Figura 8, houve uma redefinição da rota. O tráfego que anteriormente seguia diretamente para o R2 passou a ser encaminhado pelo R1, que assumiu o papel de rota alternativa até o destino. Dessa forma, a comunicação entre o PC0 e o PC2 foi mantida mesmo após a indisponibilidade do enlace original, demonstrando que houve reformulação das tabelas de roteamento.
Engenharia de Telecomunicações - IFSC-SJ
Ao analisar as mensagens do protocolo RIP no Wireshark, temos o seguinte resultado:
Figura 13: Elaborado pelo Autor
Captura de pacotes na eth2 do R2
Inicialmente, podemos verificar uma mensagem de RIP Request sendo emitida inicialmente pela interface eth2 do R2. A mensagem de request é encaminhada via multicast (com o endereço de destino 224.0.0.9) para os roteadores do cenário solicitando novas rotas para reestabelecimento da comunicação do PC0 com o PC2.O roteador R1 com endereço de IP 10.0.12.1 na interface eth2 escuta as mensagens que foram encaminhadas via multcast pelo R2 e compartilha suas tabelas de roteamento para reestabelecimento da comunicação entre o PC0 com o PC2.Na rota presente na figura 8, podemos comprovar que o R1 foi utilizado como roteador intermediário para realizar a comutação de pacotes entre os dois hosts. O restante da captura mostra somente a manutenção da rede com pacotes de RIP Response, sendo trocado entre os roteadores R1 e R2 para compartilhamento das rotas conhecidas.Abrindo os pacotes de RIPv2, é possível verificar o valor das métricas de cada pacote. A métrica com valor 1 significa que a rede de destino está diretamente conectada ao roteador vizinho. Ela é o menos custo possível para alcançar um rede que não esteja no próprio roteador. As métricas de 2 até 25 indicam a quantidade de roteadores que são necessários para alcançar determinada rede de destino.A métrica com valor 16 é considerada uma métrica infinita no protocolo RIP. Isso significa que a rede de destino é inalcançável, independentemente da quantidade de saltos existentes entre os roteadores. Dessa forma, quando uma rota recebe métrica 16, ela é removida da tabela de roteamento e deixa de ser utilizada para o encaminhamento de pacotes.
Engenharia de Telecomunicações - IFSC-SJ
4.OSPF
Inicialmente, foi realizado a anotação das rotas existentes do PC0 para o PC1 e PC2.
Figura 14: Elaborada pelo Autor
Rotas no PC0
Também foram anotadas as tabelas de roteamento de todos os roteadores:
Figura 15: Elaborada pelo Autor
Tabela de roteamento no R0
Figura 16: Elaborada pelo Autor
Tabela de roteamento no R1
Figura 17: Elaborado pelo Autor
Tabela de roteamento no R2
Engenharia de Telecomunicações - IFSC-SJ
Para avaliar o tempo de convergência da tabela de roteamento utilizando o protocolo OSPF, foi desativado o enlace entre os roteadores R0 e R2 e realizado o monitoramento dos pacotes na interface eth2 do R2. Paralelamente, foi mantido um teste de ping contínuo entre o PC0 e o PC2. Em seguida, no R2, foi executado o seguinte comando:
1
ifconfig eth1 down
Ao realizar a queda do enlace, não foi possível observar perca de pacotes de comunicação entre o PC0 e o PC2, demonstrando que o OSPF é muito mais hábil no estabelecimento de rotas que o protocolo RIP.
Figura 18: Elaborado pelo Autor
Comunicação entre os computadores ao realizar a queda do enlace R2
Foi possível observar também que rota no PC0 para o PC2 mudou de maneira instantânea, uma vez que agora os pacotes passam pelo roteador R1 antes de chegar no R2.
Figura 19: Elaborado pelo Autor
Rota no PC0 após a interface eth1 do R2 ser desativada
Durante os testes utilizando o protocolo OSPF, observou-se que a queda da interface eth1 no R2 não interrompeu a comunicação entre o PC0 e o PC2, mantendo a comunicação constante e sem perda de pacotes. Diferente do cenário com o protocolo RIP, no qual a rede levou cerca de dois minutos para o restabelecimento da comunicação entre os hosts.
Engenharia de Telecomunicações - IFSC-SJ
Ao analisar as mensagens do protocolo OSPF no Wireshark, temos o seguinte resultado:
Figura 20: Elaborado pelo Autor
Filtragem dos pacotes no Wireshark
É possível observar na captura que os principais pacotes trocados entre os roteadores utilizando o protocolo OSPF são os pacotes de “Hello Packet”, “LS Update” e “LS Acknowledge”.O pacote de Hello tem como objetivo descobrir e manter a vizinhança de roteadores conhecidos na rede. Os pacotes são encaminhados via multicast por um roteador para atualizar sua tabela de roteamento e também manter as rotas que já são conhecidas.O pacote de LS Update opera com o objetivo de anunciar novas mudanças na topologia da rede (como a queda de um enlace, por exemplo). Dentro do pacote de LS é possível observar interfaces de rede que estão ativas, endereços IPs, máscaras e o custo de cada caminho para chegar em determinada subrede.O LS Acknowledge opera como um pacote de confirmação de recebimento de LS Update. Sempre que determinado roteado recebe um pacote de LS Update por conte de uma alteração de topologia, ele avisa ao remetente que recebeu a informação encaminhando de volta um pacote de LS Acknowledge. Se caso o roteador que encaminhou o pacote de LS Update não receber a confirmação, novos pacotes de atualização da topologia são encaminhados para que o mapa da rede fique atualizado.
Engenharia de Telecomunicações - IFSC-SJ
5.Conclusão
Após a realização dos testes práticos utilizando os protocolos RIP e OSPF, foi possível concluir que o OSPF oferece uma velocidade de restabelecimento de rotas superior ao protocolo RIP. Após forçar a queda de enlace entre os dois roteadores, o OSPF atualizou rapidamente as rotas para PC2 e impediu a perda de pacotes na comunicação entre os dois computadores. Em contrapartida, ao simular o mesmo cenário utilizando o protocolo RIP, foi possível observar que houve um atraso de aproximadamente 2 minutos para reestabelecer a comunicação entre os dois hosts. De maneira geral, a utilização dos dois protocolos foi importante para permitir que a comunicação entre os dois hosts ainda continuasse, apesar a queda de enlace entre os dois roteadores. Assim, fica evidente a importância da utilização de protocolos IGPs (Interior Gateway Protocols) para a manutenção de links de roteamento e redundância de comunicação em Layer 3.
Engenharia de Telecomunicações - IFSC-SJ