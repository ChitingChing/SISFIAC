/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import AccesoDatos.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author server
 */
@WebServlet(name = "obtenerMenuNavUsuario", urlPatterns = {"/obtenerMenuNavUsuario.dbo"})
public class obtenerMenuNavUsuario extends HttpServlet {

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
            ResultSet rs = null;
            JSONObject jsObj = new JSONObject();
            JSONArray jsArray = new JSONArray();
            Conexion conex = new Conexion();
            conex.Conectar();
            boolean band= false;
            String codigo = "";
            codigo = request.getSession().getAttribute("id").toString();
            String [] param = {codigo};
            String [] paramTipo = {"int"};
            try {
                rs = conex.EjecutarProcedimietoFullParametrosxTipoValor("obtenerMenuNavUsuario",param,paramTipo);
                while(rs.next()){
                    band = true;
                    jsObj.put("padre", rs.getObject(1));
                    jsObj.put("nombre", rs.getObject(2));
                    jsObj.put("urls", rs.getObject(3));
                    jsObj.put("id", rs.getObject(4));
                    jsArray.add(jsObj);
                }
                out.println(jsArray);

            } catch (Exception ex) {
                
            }
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
