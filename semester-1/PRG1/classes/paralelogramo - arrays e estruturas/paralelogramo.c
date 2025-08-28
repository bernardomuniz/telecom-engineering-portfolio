#include <stdio.h>
#include <math.h>

typedef struct{
    float lado_1, lado_2, angulo;
}Parelogramo;


int main(){

    Parelogramo p;
    float perimetro, area;

    printf("Entre com os lados: ");
    scanf("%f%f", &p.lado_1, &p.lado_2);
    
    printf("Entre com o ângulo em graus: ");
    scanf("%f", &p.angulo);

    perimetro = 2*(p.lado_1 + p.lado_2);
    area = p.lado_1 * p.lado_2 * sin(p.angulo * M_PI / 180);

    printf("Perimetro: %g\n", perimetro);
    printf("Área: %g\n", area);

    return 0;
}