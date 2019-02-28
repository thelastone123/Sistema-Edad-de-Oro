 
package com.modelo;

/**
 *
 * @author Andrés Alfaro
 */
public class DetEvt {
    private int idEvento;
    private String fechaProgramada;
    private String lugar;
    private String hora;
    private double presupuesto;
    private double totalGasto;
    private double residuo;
    private String colaboradores;
    private String servidores;
    private int estado;

    public DetEvt() {
    }

    public DetEvt(int idEvento, String fechaProgramada, String lugar, String hora, double presupuesto, double totalGasto, double residuo, String colaboradores, String servidores, int estado) {
        this.idEvento = idEvento;
        this.fechaProgramada = fechaProgramada;
        this.lugar = lugar;
        this.hora = hora;
        this.presupuesto = presupuesto;
        this.totalGasto = totalGasto;
        this.residuo = residuo;
        this.colaboradores = colaboradores;
        this.servidores = servidores;
        this.estado = estado;
    }

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getFechaProgramada() {
        return fechaProgramada;
    }

    public void setFechaProgramada(String fechaProgramada) {
        this.fechaProgramada = fechaProgramada;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public double getPresupuesto() {
        return presupuesto;
    }

    public void setPresupuesto(double presupuesto) {
        this.presupuesto = presupuesto;
    }

    public double getTotalGasto() {
        return totalGasto;
    }

    public void setTotalGasto(double totalGasto) {
        this.totalGasto = totalGasto;
    }

    public double getResiduo() {
        return residuo;
    }

    public void setResiduo(double residuo) {
        this.residuo = residuo;
    }

    public String getColaboradores() {
        return colaboradores;
    }

    public void setColaboradores(String colaboradores) {
        this.colaboradores = colaboradores;
    }

    public String getServidores() {
        return servidores;
    }

    public void setServidores(String servidores) {
        this.servidores = servidores;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
}
