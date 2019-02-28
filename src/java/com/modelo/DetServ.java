 
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class DetServ {
    private int idServidor;
    private String fechaIngreso;
    private String fechaNacimiento;
    private String cargo;
    private int estado;

    public DetServ() {
    }

    public DetServ(int idServidor, String fechaIngreso, String fechaNacimiento, String cargo, int estado) {
        this.idServidor = idServidor;
        this.fechaIngreso = fechaIngreso;
        this.fechaNacimiento = fechaNacimiento;
        this.cargo = cargo;
        this.estado = estado;
    }

    public int getIdServidor() {
        return idServidor;
    }

    public void setIdServidor(int idServidor) {
        this.idServidor = idServidor;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
