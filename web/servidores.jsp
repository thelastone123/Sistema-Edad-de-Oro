<%-- 
    Document   : servidores
    Created on : 11-21-2018, 09:45:01 PM
    Author     : Andrés Alfaro
--%>

<%@page import="com.modelo.Servidores"%>
<%@page import="java.util.List"%>
<%@page import="com.modelo.DaoServ"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servidores</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/member.ico" sizes="64x64">
        <jsp:include page="templates/header.jsp"/>
        <script Languaje="JavaScript">
            function cargar(id, nom, ape, tel, ed, dui, dir, est)
            {
                document.frmMiem.txtId.value = id;
                document.frmMiem.txtNombres.value = nom;
                document.frmMiem.txtApellidos.value = ape;
                document.frmMiem.txtTelefono.value = tel;
                document.frmMiem.edad.value = ed;
                document.frmMiem.txtDui.value = dui;
                document.frmMiem.txtDireccion.value = dir;
                document.frmMiem.estado.value = est;
            }
        </script>
        <%
            if (request.getAttribute("msj") != null) {
        %>
        <script type="text/javascript">
        swal('Realizado!', '<%= request.getAttribute("msj")%>', 'success');
        </script>
        <%
            }
        %>
    </head>
    <%
      DaoServ dao = new DaoServ(); 
      String estd = "";
    %>
    <body>
        <!-- TABLA -->
        <div class="container" style="margin-bottom: 1%; margin-left: auto; margin-right: auto; width: max-content;">
            <table id="costo" class="table table-hover text-center table-rounded-top" style="display: inline-block; width: 150%;">
                <thead style="background-color: #00cc33">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Nombres</th>
                        <th scope="col">Apellidos</th>
                        <th scope="col">Teléfono</th>
                        <th scope="col">Edad</th>
                        <th scope="col">Dui</th>
                        <th scope="col">Dirección</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Acciones</th>
                    </tr>
                </thead> 
                <tbody>
                    <%
                        List<Servidores> listaM = dao.();
                        for (Miembros m : listaM) {
                    %>
                    <tr>
                        <td><%= m.getId()%></td>
                        <td><%= m.getNombres()%></td>
                        <td><%= m.getApellidos()%></td>
                        <td><%= m.getTelefono()%></td>
                        <td><%= m.getEdad()%> años</td>
                        <td><%= m.getDui()%></td>
                        <td><%= m.getDireccion()%></td>
                        <%
                            if (m.getEstado() == 1) {
                                estd = "Activo";
                            } else if (m.getEstado() == 2) {
                                estd = "Poco frecuente";
                            } else if (m.getEstado() == 3) {
                                estd = "Inactivo";
                            }
                        %>
                        <td><%= estd%></td>
                        <td><a class="btn btn-outline-warning"
                               href="javascript:cargar(<%= m.getId()%>,'<%= m.getNombres()%>',
                               '<%= m.getApellidos()%>','<%= m.getTelefono()%>',
                               <%= m.getEdad()%>,'<%= m.getDui()%>','<%= m.getDireccion()%>',
                               <%= m.getEstado()%>)" data-toggle="modal" data-target="#modalEdit">
                                <i class="fas fa-pen"></i>
                            </a>&nbsp;
                            <a class="btn btn-outline-primary" href="detMiembro.jsp?id=<%= m.getId()%>">
                                <i class="fas fa-book"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <hr style="width: 75%;">
        <jsp:include page="templates/footer.jsp"/>
    </body>
</html>
