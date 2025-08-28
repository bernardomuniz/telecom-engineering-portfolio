#include <stdio.h>

int main (){
    float pes, polegadas, altura, altura_polegadas;

    // 1 polegada = 2.54 cm ; 1 pé = 12 polegadas

    printf("Entre com sua altura em pés + polegadas (ex: 5 10): ");
    scanf("%f%f", &pes, &polegadas);

    altura_polegadas = pes * 12; //Conversão de pés para polegadas
    altura = (altura_polegadas + polegadas) * 2.54;
    altura = altura / 100;

    printf("Altura em metros: %.2f\n", altura);

    return 0;
}