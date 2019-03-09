<%-- 
    Document   : derEquipo
    Created on : 11-21-2018, 09:45:09 PM
    Author     : Andrés Alfaro
--%>

<%@page import="com.modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/detail.png" sizes="64x64">
        <link href="recursos/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="templates/header.jsp"/>
    </head>
    <%
        DaoDetEq dao = new DaoDetEq(); 
        DaoEquipo daoE = new DaoEquipo();
        DetEquipo d = new DetEquipo();
        Equipo e = new Equipo();
    %>
    <body>
        <div class="container">
            <div class="container text-left">
                <br>
                <button type="button" class="btn btn-outline-secondary" role="link" onclick="window.location='miembros.jsp'">
                    <i class="fas fa-chevron-left"></i>
                    Volver a Equipo
                </button>
            </div>
            <div class="container text-center">
                <h1>Información de Miembro del Equipo</h1>
            </div>            
        </div><br>
        <%
            Integer id = 0;
            id = Integer.parseInt(request.getParameter("id"));

            if (id != 0) {
                //e = daoE.getMiembro(id);
                //d = dao.getDetMiem(id);
            }
        %>
        <div class="container" style="margin-bottom: 1%;">
            <center>
                <table class="table text-left table-stripped" style="width: 80%;">
                    <tbody>
                        <tr>
                            <th scope="row">Nombres:</th>
                            <td><%= e.getNombres()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Apellidos:</th>
                            <td><%= e.getApellidos()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Teléfono:</th>
                            <td><%= e.getTelefono()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Edad:</th>
                            <td><%= e.getEdad()%> años</td>
                        </tr>
                        <tr>
                            <th scope="row">Dui:</th>
                            <td><%= e.getDui()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Dirección</th>
                            <td><%= e.getDireccion()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Fecha de Ingreso:</th>
                            <td><%= d.getFechaIngreso()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Fecha de Nacimiento</th>
                            <td><%= d.getFechaNacimiento()%></td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </div>
        <jsp:include page="templates/footer.jsp"/>
    </body>
</html>
