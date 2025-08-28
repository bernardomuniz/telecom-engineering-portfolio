#include <stdio.h>


int main(){
    float doacao, imposto, acumulativo;

    printf("Entere com o valor da doação: ");
    scanf("%f", &doacao);


    if (doacao <= 20000) {
        imposto = 0.01 * doacao;
    }else if (doacao <= 50000) {
        doacao = doacao - 20000;
        imposto = (20000 * 0.01) + (doacao * 0.03);
    }else if (doacao <= 150000) {
        doacao =  doacao - 20000;
        doacao = doacao - 30000;
        imposto = (20000 * 0.01) + (30000 * 0.03) + (doacao * 0.05);
    }else if (doacao > 150000) {
        doacao = doacao - 50000;
        doacao = doacao - 150000;
        imposto = (20000 * 0.01) + (30000 * 0.03) + (100000 * 0.05) + (0.07 * doacao);
    }

    printf("Imposto a ser pago: %.1f\n", imposto);

    return 0;
}