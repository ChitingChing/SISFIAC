<%
    if(session.getAttribute("rol") != null){
        if(session.getAttribute("rol").equals("Administrador") || session.getAttribute("rol").equals("Secretario(a)") || session.getAttribute("rol").equals("Profesor(a)")){
%>
            
    <%}else
            response.sendRedirect("/SISFIAC/index.jsp");
    }else
            response.sendRedirect("/SISFIAC/index.jsp");
    %>