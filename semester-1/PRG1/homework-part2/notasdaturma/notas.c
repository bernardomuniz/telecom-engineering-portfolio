#include <stdio.h>

int main (){
    int n_alunos, n_provas;
    float notas_aluno, media_alunos, media_turma;

    printf("Entre com o número de alunos: ");
    scanf("%d", &n_alunos);
    printf("Entre com o número de provas: ");
    scanf("%d", &n_provas);

    for (int i = 1; i <= n_alunos; i++) {
        media_alunos = 0;
        printf("\nEntre com as notas do aluno %d: ", i);
        for (int i = 1; i <= n_provas; i++) {
            scanf("%f", &notas_aluno);
            media_alunos += notas_aluno;
        }
        media_alunos /= n_provas;
        media_turma += media_alunos;
        if (media_alunos >= 6.0) {
            printf("Aluno %d aprovado com média %.1f\n", i, media_alunos);
        }else {
             printf("Aluno %d reprovado com média %.1f\n", i, media_alunos);
        }
    }
    printf("A média da turma foi %g\n", media_turma/n_alunos);




    return 0;
}