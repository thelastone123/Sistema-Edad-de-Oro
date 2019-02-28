 
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class Gastos {
    private int id;
    private String descripcion;
    private String fechaGasto;
    private String origenFondos;
    private double totalGasto;
    private int estado;

    public Gastos() {
    }

    public Gastos(int id, String descripcion, String fechaGasto, String origenFondos, double totalGasto, int estado) {
        this.id = id;
        this.descripcion = descripcion;
        this.fechaGasto = fechaGasto;
        this.origenFondos = origenFondos;
        this.totalGasto = totalGasto;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaGasto() {
        return fechaGasto;
    }

    public void setFechaGasto(String fechaGasto) {
        this.fechaGasto = fechaGasto;
    }

    public String getOrigenFondos() {
        return origenFondos;
    }

    public void setOrigenFondos(String origenFondos) {
        this.origenFondos = origenFondos;
    }

    public double getTotalGasto() {
        return totalGasto;
    }

    public void setTotalGasto(double totalGasto) {
        this.totalGasto = totalGasto;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
