<%-- 
    Document   : detMiembro
    Created on : 11-21-2018, 09:44:48 PM
    Author     : Andrés Alfaro
--%>

<%@page import="java.util.List"%>
<%@page import="com.modelo.*"%>
<%@page import="com.modelo.DaoDetMiem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Información</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/detail.png" sizes="64x64">
        <link href="recursos/open-iconic/font/css/open-iconic-bootstrap.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="templates/header.jsp"/>
        <script Languaje="JavaScript">
            function cargar(id, fI, fN, med, disc, enf, nomEm, paren, telEmerg)
            {
                document.frmDetMiem.miem.value = id;
                document.frmDetMiem.txtFechaIng.value = fI;
                document.frmDetMiem.txtFechaNac.value = fN;
                document.frmDetMiem.txtMedicamentos.value = med;
                document.frmDetMiem.txtDiscapacidad.value = disc;
                document.frmDetMiem.txtEnfermedad.value = enf;
                document.frmDetMiem.txtContacto.value = nomEm;
                document.frmDetMiem.txtParentesco.value = paren;
                document.frmDetMiem.txtTelEmerg.value = telEmerg;
            }
        </script>
        <%
            if (request.getAttribute("msj") != null) {
        %>
        <script type="text/javascript">
            alert('<%= request.getAttribute("msj")%>');
        </script>
        <%
            }
        %>
    </head>
    <%
        DaoDetMiem dao = new DaoDetMiem();
        DaoMiembros daoM = new DaoMiembros();
        DetMiem d = new DetMiem();
        Miembros m = new Miembros();
    %>
    <body>
        <div class="container">
            <div class="container text-left">
                <br>
                <button type="button" class="btn btn-outline-secondary" role="link" onclick="window.location='miembros.jsp'">
                    <i class="fas fa-chevron-left"></i>
                    Volver a miembros
                </button>
            </div>
            <div class="container text-center">
                <h1>Información de Miembro</h1>
            </div>            
        </div><br>
        <%
            Integer id = 0;
            id = Integer.parseInt(request.getParameter("id"));
            
            if(id != 0)
            {
                m = daoM.getMiembro(id);
                d = dao.getDetMiem(id);
            }
        %>
        <div class="container" style="margin-bottom: 1%;">
            <center>
                <table class="table text-left table-stripped" style="width: 80%;">
                    <tbody>
                        <tr>
                            <th scope="row">Nombres:</th>
                            <td><%= m.getNombres()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Apellidos:</th>
                            <td><%= m.getApellidos()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Teléfono:</th>
                            <td><%= m.getTelefono()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Edad:</th>
                            <td><%= m.getEdad()%> años</td>
                        </tr>
                        <tr>
                            <th scope="row">Dui:</th>
                            <td><%= m.getDui()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Dirección</th>
                            <td><%= m.getDireccion()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Fecha de Ingreso:</th>
                            <td><%= d.getFechaIngreso()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Fecha de Nacimiento</th>
                            <td><%= d.getFechaNacimiento()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Medicamentos:</th>
                            <td><%= d.getMedicamentos()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Discapacidad:</th>
                            <td><%= d.getDiscapacidad()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Enfermedad:</th>
                            <td><%= d.getEnfermedad()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Contacto en caso de Emergencia:</th>
                            <td><%= d.getNombreEmergencia()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Parentesco:</th>
                            <td><%= d.getParentesco()%></td>
                        </tr>
                        <tr>
                            <th scope="row">Número de Teléfono:</th>
                            <td><%= d.getTelefonoEmergencia()%></td>
                        </tr>
                    </tbody>
                </table>
            </center>
        </div>
        <jsp:include page="templates/footer.jsp"/>
    </body>
</html>
