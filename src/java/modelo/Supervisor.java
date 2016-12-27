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
public class Supervisor extends Usuario{
    
    public int incidenciasAsignadas;
    
    public Supervisor(String usuario, String contraseña){
        super(usuario, contraseña);
        incidenciasAsignadas = 0;
    }
    
    public void asignarIncidencia(Incidencia incidencia, Tecnico tecnico){
        
    }
    
    public void cerrarIncidencia(Incidencia incidencia){
        
    }
    
    public void generarInforme(){
        
    }
}
