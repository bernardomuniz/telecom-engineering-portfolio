#include <stdio.h>

int main(){
    float operador1, operador2, resultado;
    char operador;

    printf("Entre com a expresão (ex: 12 + 15): ");
    scanf("%f %c %f", &operador1,&operador,&operador2);

    switch(operador) {
        case '+':
            resultado = operador1 + operador2;
            break;
        case '-':
            resultado = operador1 - operador2;
            break;
        case '*':
            resultado = operador1 * operador2;
            break;
        case '/':
           if (operador2 == 0) {
           printf("Divisão por zero!\n");
           break;
           }
            resultado = operador1 / operador2;
            break;
        default:
            printf("Operação inválida!\n");
    }

    printf("Resultado: %g\n", resultado); //%g é em forma compacta.

    return 0;
}
