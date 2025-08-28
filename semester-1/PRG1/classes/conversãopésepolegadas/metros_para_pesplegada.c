#include <stdio.h>
    // 1 polegada = 2.54 cm ; 1 pé = 12 polegadas
    // 5 pes e 8 polegadas = 1.73
int main (){
    float altura;
    int polegada, pes;

    printf("Entre com sua altura em metros: ");
    scanf("%f", &altura);

    altura = altura * 100; //Transformando metros para centimetros para fazer as conversões na mesma medida.
    polegada = altura / 2.54; //Transformando os centímetros para polegadas. 
    pes = polegada / 12;
    polegada = polegada % 12;

    printf("Altura em pés + polegadas: %d %d\n", pes, polegada);

    return 0;

}