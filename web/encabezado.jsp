<%-- 
    Document   : encabezado
    Created on : 03/02/2016, 10:24:47
    Author     : Usuario 09
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!-- navigation  -->

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/SISFIAC/index.jsp">PostGrado UTEQ</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#">Contáctos</a>
                </li>

                <li>
                    <a href="#">Acerca de Nosotros</a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Servicios en línea <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="/SISFIAC/Modulo/Academico/solicitudInscripcion.jsp">Solicitud de Inscripción</a>
                        </li>
                        <li>
                            <a href="">Consulta de Notas</a>
                        </li>
                        <li>
                            <a href="">Consulta de Pagos</a>
                        </li>
                        <li>
                            <a href="/SISFIAC/Modulo/Biblioteca/Principal.jsp">Biblioteca de Tesis</a>
                        </li>
                    </ul>
            
            </li>

            <li class="dropdown">
                <%
                    if (session.getAttribute("rol") != null) {
                        if (session.getAttribute("rol").equals("Administrador") || session.getAttribute("rol").equals("Secretario(a)")) {
                %>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span> <%=session.getAttribute("usuario")%></span> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="Admin/PanelAdministracion.jsp"><i class="fa fa-cog fa-fw pull-left"></i> Administración</a>
                    </li>
                    <li>
                        <a href="cerrarSesion.dbo"><i class="fa fa-ban fa-fw pull-left"></i> Salir</a>
                    </li>
                </ul>
                <%} else if (session.getAttribute("rol").equals("Profesor(a)")) {%>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><span> <%=session.getAttribute("usuario")%></span> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="Admin/PanelUsuarioDocente.jsp"><i class="fa fa-cog fa-fw pull-left"></i> Administración</a>
                    </li>
                    <li>
                        <a href="cerrarSesion.dbo"><i class="fa fa-ban fa-fw pull-left"></i> Salir</a>
                    </li>
                </ul>
                <%}
                            } else {%>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Acceder <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="/SISFIAC/login.jsp">Iniciar Sesión</a>
                    </li>
                </ul>
                <%}%>

            </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
