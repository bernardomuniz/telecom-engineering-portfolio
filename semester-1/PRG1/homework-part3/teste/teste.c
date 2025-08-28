#include <stdio.h>

typedef struct {
    int idade;
    float altura;
} Pessoa;

void celebrar_aniversario(Pessoa *p) {
    p->idade++;
}

int main() {
    Pessoa prof = {40, 1.64};
    printf("Idade antes: %d\n", prof.idade);
    celebrar_aniversario(&prof);
    printf("Idade depois: %d\n", prof.idade);  // Falha :)
    return 0;
}
