<%--
  Created by IntelliJ IDEA.
  User: Martin Rodriguez
  Date: 29/5/2025
  Time: 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="org.martin.manejosesiones.models.Categoria" %>
<%
  Categoria categoria = (Categoria) request.getAttribute("categorias");
  if (categoria == null) {
    categoria = new Categoria(); // categoría vacía para creación
  }
%>
<%-- Declaramos el tipo de contenido de la página y codificación --%>
<html>
<head>
  <%-- El título de la página cambia según si estamos editando o creando una categoría --%>
  <title><%= (categoria.getIdCategoria() != null && categoria.getIdCategoria() > 0) ? "Editar Categoría" : "Nueva Categoría" %></title>
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f8fa;
        margin: 0;
        padding: 30px;
      }

      h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
      }

      form {
        max-width: 500px;
        margin: 0 auto;
        background-color: white;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      }

      label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
        color: #34495e;
      }

      input[type="text"],
      textarea {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 20px;
        border: 1px solid #ccd1d9;
        border-radius: 6px;
        font-size: 14px;
        box-sizing: border-box;
        background-color: #fdfefe;
      }

      textarea {
        resize: vertical;
        min-height: 100px;
      }

      input[type="submit"] {
        background-color: #28a745;
        color: white;
        font-weight: bold;
        border: none;
        padding: 10px 18px;
        border-radius: 6px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
      }

      input[type="submit"]:hover {
        background-color: #218838;
      }

      a {
        display: inline-block;
        margin-left: 15px;
        padding: 10px 15px;
        background-color: #dc3545;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        font-size: 14px;
        transition: background-color 0.3s ease;
      }

      a:hover {
        background-color: #c82333;
      }
    </style>

</head>
<body>

<%-- Muestra el encabezado dinámicamente según si estamos creando o editando una categoría --%>
<h1><%= (categoria.getIdCategoria() != null && categoria.getIdCategoria() > 0) ? "Editar Categoría" : "Nueva Categoría" %></h1>

<%-- Formulario que envía los datos al controlador CategoriaFormControlador (POST) --%>
<form action="<%= request.getContextPath() %>/categoria/form" method="post">

  <%-- Campo para el nombre de la categoría, prellenado si ya existe --%>
  <label for="nombre">Nombre:</label>
    <input type="hidden" name="id" value="<%=categoria.getIdCategoria()%>">
  <input type="text" id="nombre" name="nombre" value="<%= categoria.getNombre() != null ? categoria.getNombre() : "" %>" required />
  <br/><br/>

  <%-- Campo para la descripción de la categoría, también prellenado si existe --%>
  <label for="descripcion">Descripción:</label>
  <textarea id="descripcion" name="descripcion" required><%= categoria.getDescripcion() != null ? categoria.getDescripcion() : "" %></textarea>
  <br/><br/>

  <%-- Botón para guardar y un enlace para cancelar (regresa al listado) --%>
    <input type="submit" value="<%=(categoria.getIdCategoria()!=null && categoria.getIdCategoria()>0)? "EDITAR" : "CREAR"%>">
  <a href="<%= request.getContextPath() %>/categoria">Cancelar</a>


</form>
</body>
</html>