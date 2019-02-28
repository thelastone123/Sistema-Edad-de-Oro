<%-- 
    Document   : index
    Created on : 11-21-2018, 09:44:14 PM
    Author     : Andrés Alfaro
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/home.ico" sizes="64x64">
        <jsp:include page="templates/header.jsp"/>
    </head>
    <body>
        <div class="container" style="margin-top: 1%;">
            <center><h1>Edad de Oro - Página Principal</h1></center>
            <hr style="size: 80%;">
            <div class="row responsive" style="margin-top: 4%; size: auto;">
                <div class="card" style="width: 16rem;">
                    <img class="card-img-top" id="img" src="recursos/img/miembrosV.png" alt="Card image cap" >
                    <div class="card-body">
                        <h5 class="card-title">Miembros</h5>
                        <p class="card-text">Información general e información adicional de los miembros (Ancianos).</p>
                        <a href="pagMiem.jsp" class="btn btn-primary">
                            Ir a miembros 
                            <i class="fas fa-chevron-right"></i>
                        </a>
                        <div class="card-footer small text-muted">
                            Última actualización: 
                            <%
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                String formatDateTime = LocalDateTime.now().format(formatter);
                                out.print(formatDateTime);
                            %>
                        </div>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="card" style="width: 16rem;">
                    <img class="card-img-top" id="img" src="recursos/img/equipoV.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Equipo</h5>
                        <p class="card-text">Muestra información de las personas que conforman actualmente el ministerio.</p>
                        <a href="pagEq.jsp" class="btn btn-primary">
                            Ir a equipo 
                            <i class="fas fa-chevron-right"></i>
                        </a>
                        <div class="card-footer small text-muted">
                            Última actualización: 
                            <%
                                DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                String fdt = LocalDateTime.now().format(fmt);
                                out.print(fdt);
                            %>
                        </div>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="card" style="width: 16rem;">
                    <img class="card-img-top" id="img" src="recursos/img/gastosV.png" alt="Card image cap" >
                    <div class="card-body">
                        <h5 class="card-title">Gastos</h5>
                        <p class="card-text">Muestra un registro de los diferentes gastos realizados (Eventos, Presentes, etc.).</p>
                        <a href="gastos.jsp" class="btn btn-primary">
                            Ir a gastos
                            <i class="fas fa-chevron-right"></i>
                        </a>
                        <div class="card-footer small text-muted">
                            Última actualización: 
                            <%
                                DateTimeFormatter fm = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                String fD = LocalDateTime.now().format(fm);
                                out.print(fD);
                            %>
                        </div>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="card" style="width: 16rem;">
                    <img class="card-img-top" id="img" src="recursos/img/eventosV.png" alt="Card image cap" >
                    <div class="card-body">
                        <h5 class="card-title">Eventos</h5>
                        <p class="card-text">Muestra los eventos celebrados o a celebrarse (Cumpleaños, Convivios, etc.).</p>
                        <a href="eventos.jsp" class="btn btn-primary">
                            Ir a eventos
                            <i class="fas fa-chevron-right"></i>
                        </a>
                        <div class="card-footer small text-muted">
                            Última actualización: 
                            <%
                                DateTimeFormatter fM = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
                                String fd = LocalDateTime.now().format(fM);
                                out.print(fd);
                            %>
                        </div>
                    </div>
                </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>  
        </div><br>
    <jsp:include page="templates/footer.jsp"/>
</body>
</html>
