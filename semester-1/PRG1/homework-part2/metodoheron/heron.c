#include <stdio.h>

float double_a(double a){

    if (a < 0) {
    a = -(a);
    }
    return a;
}
int main (){
    double x;
    float diferença = 0 , aproximação, aproximação2;

    printf("Entre com o valor de x: ");
    scanf("%lf", &x);
    aproximação = (x/2) + (1/x);
    diferença = aproximação - x;
    x = aproximação;
        while (diferença > 0.0001) {
       aproximação = (x/2) + (1/x);
       printf("%.9f", aproximação);
       diferença = aproximação - x;
       diferença = double_a(diferença);
       x = aproximação;
        }
        printf("%.9f", aproximação);




    return 0;
}