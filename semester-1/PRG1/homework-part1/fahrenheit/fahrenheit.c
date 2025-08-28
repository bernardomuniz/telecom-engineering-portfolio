#include <stdio.h>

int main(){
    float fahrenheit, celsius;

    printf("Entre com a temperatura em Fahrenheit: ");
    scanf("%f", &fahrenheit);

    celsius = (fahrenheit - 32.0) * 5/9;
    printf("Temperatura em Celsius: %.1f\n", celsius);
    return 0;
}