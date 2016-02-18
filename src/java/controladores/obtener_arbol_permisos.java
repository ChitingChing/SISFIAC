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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author Usuario08
 */
@WebServlet(name = "obtener_arbol_permisos", urlPatterns = {"/obtener_arbol_permisos.dbo"})
public class obtener_arbol_permisos extends HttpServlet {

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
           // out.println("<!DOCTYPE html>");
           //Falta Validar si el usuario ya tiene permisos en detalle_usuario
            String codigo = request.getParameter("codigo");
            ResultSet rs = null;
            ResultSet rs1 = null;
            JSONObject jsObj = new JSONObject();
            JSONArray jsArray = new JSONArray();
            
            JSONObject jsObj1 = new JSONObject();
            JSONArray jsArray1 = new JSONArray();
            Conexion conex = new Conexion();
            conex.Conectar();
            
            String str = "";
            
            String [] paramTipo = {"int","int"};
            boolean band = true;
            try {
            //Si el usuario Tiene Permisos Asignados
            
            
                    rs = conex.EjecutarProcedimieto("obtener_arbol_permisos");
                    while(rs.next()){
                        jsObj.put("id", rs.getInt(1));
                        jsObj.put("nombre", rs.getObject(2));
                        jsObj.put("padre", rs.getObject(3));
                        jsObj.put("orden", rs.getObject(4));
                        String [] param = {codigo, String.valueOf(rs.getInt(1))};
                        if(rs.getInt(3) > 0){
                            rs1 = conex.EjecutarProcedimietoFullParametrosxTipoValor("obtener_arbol_permisoDetalles", param, paramTipo);
                            while(rs1.next()){
                                band = false;
                                jsObj.put("estado", rs1.getObject(1)+"0");
                            }
                            
                        }
                            if(band){
                                jsObj.put("estado", rs.getObject(5));
                            }
                            band = true;
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
