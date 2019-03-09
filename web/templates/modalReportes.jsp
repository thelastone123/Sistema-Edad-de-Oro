<%-- 
    Document   : modalReportes
    Created on : mar 4, 2019, 7:05:52 p.m.
    Author     : Andrés Alfaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row responsive">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Cumpleañeros.</h5>
                            <p class="card-text">Reporte de los cumpleañeros del último mes.</p>
                            <a href="reportes/reporteCumpleanioMes.jsp" target="_blank" class="btn btn-info">Generar</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6" style="float: right;">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Miembros ingresados.</h5>
                            <p class="card-text">Reporte de los miembros ingresados el último mes.</p>
                            <a href="reportes/reporteMiembrosMes.jsp" target="_blank" class="btn btn-info">Generar</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row responsive">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Miembros con cuidados especiales.</h5>
                            <p class="card-text">Reporte de los miembros con enfermedades, discapacidades o medicamentos.</p>
                            <a href="reportes/reporteMiembrosCuidadosEsp.jsp" target="_blank" class="btn btn-info">Generar</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Próximamente.</h5>
                            <p class="card-text">Área en desarrollo.</p>
                            <a href="#" class="btn btn-info">Próximamente</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
