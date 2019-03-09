<%-- 
    Document   : pagMiem
    Created on : ene 6, 2019, 11:35:41 a.m.
    Author     : Andrés Alfaro
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccione una página</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/select.png" sizes="64x64">
        <jsp:include page="templates/header.jsp"/>
    </head>
    <body>
        <div class="container" style="margin-top: 1%">
            <div class="container text-left">
                <a href="index.jsp" class="btn btn-outline-secondary">
                    <i class="fas fa-home"></i>
                    Página principal
                </a>
            </div>            
        </div>
        <center><h2>Seleccione la página a mostrar</h2></center>
        <div class="container" style="margin: 0 auto;">
            <div class="row justify-content-center" style="margin-top: 2%; margin-bottom: 0.5%;">
                <div class="card" style="width: 17rem; height: 33rem;">
                    <img class="card-img-top" id="img" src="recursos/img/infoGenV.png" alt="Card image cap" >
                    <div class="card-body">
                        <h5 class="card-title">Información General</h5>
                        <p class="card-text">Muestra información de los miembros actuales que posee el ministerio (Ancianos).</p>
                        <a href="miembros.jsp" class="btn btn-primary">
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
                <div class="card" style="width: 17rem; height: 33rem;">
                    <img class="card-img-top" id="img" src="recursos/img/equipoV.png" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">Información Adicional</h5>
                        <p class="card-text">Muestra información de las personas que conforman actualmente el ministerio.</p>
                        <a href="infoMiem.jsp" class="btn btn-primary">
                            Ir a información adicional
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
                </div>
            </div>
        </div><br>
        <jsp:include page="templates/footer.jsp"/>
    </body>
</html>
