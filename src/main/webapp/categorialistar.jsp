<%--
  Created by IntelliJ IDEA.
  User: Martin Rodriguez
  Date: 28/5/2025
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="java.util.*, org.anderson.manejosesiones.models.*" %>
<%@ page import="org.martin.manejosesiones.models.Categoria" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<html>
<head>
    <title>Listado Categoria</title>
</head>
<body>
<%
    if(username.isPresent()){%>
<div style="color:blue;">Hola<%= username.get()%>,  bienvenido a la apliación</div>
<div><p><a href="${pageContext.request.contextPath}/categoria/form">Ingrese el producto</a></p></div>
<%
    }
%>

<h1> Listado Categoria</h1>
<table>
    <thead>
    <th>Id Categoria</th>
    <th>Nombre</th>
    <th>Descripcion</th>
    <th>Condicion</th>
    </thead>
    <%
        for (Categoria cat : categorias) {%>
    <tbody>
    <td><%= cat.getIdCategoria()%></td>
    <td><%= cat.getNombre()%></td>
    <td><%= cat.getDescripcion()%></td>
    <td><%= cat.getCondicion()%></td>
    <td><a href="">Activar o Desactivar</a></td>
    </tbody>
    <% } %>

</table>
</body>
</html>
