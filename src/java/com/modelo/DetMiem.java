 
package com.modelo;

import java.io.InputStream;

/**
 *
 * @author Andrés Alfaro
 */
public class DetMiem {
    private int idMiembro;
    private String fechaIngreso;
    private String fechaNacimiento;
    private String medicamentos;
    private String discapacidad;
    private String enfermedad;
    private String nombreEmergencia;
    private String parentesco;
    private String telefonoEmergencia;
    private int hasDetail;

    public DetMiem() {
    }

    public DetMiem(int idMiembro, String fechaIngreso, String fechaNacimiento,String medicamentos, String discapacidad, String enfermedad, String nombreEmergencia, String parentesco, String telefonoEmergencia, int hasDetail) {
        this.idMiembro = idMiembro;
        this.fechaIngreso = fechaIngreso;
        this.fechaNacimiento = fechaNacimiento;
        this.medicamentos = medicamentos;
        this.discapacidad = discapacidad;
        this.enfermedad = enfermedad;
        this.nombreEmergencia = nombreEmergencia;
        this.parentesco = parentesco;
        this.telefonoEmergencia = telefonoEmergencia;
        this.hasDetail = hasDetail;
    }

    public int getIdMiembro() {
        return idMiembro;
    }

    public void setIdMiembro(int idMiembro) {
        this.idMiembro = idMiembro;
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

    public String getMedicamentos() {
        return medicamentos;
    }

    public void setMedicamentos(String medicamentos) {
        this.medicamentos = medicamentos;
    }

    public String getDiscapacidad() {
        return discapacidad;
    }

    public void setDiscapacidad(String discapacidad) {
        this.discapacidad = discapacidad;
    }

    public String getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(String enfermedad) {
        this.enfermedad = enfermedad;
    }

    public String getNombreEmergencia() {
        return nombreEmergencia;
    }

    public void setNombreEmergencia(String nombreEmergencia) {
        this.nombreEmergencia = nombreEmergencia;
    }

    public String getParentesco() {
        return parentesco;
    }

    public void setParentesco(String parentesco) {
        this.parentesco = parentesco;
    }

    public String getTelefonoEmergencia() {
        return telefonoEmergencia;
    }

    public void setTelefonoEmergencia(String telefonoEmergencia) {
        this.telefonoEmergencia = telefonoEmergencia;
    }

    public int getHasDetail() {
        return hasDetail;
    }
    
    public void setHasDetail(int hasDetail) {
        this.hasDetail = hasDetail;
    }
}
