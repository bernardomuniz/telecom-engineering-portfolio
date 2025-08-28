package ifsc.poo.biblioteca;

import java.util.LinkedList;
import java.util.List;

public class Biblioteca {
    static List<Autor> autores = new LinkedList<>();
    static List<Leitor> leitores = new LinkedList<>();
    static List<Livro> livros = new LinkedList<>();
    //Adiciona um novo autor
    static void addAutor(Autor autor){
        boolean cadastrado = false;
        for(Autor a: autores){
            if(a.getNome().equalsIgnoreCase(autor.getNome())){
                System.out.println(autor.getNome() + " já está cadastrado!");
                cadastrado = true;
            }
        }

        if(!cadastrado){
            autores.add(autor);
        }
    }

    //Adiciona um novo autor
    static void addLeitor(Leitor leitor){
        leitores.add(leitor); //Adiciona um novo autor 
        leitor.setId(leitores.size()); //Cria um ID na hora do cadastro

    }

    static void getAutorOrdenado(){
        if(!autores.isEmpty()){
            System.out.println("{Autores ordenados por nome}");
            autores.sort( (a1,a2) -> a1.getNome().compareTo(a2.getNome()));

            for(Autor a : autores){
                System.out.println("Autor{nome=" + a.getNome() + "}");
            }
        }else{
            System.out.println("Lista de autores vazia!");
        }
    }
    //id = 1, nome = bernardo
    //id = 2, nome = germano
    static void getLeitorOrdenado(){
        if(!leitores.isEmpty()){
            System.out.println("{Leitores ordenados por ID e nome}");

            leitores.sort( (l1,l2) -> l1.getNome().compareTo(l2.getNome()));
            for(Leitor l : leitores){
                System.out.println("Leitor{id = " + l.getId() + ",nome = " + l.getNome() + "}");
            }
            }
        else{
            System.out.println("Lista de leitores vazia!");
        }
    }

     static private String formataAutores(List<Autor> autors){
        String autor = "";
        for(Autor a : autors){
            autor += a.getNome() + ", ";
        }
        String autorformatado = autor.substring(0, autor.length() - 1);
        return autorformatado;
    }

    static void getLivrosOrdenado(){
        if(!leitores.isEmpty()){
            System.out.println("{Livros ordenados por ID, título e autores}");

            livros.sort( (l1,l2) -> l1.getCodigo().compareTo(l2.getCodigo()));
            for(Livro l : livros){
                System.out.println("Livro{id = " + l.getCodigo() + ", título = " + l.getTitulo() + ", autores = "  + formataAutores(l.getAutores()) +"}");
            }
            }
        else{
            System.out.println("Lista de leitores vazia!");
        }
    }

    static void addLivro(Livro livro){
        livros.add(livro);
    }

    static List<Livro> getListLivros(){
        return livros;
    }


}
