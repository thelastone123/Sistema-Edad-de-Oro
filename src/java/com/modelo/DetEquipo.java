 
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class DetEquipo {
    private int idEquipo;
    private String fechaIngreso;
    private String fechaNacimiento;
    private int hasDetail;

    public DetEquipo() {
    }

    public DetEquipo(int idEquipo, String fechaIngreso, String fechaNacimiento, int hasDetail) {
        this.idEquipo = idEquipo;
        this.fechaIngreso = fechaIngreso;
        this.fechaNacimiento = fechaNacimiento;
        this.hasDetail = hasDetail;
    }

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
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

    public int getHasDetail() {
        return hasDetail;
    }

    public void setHasDetail(int hasDetail) {
        this.hasDetail = hasDetail;
    }
}
