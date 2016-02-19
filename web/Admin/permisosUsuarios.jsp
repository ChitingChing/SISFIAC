<%@page import="java.util.ArrayList"%>
<%@page import="AccesoDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<ul class="nav nav-tabs">
    <li class="active">
        <a data-toggle="tab" href="#home-2">
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
        <a data-toggle="tab" href="#contact-2">
            <i class="fa fa-edit"></i>
            Edición
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
                                    conex.Conectar();
                                    try{
                                    rs = conex.EjecutarProcedimieto("obtener_usuarios");
                                    boolean band = true;
                                    while(rs.next()){
                                    band= false;    
                                %>1
                                <option value=<%=rs.getObject(1)%>><%=rs.getString(2).toString().toUpperCase()%> <%=rs.getString(3).toString().toUpperCase()%> (<%=rs.getString(4).toString().toUpperCase()%>)</option>
                                <%} 
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
                          <label class="col-sm-2 col-sm-2 control-label">Descripciòn</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtPadreNombre" maxlength="50" style="text-transform: uppercase;" required="true" id="txtPadreNombre" class="form-control">
                           </div>
                      
                  </div>
                  <div class="form-group" id="contHijo" style="display: none;">
                          <label class="col-sm-2 col-sm-2 control-label">Descripciòn</label>
                            <div class="col-sm-10">
                                <input type="text" name="txtHijoNombre" maxlength="50" style="text-transform: uppercase;" id="txtHijoNombre" class="form-control">
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
            Edición
            
            <div class="panel-body table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr style="background-color: #9d9d9d;">
                          <th>Id</th>
                          <th>Descripción</th>
                          <th>Padre</th>
                          <th>Formulario</th>
                          <th>Orden</th>
                          <th>Editar</th>
                          <th>Eliminar</th>
                      </tr>
                   </thead>
                   <tbody>
                <%! 
                                 int i = 0, j=0, contador=0;
                                 ResultSet rs;
                                 ArrayList _padre = new ArrayList();
                                 ArrayList _nombre = new ArrayList();
                                 ArrayList _urls = new ArrayList();
                                 ArrayList _ids = new ArrayList();
                                 ArrayList _orden = new ArrayList();
                                 boolean band = false;
                             %>
                            <%
                                contador = 0;
                                _padre.clear();
                                _nombre.clear();
                                _urls.clear();
                                _ids.clear();
                                _orden.clear();
                                    conex = new Conexion();
                                    conex.Conectar();
                                    
                                    String valor =  session.getAttribute("id").toString();
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
                                     }catch (Exception e) {
            }%>
                                    
                            <%
                                for(i = 0;i<_padre.size();i++){
                                if(Integer.parseInt(_padre.get(i).toString())==0){
                                    band = false;
                                    for(j = 0;j<_padre.size();j++){
                                        if(Integer.parseInt(_ids.get(i).toString())==Integer.parseInt(_padre.get(j).toString())){
                                            band = true;
                                        }
                                    }
                                 if(band){
                                     
                            %>
                            <tr id="<%=contador%>" style="background-color: #2cb9b3;">
                                    <td><%=_ids.get(i)%></td>
                                    <td class="col-md-2 form-group"><input class="form-control" disabled="true" type="text" name="txtNombre<%=contador%>" id="txtNombre<%=contador%>" style="border: none; background-color: #2cb9b3;" value="<%=_nombre.get(i)%>"></td>
                                    <td><%=_padre.get(i)%></td>
                                    <td><%=_urls.get(i)%></td>
                                    <td><%=_orden.get(i)%></td>
                                    <td><button onclick="editarPermiso('<%=contador%>','<%=_ids.get(i)%>')" class="btn btn-default btn-xs"><i class="fa fa-pencil"></i></button></td>
                                    <td><button onclick="eliminarPermiso('<%=contador%>','<%=_ids.get(i)%>')" class="btn btn-default btn-xs"><i class="fa fa-times"></i></button></td>
                                </tr>
                            <%
                                
                                for(j = 0;j<_padre.size();j++){
                                    if(Integer.parseInt(_ids.get(i).toString())==Integer.parseInt(_padre.get(j).toString())){
                                        contador++;
                            %>
                                    
                                        <tr id="<%=contador%>">
                                            <td><%=_ids.get(j)%></td>
                                            <td><input class="form-control" disabled="true" type="text" name="txtNombre<%=contador%>" id="txtNombre<%=contador%>" style="border: none;" value="<%=_nombre.get(j)%>"></td>
                                            <td><%=_padre.get(j)%></td>
                                            <td class="col-md-8 form-group"><input class="form-control" type="text" name="txtUrls<%=contador%>" id="txtUrls<%=contador%>" style="border: none; width: 100%;" value="<%=_urls.get(j)%>"></td>
                                            <td><%=_orden.get(j)%></td>
                                            <td><button onclick="editarPermiso('<%=contador%>','<%=_ids.get(j)%>')" class="btn btn-default btn-xs"><i class="fa fa-pencil"></i><i class="fa fa-save"></i></button></td>
                                            <td><button onclick="eliminarPermiso('<%=contador%>','<%=_ids.get(j)%>')" class="btn btn-default btn-xs"><i class="fa fa-times" alt="delete"></i><i class="fa fa-recycle"></i></button></td>
                                        </tr>
                            <%}}%>
                            <%}}contador++;}%>
                </tbody>
                </table>
                </div>


        </div>
    </div>
</div>