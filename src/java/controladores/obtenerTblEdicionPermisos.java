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

/**
 *
 * @author server
 */
@WebServlet(name = "obtenerTblEdicionPermisos", urlPatterns = {"/obtenerTblEdicionPermisos.dbo"})
public class obtenerTblEdicionPermisos extends HttpServlet {

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
            //out.println("<!DOCTYPE html>");
            
            String str = "<div class=\"panel-body table-responsive\">\n" +
"                <table class=\"table table-hover\">\n" +
"                    <thead>\n" +
"                        <tr style=\"background-color: #9d9d9d;\">\n" +
"                          <th>Id</th>\n" +
"                          <th>Descripción</th>\n" +
"                          <th>Padre</th>\n" +
"                          <th>Formulario</th>\n" +
"                          <th>Orden</th>\n" +
"                          <th>Editar</th>\n" +
"                          <th>Eliminar</th>\n" +
"                      </tr>\n" +
"                   </thead>\n" +
"                   <tbody>";
                                 int i = 0, j=0, contador=0, fila = 0, conTxt=0;
                                 ResultSet rs;
                                 ArrayList _padre = new ArrayList();
                                 ArrayList _nombre = new ArrayList();
                                 ArrayList _urls = new ArrayList();
                                 ArrayList _ids = new ArrayList();
                                 ArrayList _orden = new ArrayList();
                                 boolean band = false;
                                contador = 0;
                                conTxt=0;
                                
                                _padre.clear();
                                _nombre.clear();
                                _urls.clear();
                                _ids.clear();
                                _orden.clear();
                                
                                Conexion conex = new Conexion();
                                conex = new Conexion();
                                    
                                    
                                    String valor = request.getSession().getAttribute("id").toString();
                                    String [] param = {valor};
                                    String [] paramTipo = {"int"};
                                     try {
                                 rs = conex.EjecutarProcedimietoFullParametrosxTipoValor("obtenerMenuNavUsuario", param, paramTipo);
                                 
                                 while(rs.next()){
                                     _padre.add(rs.getInt(1));
                                     _nombre.add(rs.getString(2));
                                     if(rs.getObject(3) != null)
                                        _urls.add(rs.getString(3));
                                     else
                                         _urls.add("");
                                     _ids.add(rs.getInt(4));
                                     _orden.add(rs.getInt(5));
                                 }
                                 conex.Cerrar();
                                     }catch (Exception e) {}
                                    
                                
                                 
                                     for(i = 0;i<_padre.size();i++){
                                if(Integer.parseInt(_padre.get(i).toString())==0){
                                    fila = 0;
                                    band = false;
                                    for(j = 0;j<_padre.size();j++){
                                        if(Integer.parseInt(_ids.get(i).toString())==Integer.parseInt(_padre.get(j).toString())){
                                            band = true;
                                        }
                                    }
                                    if(band){
                                     str += "<tr class=\""+contador+"\" style=\"background-color: #2cb9b3;\">\n" +
"                                    <td>"+_ids.get(i)+"</td>\n" +
"                                    <td class=\"col-md-2 form-group\"><input class=\"form-control\" disabled=\"true\" type=\"text\" name=\"txtNombre"+conTxt+"\" id=\"txtNombre"+conTxt+"\" style=\"border: none; background-color: #2cb9b3;\" value=\""+_nombre.get(i)+"\"></td>\n" +
"                                    <td>"+_padre.get(i)+"</td>\n" +
"                                    <td>"+_urls.get(i)+"</td>\n" +
"                                    <td>"+_orden.get(i)+"</td>\n" +
"                                    <td><button id=\"btnEditar"+conTxt+"\" onclick=\"editarPermiso('"+contador+"','"+_ids.get(i)+"','"+fila+"','"+conTxt+"')\" class=\"btn btn-default btn-xs\"><i class=\"fa fa-pencil\"></i></button></td>\n" +
"                                    <td><button id=\"btnEliminarPermiso"+conTxt+"\" onclick=\"eliminarPermiso('"+contador+"','"+_ids.get(i)+"','"+fila+"')\" class=\"btn btn-default btn-xs\"><i class=\"fa fa-times\"></i></button></td>\n" +
"                                </tr>";
                                     for(j = 0;j<_padre.size();j++){
                                    if(Integer.parseInt(_ids.get(i).toString())==Integer.parseInt(_padre.get(j).toString())){
                                        //contador++;
                                        conTxt++;
                                        fila++;
                                        str+="<tr class=\""+contador+"\">\n" +
"                                            <td>"+_ids.get(j)+"</td>\n" +
"                                            <td><input class=\"form-control\" disabled=\"true\" type=\"text\" name=\"txtNombre"+conTxt+"\" id=\"txtNombre"+conTxt+"\" style=\"border: none;\" value=\""+_nombre.get(j)+"\"></td>\n" +
"                                            <td>"+_padre.get(j)+"</td>\n" +
"                                            <td class=\"col-md-8 form-group\"><input disabled=\"true\" class=\"form-control\" type=\"text\" name=\"txtUrls"+conTxt+"\" id=\"txtUrls"+conTxt+"\" style=\"border: none; width: 100%;\" value=\""+_urls.get(j)+"\"></td>\n" +
"                                            <td>"+_orden.get(j)+"</td>\n" +
"                                            <td class=\"col-md-1 form-group\">\n" +
"                                                <button id=\"btnEditar"+conTxt+"\" onclick=\"editarPermiso('"+contador+"','"+_ids.get(j)+"','"+fila+"','"+conTxt+"')\" class=\"btn btn-default btn-xs\"><i class=\"fa fa-pencil\"></i></button>\n" +
"                                            </td>\n" +
"                                            <td><button id=\"btnEliminarPermiso"+conTxt+"\" onclick=\"eliminarPermiso('"+contador+"','"+_ids.get(j)+"','"+fila+"')\" class=\"btn btn-default btn-xs\"><i class=\"fa fa-times\" alt=\"delete\"></i></button></td>\n" +
"                                        </tr>";
                                }
                            }
                                }
                        }
                                contador++;conTxt++;
                    }
                   
                                str += "</tbody>\n" +
"                </table>\n" +
"                </div>";
                out.println(str);
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

