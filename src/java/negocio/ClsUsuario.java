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
public class ClsUsuario {
    private int idUsuario;
    private String cedPasaporte;
    private String nombres;
    private String apellidos;
    private String direccion;
    private String telefono;
    private String email;
    private char estadoCivil;
    private char sexo;
    private Date fechaNacimiento;
    private String celular;
    private char estado;
    private String nick;
    private char clave;//ojoooo
    private String usuarioBd;
    private char claveBd;
    private int idTipoUsuario;

    public ClsUsuario() {
    }

    public ClsUsuario(int idUsuario, String cedPasaporte, String nombres, String apellidos, String direccion, String telefono, String email, char estadoCivil, char sexo, Date fechaNacimiento, String celular, char estado, String nick, char clave, String usuarioBd, char claveBd, int idTipoUsuario) {
        this.idUsuario = idUsuario;
        this.cedPasaporte = cedPasaporte;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.estadoCivil = estadoCivil;
        this.sexo = sexo;
        this.fechaNacimiento = fechaNacimiento;
        this.celular = celular;
        this.estado = estado;
        this.nick = nick;
        this.clave = clave;
        this.usuarioBd = usuarioBd;
        this.claveBd = claveBd;
        this.idTipoUsuario = idTipoUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getCedPasaporte() {
        return cedPasaporte;
    }

    public void setCedPasaporte(String cedPasaporte) {
        this.cedPasaporte = cedPasaporte;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public char getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(char estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public char getEstado() {
        return estado;
    }

    public void setEstado(char estado) {
        this.estado = estado;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public char getClave() {
        return clave;
    }

    public void setClave(char clave) {
        this.clave = clave;
    }

    public String getUsuarioBd() {
        return usuarioBd;
    }

    public void setUsuarioBd(String usuarioBd) {
        this.usuarioBd = usuarioBd;
    }

    public char getClaveBd() {
        return claveBd;
    }

    public void setClaveBd(char claveBd) {
        this.claveBd = claveBd;
    }

    public int getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }
    
    
    
}
