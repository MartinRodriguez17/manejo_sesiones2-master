<%--
  Created by IntelliJ IDEA.
  User: Martin Rodriguez
  Date: 28/5/2025
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*, org.martin.manejosesiones.models.*" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<html>
<head>
    <title>Listado Categoria</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-top: 30px;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 30px auto;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px 16px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .activo {
            color: green;
            font-weight: bold;
        }

        .inactivo {
            color: red;
            font-weight: bold;
        }

        a {
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-weight: bold;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        a[href*="form"] {
            background-color: #28a745;
            color: white;
        }

        a[href*="form"]:hover {
            background-color: #218838;
        }

        a[href=""] {
            background-color: #ffc107;
            color: #212529;
        }

        a[href=""]:hover {
            background-color: #e0a800;
        }

        div[style*="color:blue"] {
            text-align: center;
            font-size: 18px;
            margin-top: 20px;
        }

        div p {
            text-align: center;
        }

        div p a {
            background-color: #17a2b8;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
        }

        div p a:hover {
            background-color: #138496;
        }
    </style>
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
        for (Categoria cate : categorias) {%>
    <tbody>
    <td><%= cate.getIdCategoria()%></td>
    <td><%= cate.getNombre()%></td>
    <td><%= cate.getDescripcion()%></td>
    <td><%= cate.isCondicion()%></td>
    <td>
    <a href="<%=request.getContextPath()%>/categoria/form?id=<%=cate.getIdCategoria()%>">Editar</a>
    </td>
    <td><a href="">Activar o Desactivar</a></td>
    </tbody>
    <% } %>

</table>
</body>
</html>
