package ifsc.poo.biblioteca;

import java.util.LinkedList;
import java.util.List;

public class Autor {
    private String nome, idioma;
    final List<Livro> livros = new LinkedList<>();

    public Autor(String nome, String idioma) {
        setNome(nome);
        setIdioma(idioma);
    }

    private boolean setNome(String nome){
        if(nome == null || nome.isEmpty()){
            System.out.println("Nome inválido!");
            return false;
        }
        this.nome = nome;
        return true;
    }

    private boolean setIdioma(String idioma){
        if(idioma == null || idioma.isEmpty()){
            System.out.println("Idioma inválido!");
            return false;
        }
        this.idioma = idioma;
        return true;
    }

    public void adicionarLivro(Livro livro) {
        livros.add(livro);
    } 

    public String getNome() {
        return this.nome;
    }

    public String getIdioma() {
        return this.idioma;
    }

}
