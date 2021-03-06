/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import AccesoDatos.Conexion;
import encriptacion.Class_Encript;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Usuario08
 */
@WebServlet(name = "registrarPermisos", urlPatterns = {"/registrarPermisos.dbo"})
public class registrarPermisos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //Este servlet registra el arbol, para asignar permiso a los usuarios
            String codigo = request.getParameter("codigo").toString();
            String nombre = request.getParameter("nombre").toString().toUpperCase();
            String orden = request.getParameter("orden").toString();
            String contenedor = request.getParameter("contenedor").toString();
            String ruta = request.getParameter("ruta").toString();
            //Validar que no dejen Datos en blanco ojo
            Conexion conex = new Conexion();
            conex.Conectar();
            ResultSet resultado;
            String dir ="";
            if(contenedor != "" && ruta != "")
                dir = "CargarPaginaURL('"+contenedor+"','"+ruta+"')";
            else
                dir = "";
            
            String [] param = {codigo,nombre,orden,dir};
            String [] paramTipo = {"int","string","int","string"};
            
            try {
                resultado = conex.EjecutarProcedimietoFullParametrosxTipoValor("registrar_permisos", param, paramTipo);
                conex.Cerrar();
            } catch (Exception e) {
            }
            
            String estado = conex.getEstado_BD();
            out.println(estado);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
