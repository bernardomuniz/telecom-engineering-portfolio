#include <math.h>
#include <stdio.h>


typedef struct{
    float lado_a, lado_b, angulo;
}Paralelogramo;


int main(){
    Paralelogramo paralelogramo;
    float perimetro, area;

    printf("Entre com os lados do paralelogramo: ");
    scanf("%f%f", &paralelogramo.lado_a, &paralelogramo.lado_b);
    printf("Entre com o ângulo (graus): ");
    scanf("%f", &paralelogramo.angulo);

    perimetro = (2*paralelogramo.lado_a) + (2*paralelogramo.lado_b);

    area = paralelogramo.lado_b * paralelogramo.lado_a * sin(paralelogramo.angulo * M_PI/180);

    printf("Perímetro: %g\n", perimetro);
    printf("Área: %g\n", area);

    return 0;
}