#include <stdio.h>

char decompor(float numero, int *parte_int, float *parte_frac){
    char sinal;
    if (numero > 0) {
        sinal = '+';
    }else if (numero < 0) {
        numero = -numero;
        sinal = '-';
    }else {
        sinal = ' ';
    }

    *parte_int = (int)numero;
    *parte_frac = numero - *parte_int;
    return sinal;

}

int main (){
    float number, fracionada;
    int inteira;
    char r;

    printf("Entre com um número real: ");
    scanf("%f", &number);

    r = decompor(number, &inteira, &fracionada);

    printf("Sinal: %c\n",r);
    printf("Parte inteira: %d\n", inteira);
    printf("Parte fracionária: %.2f\n",fracionada);
    return 0;

}