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
public class ClsMatricula {
    private int idMatricula;
    private int nMatricula;
    private Date fechaMatricula;
    private int descColegiatura;
    private char estado;
    private int idPromocion;
    private int idEstudiante;

    public ClsMatricula() {
    }
    
    

    public ClsMatricula(int idMatricula, int nMatricula, Date fechaMatricula, int descColegiatura, char estado, int idPromocion, int idEstudiante) {
        this.idMatricula = idMatricula;
        this.nMatricula = nMatricula;
        this.fechaMatricula = fechaMatricula;
        this.descColegiatura = descColegiatura;
        this.estado = estado;
        this.idPromocion = idPromocion;
        this.idEstudiante = idEstudiante;
    }

    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }

    public int getnMatricula() {
        return nMatricula;
    }

    public void setnMatricula(int nMatricula) {
        this.nMatricula = nMatricula;
    }

    public Date getFechaMatricula() {
        return fechaMatricula;
    }

    public void setFechaMatricula(Date fechaMatricula) {
        this.fechaMatricula = fechaMatricula;
    }

    public int getDescColegiatura() {
        return descColegiatura;
    }

    public void setDescColegiatura(int descColegiatura) {
        this.descColegiatura = descColegiatura;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public int getIdPromocion() {
        return idPromocion;
    }

    public void setIdPromocion(int idPromocion) {
        this.idPromocion = idPromocion;
    }

    public int getIdEstudiante() {
        return idEstudiante;
    }

    public void setIdEstudiante(int idEstudiante) {
        this.idEstudiante = idEstudiante;
    }
    
    
}
