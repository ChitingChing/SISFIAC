/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

/**
 *
 * @author Usuario08
 */
public class ClsMaestria {
    private int idMaestria;
    private String descripcion;
    private char estado;

    public ClsMaestria() {
    }

    public ClsMaestria(int idMaestria, String descripcion, char estado) {
        this.idMaestria = idMaestria;
        this.descripcion = descripcion;
        this.estado = estado;
    }

    public int getIdMaestria() {
        return idMaestria;
    }

    public void setIdMaestria(int idMaestria) {
        this.idMaestria = idMaestria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }
    
    
}
