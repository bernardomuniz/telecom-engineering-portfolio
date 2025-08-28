package ifsc.poo.biblioteca;

public class App {
    public static void main(String[] args) {
        Autor a1 = new Autor("J.R.R. Tolkien", "Inglês");
        Autor a2 = new Autor("George Orwell", "Inglês");
        Autor a3 = new Autor("Gabriel García Márquez", "Espanhol");
        Autor a4 = new Autor("Miguel de Cervantes", "Espanhol");
        Autor a5 = new Autor("Franz Kafka", "Alemão");
        Autor a6 = new Autor("Jane Austen", "Inglês");
        Autor a7 = new Autor("Machado de Assis", "Português");
        Autor a8 = new Autor("Brian W. Kernighan", "Inglês");
        Autor a9 = new Autor("Dennis Ritchie", "Inglês");
        Biblioteca.addAutor(a1);
        Biblioteca.addAutor(a2);
        Biblioteca.addAutor(a3);
        Biblioteca.addAutor(a4);
        Biblioteca.addAutor(a5);
        Biblioteca.addAutor(a6);
        Biblioteca.addAutor(a7);
        Biblioteca.addAutor(a8);
        Biblioteca.addAutor(a9);


        Livro l1 = new Livro("O Senhor dos Anéis", "ISBN001", a1);
        Livro l2 = new Livro("O Senhor dos Anéis", "ISBN001", a1); //MESMO ISBN 
        Livro l3 = new Livro("A Metamorfose", "ISBN003", a5);
        Livro l4 = new Livro("Cem Anos de Solidão", "ISBN004", a3);
        Livro l5 = new Livro("Dom Quixote", "ISBN005", a4);
        Livro l6 = new Livro("Orgulho e Preconceito", "ISBN006", a6);
        Livro l7 = new Livro("Memórias Póstumas de Brás Cubas", "ISBN007", a7);
        Livro l8 = new Livro("The C Programming Language", "ISBN008", a8, a9); 

        //Adicinando dois livros do Senhor dos Anéis
        Biblioteca.addLivro(l1);
        Biblioteca.addLivro(l2);
        Biblioteca.addLivro(l3);
        Biblioteca.addLivro(l4);
        Biblioteca.addLivro(l5);
        Biblioteca.addLivro(l6);
        Biblioteca.addLivro(l7);
        Biblioteca.addLivro(l8);


        Leitor L1 = new Leitor("Benardo", "Rua das Palmeiras, 123", "48999112233");
        Leitor L2 = new Leitor("Germano", "Avenida Central, 456", "48998887766");
        Leitor L3 = new Leitor("Ygor", "Travessa dos Ipês, 789", "48997776655");  
        Leitor L4 = new Leitor("Clara", "Rua das Acácias, 321", "48996665544");
        Leitor L5 = new Leitor("Lucas", "Rua dos Cravos, 654", "48995554433");
        Leitor L6 = new Leitor("Anderson", "Palhoça", "48995554433");
        Biblioteca.addLeitor(L1);
        Biblioteca.addLeitor(L2);
        Biblioteca.addLeitor(L3);
        Biblioteca.addLeitor(L4);
        Biblioteca.addLeitor(L5);
        Biblioteca.addLeitor(L6);

        Biblioteca.getAutorOrdenado();
        System.out.println("");
        Biblioteca.getLeitorOrdenado();
        System.out.println("");
        Biblioteca.getLivrosOrdenado();
        System.out.println("");

        Emprestimo.registraEmprestimos(l1, L3, "15/01/2006");
        Emprestimo.registraEmprestimos(l2, L3, "22/03/2007");
        Emprestimo.registraEmprestimos(l3, L3, "05/07/2008");
        Emprestimo.registraEmprestimos(l4, L3, "12/11/2009");
        Emprestimo.registraEmprestimos(l6, L3, "28/08/2010");
        Emprestimo.registraEmprestimos(l6, L3, "28/08/2010"); //Aqui não vai conseguir registrar pois o leitor ja tem 5 livros emprestados
        System.out.println("");
        Emprestimo.listarEmprestimos(L3);
        
    }
}