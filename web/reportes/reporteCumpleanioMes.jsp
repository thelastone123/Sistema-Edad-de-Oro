<%-- 
    Document   : reporteMantenimientos
    Created on : 8/11/2018, 07:25:04 AM
    Author     : Juan Pablo Elias Hernández
--%>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.io.File" %>
<%@page import="com.conexion.Conexion" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte mantenimientos</title>
    </head>
    <body>
        <h1 align="center">Reporte de Cumpleañeros del Último Mes</h1>
        <%
            Conexion c = new Conexion();
            c.conectar();
            File report = new File(application.getRealPath("reportes/reporteCumpleaniosMes.jasper"));
            Map param = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(
                    report.getPath(), param, c.getCon());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream output = response.getOutputStream();
            response.getOutputStream();
            output.write(bytes, 0, bytes.length);
            output.flush();
            output.close();
        %>
    </body>
</html>
