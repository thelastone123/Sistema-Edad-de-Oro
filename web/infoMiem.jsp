<%-- 
    Document   : infoMiem
    Created on : ene 6, 2019, 11:32:52 a.m.
    Author     : Andrés Alfaro
--%>

<%@page import="java.util.List"%>
<%@page import="com.modelo.DetMiem"%>
<%@page import="com.modelo.Miembros"%>
<%@page import="com.modelo.DaoDetMiem"%>
<%@page import="com.modelo.DaoMiembros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/detail.png" sizes="64x64">
        <jsp:include page="templates/header.jsp"/>
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
        DaoMiembros daoM = new DaoMiembros();
        DaoDetMiem daoD = new DaoDetMiem();
        Miembros m = new Miembros();
        DetMiem d = new DetMiem();

    %>
    <jsp:include page="templates/header.jsp"/>
    <body>
        <div class="container" style="margin-top: 1%;">
            <a href="index.jsp" class="btn btn-outline-secondary" style="float: left;">
                <i class="fas fa-home"></i>
            </a>&nbsp;
            <a href="pagMiem.jsp" class="btn btn-outline-secondary">
                <i class="fas fa-chevron-left"></i>
                Página anterior
            </a>
        </div>
    <center>
        <h1>Información Adicional</h1>
    </center><br>
    <div class="container" style="margin-bottom: 2%;">
        <form action="procesarDetMiem" name="frmDet" method="POST">
            <div class="form-row" style="padding-top: 1rem; margin-bottom: 1%;">
                <div class="form-group col-md-6">
                    <label>Miembro:</label>
                    <select name="miem" class="form-control" id="sel1">
                        <%                        
                            List<Miembros> listaM = daoM.filtrar();
                            for (Miembros mi : listaM) {
                        %>
                        <option value="<%= mi.getId()%>" name="miembro">
                            <%= mi.getNombres()%> <%= mi.getApellidos()%>
                        </option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label>Fecha de Ingreso:</label>
                    <input type="date" class="form-control" name="txtFechaIn"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Fecha de Nacimiento:</label>
                    <input type="date" class="form-control" name="txtFechaNac"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Medicamentos:</label>
                    <input type="text" class="form-control" name="txtMedicamentos"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Discapacidad:</label>
                    <input type="text" class="form-control" name="txtDiscapacidad"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Enfermedad:</label>
                    <input type="text" class="form-control" name="txtEnfermedad"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Encargado en caso de emergencia:</label>
                    <input type="text" class="form-control" name="txtContacto"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Parentesco:</label>
                    <input type="text" class="form-control" name="txtParentesco"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Número de Teléfono:</label>
                    <input type="text" class="form-control" name="txtTelEmerg"/>
                </div>
                <div class="form-group col-s-4" style="display: none;">
                    <input type="text" class="form-control" id="detail" name="detail" value="1" readonly required/>
                </div>    
            </div>
            <center>
                <button type="submit" name="btnInsertar" value="Insertar" class="btn btn-outline-success">
                    <i class="fas fa-plus"></i>
                    Registrar
                </button>
            </center>
        </form>
    </div>
    <jsp:include page="templates/footer.jsp"/>
</body>
</html>
