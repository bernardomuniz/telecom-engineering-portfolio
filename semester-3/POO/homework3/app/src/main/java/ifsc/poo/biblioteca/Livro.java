package ifsc.poo.biblioteca;

import java.util.LinkedList;
import java.util.List;

public class Livro {
    private String titulo, codigo;
    final List<Autor> autores = new LinkedList<>();

    public Livro(String titulo,String codigo, Autor... autores) {
        setTitulo(titulo);
        setCodigo(codigo);

        for (Autor autor : autores) {
            adicionarAutor(autor);
        }
    }

    private boolean  setTitulo (String titulo){
        if(titulo.equals("") || titulo.isEmpty()){
            System.out.println("Título inválido!");
            return false;
        }
        this.titulo = titulo;
        return true;
    }

    private boolean setCodigo(String codigo){
        if(codigo.equals("") || codigo.isEmpty()){
            System.out.println("Código inválido!");
            return false;
        }
        this.codigo = codigo;
        return true;
    }

    private void adicionarAutor(Autor autor){
        autores.add(autor);
    }

    public String getTitulo(){
        return this.titulo;
    }

    public String getCodigo(){
        return this.codigo;
    }

    public List<Autor> getAutores(){
        return autores;
    }

    
    
}
