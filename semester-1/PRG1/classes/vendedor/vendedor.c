#include <stdio.h>

int main(){
    const int salario_fixo = 2000;
    float comissao, vendas, salario_total;
    int desempenho;

    printf("Entre com o total de vendas (R$): ");
    scanf("%f", &vendas);
    printf("Entre com a avaliação de desempenho (1-10): ");
    scanf("%d", &desempenho);
    
    if (vendas >= 10000){
        comissao = 0.07 * vendas;
        salario_total = salario_fixo + comissao;
    } else {
        comissao = 0.05 * vendas;
        salario_total = salario_fixo + comissao;
    }
    if (desempenho >= 8){
        salario_total = salario_fixo + 500;
    }

    printf("Remuneração: R$ %.2f\n", salario_total);

    return 0;
}