<%@page import="java.util.ArrayList"%>
<%@page import="AccesoDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="controlUsuarios.jsp" %>
<ul class="nav nav-tabs">
    <li class="active">
        <a data-toggle="tab" onclick="cambioUsuario();" href="#home-2">
            <i class="fa fa-home">Asignar/Quitar</i>
        </a>
    </li>
    <li>
        <a data-toggle="tab" href="#about-2">
            <i class="fa fa-navicon"></i>
            Nuevo
        </a>
    </li>
    <li class="">
        <a data-toggle="tab" onclick="tblEdicionPermisos()" href="#contact-2">
            <i class="fa fa-edit"></i>
            Edici�n
        </a>
    </li>
</ul>
<div class="panel-body">
    <div class="tab-content">
        <!--Contenido de permisos-->
        <div id="home-2" class="tab-pane active">
            Permisos
            <form class="form-horizontal tasi-form" method="post" onsubmit="registrarPadre(); return false;">
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Usuario</label>
                        <div class="col-xs-5 selectContainer">
                            <select class="form-control" onchange="cambioUsuario();" name="cboUsuario" id="cboUsuario">
                                <option value="-1">(Escoja un usuario)</option>
                                <%
                                    ResultSet rs = null;
                                    Conexion conex = new Conexion();
                                    
                                    try{
                                    rs = conex.EjecutarProcedimieto("obtener_usuarios");
                                    boolean band = true;
                                    while(rs.next()){
                                    band= false;    
                                %>1
                                <option value=<%=rs.getObject(1)%>><%=rs.getString(2).toString().toUpperCase()%> <%=rs.getString(3).toString().toUpperCase()%> (<%=rs.getString(4).toString().toUpperCase()%>)</option>
                                <%} conex.Cerrar();
                                    if(band){
                                %>
                                    <option value="-1">(No hay Usuarios)</option>
                                <%}%>
                                <%} catch (Exception ex) {}%>
                            </select>
                        </div>
                  </div>
                            <div id="contArbolPermisos">
                                    <!--<div class="panel-heading">
                                            <input type="checkbox" value="">
                                            <a class="panel-title collapsed menu-collapse" data-toggle="collapse" data-parent="#panel-izquierdo" href="#panel-element-1">
                                                 Usuarios    <span class="glyphicon glyphicon-collapse-down icon-right"></span></a>
                                    </div>
                                    <div id="panel-element-1" class="panel-collapse collapse">
                                            <div class="panel-body icon-right">
                                                <input type="checkbox" value=""> <a class="cursor" onclick="cargar_Datos_Ajax('#cargar_Ajax','movimientos_Usuarios','usuarioNuevoVentas')">Nuevo</a>
                                            </div>
                                    </div>-->
                            </div>
                  
            </form>
        </div>
        <!--Nueva creacion de permisos-->
        <div id="about-2" class="tab-pane">
            <div class="panel-body" >
                <form class="form-horizontal tasi-form" method="post" onsubmit="registrarPadre(); return false;">
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Nivel</label>
                        <div class="col-xs-5 selectContainer">
                            <select class="form-control" onchange="cambioNivel();" name="cboNivel" id="cboNivel">
                                <option value="0">Padre</option>
                                <option value="1">Hijo</option>
                            </select>
                        </div>
                  </div>
                  <div class="form-group">
                      <label class="col-sm-2 col-sm-2 control-label">Orden</label>
                        <div class="col-xs-5 selectContainer">
                            <select class="form-control" name="cboOrden" id="cboOrden">
                                <%
                                    int i =0;
                                    while(i<20){
                                 %>
                                 <option value=<%=(i+1)%>><%=(i+1)%></option>
                                <%i++;}%>
                            </select>
                        </div>
                  </div>  
                    
                  <div class="form-group" id="contPadre">
                          <label class="col-sm-2 col-sm-2 control-label">Descripci�n</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtPadreNombre" maxlength="50" required="true" id="txtPadreNombre" class="form-control">
                           </div>
                      
                  </div>
                  <div class="form-group" id="contHijo" style="display: none;">
                          <label class="col-sm-2 col-sm-2 control-label">Descripci�n</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtHijoNombre" maxlength="50" id="txtHijoNombre" class="form-control">
                           </div>
                      
                  </div>
                  <div class="form-group" id="contHijo1" style="display: none;">
                      <label class="col-sm-2 col-sm-2 control-label">Contenedor</label>
                        <div class="col-sm-4">
                            <input type="text" name="txtConten" maxlength="250" placeholder="(Nombre del Contenedor)" id="txtConten" class="form-control">
                       </div>
                      <label class="col-sm-2 col-sm-2 control-label">Formulario</label>
                        <div class="col-sm-4">
                            <input type="text" name="txtForm" maxlength="250" placeholder="(Ruta del Formulario)" id="txtForm" class="form-control">
                       </div>
                  </div>
                  <div class="form-group">
                      <div class="col-sm-2"></div>
                      <div class="col-sm-10">
                        <button type="submit" class="btn btn-info">Registrar</button>
                      </div>
                  </div>
              </form>
            </div>
        </div>
        <!--Eliminacion de permisos-->
        <div id="contact-2" class="tab-pane ">
            
        </div>
                
    </div>
</div>