/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author DAVID
 */
public class Tecnico {
    private String nombre;
    private int numeroIncidencias;
    
    public Tecnico(String nombre, int numeroIncidencias){
        this.nombre = nombre;
        this.numeroIncidencias = numeroIncidencias;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroIncidencias() {
        return numeroIncidencias;
    }

    public void setNumeroIncidencias(int numeroIncidencias) {
        this.numeroIncidencias = numeroIncidencias;
    }
    
    
}
