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
public class ClsAsistencia {
    private int idAsistencia;
    private char estado;
    private String observacion;
    private int idMatricula;
    private int idModulo;

    public ClsAsistencia() {
    }
    
    public ClsAsistencia(int idAsistencia, char estado, String observacion, int idMatricula, int idModulo) {
        this.idAsistencia = idAsistencia;
        this.estado = estado;
        this.observacion = observacion;
        this.idMatricula = idMatricula;
        this.idModulo = idModulo;
    }

    public int getIdAsistencia() {
        return idAsistencia;
    }

    public void setIdAsistencia(int idAsistencia) {
        this.idAsistencia = idAsistencia;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }

    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }
    
    
}
