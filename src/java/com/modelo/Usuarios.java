
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class Usuarios {
    private int id;
    private String usuario;
    private String pass;
    private int nivel;

    public Usuarios() {
    }

    public Usuarios(int id, String usuario, String pass, int nivel) {
        this.id = id;
        this.usuario = usuario;
        this.pass = pass;
        this.nivel = nivel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }
    
}
