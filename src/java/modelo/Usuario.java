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
public class Usuario {
    private String usuario;
    private String contraseña;
    private String rol;
    
    public Usuario(String usuario, String contraseña, String rol){
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.rol = rol;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    
    
    
    public void iniciarSesion(String usuario, String contraseña){
        
    }
    
    public void cerrarSesion(String usuario){
        
    }
}
