/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import AccesoDatos.Conexion;

/**
 *
 * @author Usuario08
 */
public class ClsPermisos {
    private int idPermiso;
    private String descripcion;
    private int padre;
    private String form;
    private int orden;
    private char estado;

    public ClsPermisos() {
    }

    public ClsPermisos(int idPermiso, String descripcion, int padre, String form, int orden, char estado) {
        this.idPermiso = idPermiso;
        this.descripcion = descripcion;
        this.padre = padre;
        this.form = form;
        this.orden = orden;
        this.estado = estado;
    }

    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPadre() {
        return padre;
    }

    public void setPadre(int padre) {
        this.padre = padre;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }
   //Metodo para actualizar los detalles de permisos como nombre, form y orden
    public String actualizarPermisoDetalles(){
        Conexion conex = new Conexion();
        conex.Conectar();
        String [] param = {String.valueOf(getIdPermiso()),getDescripcion(),getForm(), String.valueOf(getOrden())};
        String [] paramTipo = {"int","string","string","int"};
        conex.EjecutarProcedimietoFullParametrosxTipoValor("actualizarPermisoDetalles", param, paramTipo);
        return "";
    }
    
}
