# Correção

| Questão     | Legibilidade | Diagramas | P1 | P2 | P3 | Total |
|-------------|--------------|-----------|----|----|----|-------|
| Nota máxima | 10           | 10        | 20 | 25 | 35 | 100   |
| Nota        | 6            | 7         | 15 | 18 | 20 | 75    |

- atenção com níveis de indentação
- Várias implementações onde classes diversas têm acesso ao terminal. SoC!

## Diagramas

- membros estáticos não estão sublinhados
- métodos getCoisas() com retorno void?
- P1:
  - Associação entre Register e User é simples mesmo? Usuários existem independentemente do registro na sua aplicação?
- P2:
  - Se objeto Cliente é inicializado com uma Solicitacao, então Manager não depende de Solicitacao? Quem executa a construção de Clientes?
  - Client agrega Managers? Acho que está invertido.
  - Sua fila é de Clientes? Olhando apenas a descrição do problema e o diagrama, para mim parece errado.
- P3:
  - Vários usos de List que eu acredito que deveriam ser Sets. Por exemplo:
    - O autor pode ser autor do mesmo livro várias vezes?
    - O livro pode ter o mesmo autor várias vezes?
    - O mesmo livro pode pertencer a um leitor várias vezes?
    - Biblioteca ter uma lista de cada? Pode ter o mesmo leitor várias vezes?
    - etc...
  - Informações duplicadas nas associações. Por exemplo:
    - Por que Leitor tem uma lista de livros, se a classe Empréstimo já representa esse vínculo?
    - Autor composto por Livros, e Livro composto por Autores.
  - Classe Emprestimo tem um Map de Leitor para List? Uma lista do quê?
  - Agregações, e não composições? Quem cria todas essas classes é App? Cuidado com a responsabilidade única.

## P1

- SoC: classe Register usando o terminal (System.out), deveria ser algo só do App.
  - Nesses casos, prefira retornar Strings ou outro tipo de variável e lidar com mensagens do lado de fora
- Como você não alterou os métodos equals() e hashCode() do objeto User, teve que implementar a verificação na mão. não é boa prática.

### Requisitos Funcionais
- [x] Cadastrar novos usuários
- [x] Remover usuários
- [x] Listar os logins
- [x] Autenticar usuários

## P2

- entendi o que você quis dizer com uma fila de clientes, mas não é a melhor solução para o problema proposto, pois:
  - App está inicializando clientes e registrando se existem múltiplas solicitações do mesmo cliente. Isso deveria ser responsabildiade do Manager
  - a classe Client usa o método estático Manager.addClient(). Isso
    - configura uma dependência que não está no seu diagrama
    - aumenta o acoplamento de maneira desnecessária
- o certo é criar uma lista de Solicitações, e cada solicitação está vinculada com um Cliente.

### Requisitos Funcionais
- [x] Registrar novas solicitações
- [x] Listar os telefones dos clientes registrados
- [x] Imprimir o nome do próximo cliente
- [x] Atender o próximo cliente
- [x] Listar os nomes dos clientes já atendidos
- [x] Listar os telefones dos clientes em espera
- [x] Gerar um relatório estatístico
- [x] ... total de solicitações registradas, atendidas, em espera
- [x] ... distribuição percentual das solicitações por categoria

## P3

- mesmo problema do P1, você não deveria verificar manualmente se um registro já existe quando duplicatas não podem existir. é pra isso que existem Sets ou Maps.
- cuidado com implementações de getter como Biblioteca.getListLivros(){return this.livros} ou Livro.getAutores(){return this.autores}
  - Java opera por referência.
  - Isso significa que qualquer outra classe pode acessar esse método e alterar a lista de livros! (Encapsulamento foi pras cucuia.)
  - prefira retornar uma cópia.
- Autor.livros existe, mas nunca é alterado?
- public Leitor.setId() é algo muito estranho.
  - Geralmente, o identificador de um objeto não pode ser alterado.
  - Deveria ser responsabilidade da classe Leitor manter uma contagem dos Leitores para dar ids únicos.
- Nada contra uma classe que registra o conjunto de empréstimos, mas a Biblioteca deveria cuidar disso, e não App... ou, pelo menos, ter acesso.
- ctrl+c ctrl+v entre getLeitorOrdenado e getLivroOrdenado deixo a desejar
- Requisitos não implementados:
  - métodos que listam leitores e livros só implementam uma das opções (alfabética e ISBN)
  - método que lista empréstimos de um leitor não ordena por data
  - método que empresta livros não desconta quantos livros estão disponíveis na biblioteca

### Requisitos Funcionais
- [x] Cadastrar autores
- [x] Cadastrar livros
- [x] Cadastrar leitores
- [ ] Registrar empréstimos de livros para leitores
- [ ] ... pelo menos uma cópia
- [x] ... leitor não tenha esse livro
- [x] ... leitor possua no máximo 5 livros emprestados
- [x] Listar autores em ordem alfabética
- [x] Listar leitores em ordem alfabética
- [ ] Listar leitores por id
- [ ] Listar livros por título
- [ ] Listar livros por autor
- [x] Listar livros por ISBN
- [ ] Listar empréstimos por data
- [ ] Listar empréstimos de um leitor, por data