/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package negocio;

import java.sql.Date;

/**
 *
 * @author Usuario08
 */
public class ClsPromocion {
    private int idPromocion;
    private int descripcion;
    private Date fechaResolucion;
    private Date fechaInicio;
    private Date fechaFin;
    private int cupo;
    private int nCuotas;
    private int idMaestria;
    private int idUsuario;

    public ClsPromocion() {
    }

    public ClsPromocion(int idPromocion, int descripcion, Date fechaResolucion, Date fechaInicio, Date fechaFin, int cupo, int nCuotas, int idMaestria, int idUsuario) {
        this.idPromocion = idPromocion;
        this.descripcion = descripcion;
        this.fechaResolucion = fechaResolucion;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.cupo = cupo;
        this.nCuotas = nCuotas;
        this.idMaestria = idMaestria;
        this.idUsuario = idUsuario;
    }

    public int getIdPromocion() {
        return idPromocion;
    }

    public void setIdPromocion(int idPromocion) {
        this.idPromocion = idPromocion;
    }

    public int getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(int descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaResolucion() {
        return fechaResolucion;
    }

    public void setFechaResolucion(Date fechaResolucion) {
        this.fechaResolucion = fechaResolucion;
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

    public int getCupo() {
        return cupo;
    }

    public void setCupo(int cupo) {
        this.cupo = cupo;
    }

    public int getnCuotas() {
        return nCuotas;
    }

    public void setnCuotas(int nCuotas) {
        this.nCuotas = nCuotas;
    }

    public int getIdMaestria() {
        return idMaestria;
    }

    public void setIdMaestria(int idMaestria) {
        this.idMaestria = idMaestria;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    
}
