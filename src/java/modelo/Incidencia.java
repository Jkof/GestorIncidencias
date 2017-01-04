/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Date;

/**
 *
 * @author DAVID
 */
public class Incidencia {
    private String identificador;
    private String descripcion;
    private String inventarioAfectado;
    private String usuario;
    private String prioridad;
    private String categoria;
    private Date fechaInicio;
    private Date fechaFin;
    private String tecnico;
    private boolean resuelta;
    private String resolucion;

    public Incidencia(String descripcion, String inventarioAfectado, 
            String usuario, String prioridad, String categoria) {
        this.descripcion = descripcion;
        this.inventarioAfectado = inventarioAfectado;
        this.usuario = usuario;
        this.prioridad = prioridad;
        this.categoria = categoria;
    }

    public String getIdentificador() {
        return identificador;
    }

    public void setIdentificador(String identificador) {
        this.identificador = identificador;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getInventarioAfectado() {
        return inventarioAfectado;
    }

    public void setInventarioAfectado(String inventarioAfectado) {
        this.inventarioAfectado = inventarioAfectado;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getTecnico() {
        return tecnico;
    }

    public void setTecnico(String tecnico) {
        this.tecnico = tecnico;
    }

    public boolean isResuelta() {
        return resuelta;
    }

    public void setResuelta(boolean resuelta) {
        this.resuelta = resuelta;
    }

    public String getResolucion() {
        return resolucion;
    }

    public void setResolucion(String resolucion) {
        this.resolucion = resolucion;
    }
    
}
