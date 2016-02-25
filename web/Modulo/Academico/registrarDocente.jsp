<%@page import="AccesoDatos.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="../../Admin/controlUsuarios.jsp" %>
<div class="panel-body">
      <form class="form-horizontal tasi-form" method="get">
          <div class="form-group">
              <label class="col-sm-3 control-label">Código:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtCodigo" id="Codigo" class="form-control" type="text" disabled="true">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Nick:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtNick" id="txtNick" class="form-control" type="text" required autofocus title="Ingrese su nick/usuario!" pattern="^([a-z]+[0-9]{0,2}){5,10}$">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Clave:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtClave" id="txtClave" class="form-control" type="text" required title="Ingrese una clave!" pattern="^([a-z]+[0-9]{0,2}){6,15}$">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Apellidos:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtApellidos" id="txtApellidos" class="form-control" type="text" maxlength="30">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3  control-label">Nombres:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtNombres" id="txtNombres" class="form-control" type="text" maxlength="30">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Cédula:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtCedula" id="txtCedula" class="form-control" type="text" disabled="true">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Dirección:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtDireccion" id="txtCedula" class="form-control" type="text" maxlength="70">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Fecha Nacimiento:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtFnacimiento" id="txtFnacimiento" class="form-control" type="text">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Teléfono:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtTelefono" id="txtTelefono" class="form-control" onkeypress="return isNumberKey(event)" type="text" maxlength="10">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Celular:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtCelular" id="txtCelular" onkeypress="return isNumberKey(event)" class="form-control" type="text" maxlength="10">
                </div>
          </div>
          
          <div class="form-group">
              <label class="col-sm-3 control-label">Estado Civil:</label>
                <div class="col-xs-5 selectContainer input-group">
                    <span class="input-group-addon"></span>
                    <select class="form-control" name="cboEstCivil" id="cboEstCivil">
                        <option value="-1">(Escoja uno)</option>
                        <option value="1" selected="selected">Soltero</option>
                        <option value="2">Casado</option>
                        <option value="3">Viudo</option>
                        <option value="4">Divorciado</option>
                        <option value="5">Unión Libre</option>
                    </select>
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Sexo:</label>
                <div class="col-xs-5 selectContainer input-group">
                    <span class="input-group-addon"></span>
                    <select class="form-control" name="cboSexo" id="cboSexo">
                        <option value="-1">(Escoja uno)</option>
                        <option value="M" selected="selected">Masculino</option>
                        <option value="F">Femenino</option>
                        <option value="O">Otro</option>
                    </select>
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">email:</label>
                <div class="col-xs-5 input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input name="txtEmail" id="txtEmail" class="form-control" type="text">
                </div>
          </div>
          <div class="form-group">
              <label class="col-sm-3 control-label">Rol:</label>
                <div class="col-xs-5 selectContainer input-group">
                    <span class="input-group-addon"></span>
                    <select class="form-control" name="cboRol" id="cboRol">
                        <option value="-1">(Escoja uno)</option>
                        <%
                                    ResultSet rs = null;
                                    Conexion conex = new Conexion();
                                    
                                    try{
                                    rs = conex.EjecutarProcedimieto("obtenertiposusuarios");
                                    boolean band = true;
                                    while(rs.next()){
                                    band= false;    
                                %>1
                                <option value=<%=rs.getObject(1)%>><%=rs.getString(2).toString().toUpperCase()%></option>
                                <%} conex.Cerrar();
                                    if(band){
                                %>
                                    <option value="-1">(No hay Usuarios)</option>
                                <%}%>
                                <%} catch (Exception ex) {}%>
                    </select>
                </div>
          </div>
          
          
          
          <div class="form-group">
              <div class="col-sm-6"></div>
              <div class="col-sm-6">
                <button type="submit" class="btn btn-info">Guardar Datos</button>
              </div>
          </div>
      </form>
    </div>