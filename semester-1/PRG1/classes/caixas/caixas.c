#include <stdio.h>

int main(){
    int caixas_produzidas;
    float altura, largura, comprimento, area_superficie, volume, custo, custo_total;

printf("Entre com a altura (m): ");
scanf("%f", &altura);
printf("Entre com a largura (m): ");
scanf("%f", &largura);
printf("Entre com o comprimento (m): ");
scanf("%f", &comprimento);

volume = altura * largura * comprimento;
area_superficie = 2*(largura*altura + altura*comprimento + largura*comprimento);

printf("Área da superfície (m²) = %g\n", area_superficie);
printf("Volume (m³) = %g\n", volume);

printf("Qual a quantidade de caixas a serem produzidas? ");
scanf("%d", &caixas_produzidas);
printf("Qual o custo por metro quadrado (R$)? ");
scanf("%f", &custo);

custo_total = area_superficie * custo * caixas_produzidas;

printf("Custo total: R$ %g\n", custo_total);

    return 0;
}