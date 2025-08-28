#include <stdio.h>

int main(){
    int n, digito, soma;

    
    printf("Entre com um número não negativo: ");
    scanf("%d", &n);

    soma = 0;

    while (n != 0) {
        digito = n % 10; //Pega o ultimo digito
        soma = soma + digito; //Soma os digitos
        n = n / 10; //Diminui o número de entrada
    }
    printf("Soma dos digitos: %d\n", soma);
    return 0;
}