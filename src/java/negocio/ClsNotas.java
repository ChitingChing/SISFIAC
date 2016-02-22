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
public class ClsNotas {
    private int idNotas;
    private float calificacion;
    private String observacion;
    private char estado;
    private int idModulo;
    private String notaTexto;
    private int idMatricula;

    public ClsNotas() {
    }

    public ClsNotas(int idNotas, float calificacion, String observacion, char estado, int idModulo, String notaTexto, int idMatricula) {
        this.idNotas = idNotas;
        this.calificacion = calificacion;
        this.observacion = observacion;
        this.estado = estado;
        this.idModulo = idModulo;
        this.notaTexto = notaTexto;
        this.idMatricula = idMatricula;
    }

    public int getIdNotas() {
        return idNotas;
    }

    public void setIdNotas(int idNotas) {
        this.idNotas = idNotas;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public String getNotaTexto() {
        return notaTexto;
    }

    public void setNotaTexto(String notaTexto) {
        this.notaTexto = notaTexto;
    }

    public int getIdMatricula() {
        return idMatricula;
    }

    public void setIdMatricula(int idMatricula) {
        this.idMatricula = idMatricula;
    }
    
    
}
