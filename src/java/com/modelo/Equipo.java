 
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class Equipo {
    private int id;
    private String nombres;
    private String apellidos;
    private String telefono;
    private int edad;
    private String dui;
    private String direccion;
    private String tipo;
    private int estado;
    private int hasDetail;

    public Equipo() {
    }

    public Equipo(int id, String nombres, String apellidos, String telefono, int edad, String dui, String direccion, String tipo, int estado, int hasDetail) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.edad = edad;
        this.dui = dui;
        this.direccion = direccion;
        this.tipo = tipo;
        this.estado = estado;
        this.hasDetail = hasDetail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    public int getHasDetail() {
        return hasDetail;
    }

    public void setHasDetail(int hasDetail) {
        this.hasDetail = hasDetail;
    }
}
