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
public class ClsDetallePermiso {
    private int idDetallePermiso;
    private int idPermiso;
    private int idUsuario;
    private char estado;

    public ClsDetallePermiso() {
    }

    public ClsDetallePermiso(int idDetallePermiso, int idPermiso, int idUsuario, char estado) {
        this.idDetallePermiso = idDetallePermiso;
        this.idPermiso = idPermiso;
        this.idUsuario = idUsuario;
        this.estado = estado;
    }

    public int getIdDetallePermiso() {
        return idDetallePermiso;
    }

    public void setIdDetallePermiso(int idDetallePermiso) {
        this.idDetallePermiso = idDetallePermiso;
    }

    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }
    
   
}
