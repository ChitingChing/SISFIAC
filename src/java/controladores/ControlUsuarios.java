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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author server
 */
@WebServlet(name = "ControlUsuarios", urlPatterns = {"/ControlUsuarios.dbo"})
public class ControlUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            String usuario = request.getParameter("txt_User").toString();
            String clave = request.getParameter("txt_Pass").toString();
            
            String passw = Class_Encript.getStringMessageDigest(clave, Class_Encript.SHA256);
            
            Conexion conex = new Conexion();
            conex.Conectar();
            ResultSet resultado;
            String [] param = {usuario,passw};
            boolean band = false;
            try {
                //comparando datos                                     
                resultado = conex.EjecutarProcedimietoFullParametros("usuario_acceso", param);
                while(resultado.next()){
                    //Parametros de la bd para guardar en la sesion
                    request.getSession().setAttribute("id",resultado.getString(3));//Cedula del usuario
                    request.getSession().setAttribute("usuario", resultado.getString(1)+" "+resultado.getString(2));//Nombre del usuario
                    request.getSession().setAttribute("rol", resultado.getString(4));//Rol del usuario
                    request.getSession().setAttribute("estado", "ok");
                    band = true;
                }
                conex.Cerrar();
                if(band){
                    
                    String rol_Usuario = (String) request.getSession().getAttribute("rol");
                    
                    if(rol_Usuario.equals("Administrador") || rol_Usuario.equals("Secretario(a)")){
                        //Administrador y secretaria
                        //RequestDispatcher rd = request.getRequestDispatcher("Admin/PanelAdministracion.jsp");
                        //rd.forward(request, response);
                        response.sendRedirect("Admin/PanelAdministracion.jsp");
                    }
                    else if(rol_Usuario.equals("Profesor(a)")){
                        //Usuarios y docentes
                        response.sendRedirect("Admin/PanelUsuarioDocente.jsp");
                    }
                }else{
                    request.getSession().setAttribute("error","error");
                    response.sendRedirect("login.jsp");
                   }
            } catch (Exception e) {
                request.getSession().setAttribute("error","error");
                response.sendRedirect("login.jsp");
            }
            
            //out.println("Usuario o contraseña incorrecta");
            conex.Cerrar();
        } finally {
            out.close();
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
