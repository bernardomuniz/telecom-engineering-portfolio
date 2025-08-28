#include <stdio.h>

int main(){
    float peso, altura, imc;

    printf("Entre com seu peso (kg): ");
    scanf("%f", &peso);
    printf("Entre com sua altura (m): ");
    scanf("%f", &altura);

    imc = peso / (altura * altura);
    printf("IMC: %.2f kg/m²\n", imc);

    if (imc < 18.5){
        printf("Classificação: Abaixo do peso\n");
    }else if (imc <= 24.99) {
        printf("Classificação: Peso normal\n");
    }else if (imc <= 29.9){
        printf("Classificação: Sobrepeso\n");
    }else{
        printf("Classificação: Obesidade\n");
    }

    return 0;
}