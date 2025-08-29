[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/DaO0-MBc)
# Engenharia de Telecomunicações - Programação Orientada a Objetos
## Bernardo Souza Muniz e Ygor Vinícius Martins - Lista de exercícios 3

### Como usar o repositório
Para clonar o repositório para a sua máquina local utilizando Git, basta executar o seguinte comando no seu terminal:

`https://github.com/sergio-prolo-class/projeto-2-bernardomuniz-ygormartins`

### Sobre
Este repositório tem o objetivo de apresentar a resolução do projeto 2 disciplina de Programação orientada a objetos. 

Para utilizar o projeto, certifique-se de estar dentro da pasta do projeto e com o gradle instalado no seu computador. Digite o seguinte comando no terminal da sua máquina local:

`gradlew run`

Caso queira utilizar o modo cooperativo, digite este comando ao executar o projeto. O modo cooperativo permite a utilização de um segundo jogador controlado pelo mesmo teclado:

`gradlew run -args="coop"`

Se divirta jogando Pac-Man!

#### Diagrama UML:
```mermaid
%%{init: {'flowchart': {'nodeSpacing': 100, 'rankSpacing': 100}}}%%
    classDiagram
        direction LR
        class App{
          mapa: Mapa
          interfaceGrafica: interfaceGrafica
          entrada : Scanner
          jogo: Jogo
          +iniciaJogo()
        }
        class ComponenteMapa{
          - ponto_origem: Ponto
          - ponto_atual: Ponto
          - altura: int
          - largura: int 
          - imagem: Imagem

          +getAltura()int
          +getLargura()int
          +getPontoOrigem()Ponto
          +getPosicaoAtual()Ponto
          +getImage()Imagem
        }
        class InterfaceGrafica{
          - frame: Jframe
          +inicializaInterfaceJogo(jogo: Jogo)void
        }
        class Jogo{
          - mapa: Mapa 
          - interface_grafica : InterfaceGrafica
          - player1: PacMan
          - player2: PacMan
          - score_total: int
          - gameLoop: Timer


          +iniciaJogo() void
          +reiniciaJogo()void
          +reiniciaPosicaoEntidades()void
          +move()void
          +keyReleased(e:KeyEvent)
        }
        class Mapa{
          - cerejas_list: List~Cereja~
          - paredes_list: List~Parede~
          - pacmans_list: List~PacMan~
          - pontinhos_list: List~Pontinhos~
          - fantasma_list: List~Fantasma~
          
          - retraduzMapa(arquivo: Scanner)boolean
          -transformaCaractere(caractere: String, ponto: Ponto)boolean
        }
        class Parede{
          -x: int
          -y:int
          -altura:int
          -largura:int
        }
        class Ponto{
          - x: int
          - y: int
          - ehValida: boolean

          +getX()int
          +getY()int
        }
        class Cereja{
          +powerUp()void
        }
        class Comestiveis{
          -score_gerado: int
          +Comestiveis(ponto: Ponto, imagem: Image, score_gerado: int, altura: int, largura: int)
        }
        class Pontinhos{
          +Pontinhos(ponto: Ponto, imagem: Image, altura: int, largura: int)
        }
        class PowerUp{
          <<interface>>
          powerUp(entidade: PacMan, mapa: Mapa)void
        }
        class Atacar{
          <<interface>>
          atacar()void
        }
        class Comer{
          <<interface>>
          comer(comestivel: Comestiveis)void
        }
        class Mover{
          <<interface>>
          mover(direcao: String, mapa: Mapa)void
        }
        class Entidade{
          - velocidade: Velocidade
          +incrementaPosicaoAtual(x: int, y: int)void
          +setPosicaoAtual(ponto: Ponto)
          +detectaColisao(algo1: ComponenteMapa, algo2: ComponenteMapa)
          +getVelocidade()Velocidade
        }
        class Fantasma{
          -fantasma_normal: Image
          +mover(direcao: String, mapa: Mapa)
        }
        class PacMan{
          -mortal: boolean
          -qtd_vidas: int
          +wrapAround()void
          +mover(direcao: String, mapa: Mapa)void
        }
      class Velocidade{
        -velocidade_passo: int
        -velocidade_x: int
        -velocidade_y: int
        -direcao: String
        +getVelocidadeX()int
        +getVelocidadeY()int
        +getVelocidade_passo()int
        +getDirecao()String
        +atualizaVelocidade(direcao String)
        +parar()void
      }

  

    Ponto --* ComponenteMapa
    Parede --|> ComponenteMapa
    Entidade --|> Mover 
    Entidade --|> ComponenteMapa
    Fantasma --|> Entidade
    Fantasma --|> Atacar
    PacMan --|> Entidade
    PacMan --|> Comer
    Cereja  --|> Comestiveis
    Cereja --|> PowerUp
    Comestiveis --|> ComponenteMapa
    Pontinhos --|> Comestiveis
    Jogo "1" --* "2" PacMan
    Jogo "1" --* "4" Cereja
    Jogo "1" --* "*" Pontinhos
    Jogo "1"--* "4" Fantasma
    Jogo "1" --* "*" Parede
    App "1" --|> "1" Jogo
    Mapa "1" --* "1" Jogo
    InterfaceGrafica "1" --* "1" Jogo
    Velocidade --* Fantasma
    Velocidade --* PacMan
```