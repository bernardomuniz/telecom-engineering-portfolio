# Correção

## Diagrama

- multiplicidades ausentes em praticamente todo o diagrama
- atributos estáticos devem ser sublinhados (como eu imagino que sejam os da classe Constantes)
- métodos abstratos devem ser itálicos (como eu imagino que devam ser alguns de ObjetoDeDesenho)
- setas erradas
  - implementação de uma interface -> seta tracejada com a ponta triangular vazada
    - que não é o que tu colocou entre ObjetoDeDesenho e FiguraGeometrica
    - entre Desenhista e DrawListener (escrito errado) está com a seta errada, na direção errada
  - dependência -> seta tracejada com a ponta simples
    - que é o que eu imagino que tu quis colocar entre App e Canvas, App e Desenhista
    - que é o que eu imagino que deve ser usado entre Constantes e Desenhista, Cnstantes e Canvas

## Implementação

- uso de polimorfismo não indicado em lugar algum do código

## Requisitos funcionais

- [x] Impressão com o mouse
- [x] Seleção de figuras
- [x] Seleção de cores
- [x] Seleção de modo
- [x] Seleção de tamanho
- [x] Movimento
- [x] Limpeza
- [x] Processamento

## Nota

9