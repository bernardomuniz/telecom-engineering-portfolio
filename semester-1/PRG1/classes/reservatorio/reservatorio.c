#include <stdio.h>
#include <stdbool.h>

int main(void){

    const int capacidade_reservatorio = 400;
    int soma_litros = 0, i = 1, dia = 1;
    float qtd_chuva, espaço_livre;
    bool validacao;

    while (i <= 7) {
        printf("Entre com a quantidade de chuva do dia %d em litros: ", dia);
        scanf("%f", &qtd_chuva);
        soma_litros += qtd_chuva;
        if (soma_litros > capacidade_reservatorio) {
            validacao = false;
            break;
        }else if (soma_litros < capacidade_reservatorio && dia == 7) {
            espaço_livre = 400 - soma_litros;
            validacao = true;
            break;
        }
        dia++;
    }
    if (validacao) {
        printf("O reservatório não transbordou. Espaço livre: %g\n", espaço_livre);
    }else {
        printf("O reservatório transbordou no dia %d\n", dia);
    }
    return 0;
}