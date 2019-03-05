<%-- 
    Document   : pruebas
    Created on : ene 14, 2019, 8:49:48 p.m.
    Author     : Andrés Alfaro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pruebas</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link href="recursos/css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    <center>
        <h1>Página de Pruebas</h1>
        <div class="btn-group btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-secondary active">
                <input type="radio" name="options" id="option1" autocomplete="off" checked> Active
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="options" id="option2" autocomplete="off"> Radio
            </label>
            <label class="btn btn-secondary">
                <input type="radio" name="options" id="option3" autocomplete="off"> Radio
            </label>
        </div>
    </center>
    <div class="btn-group">
        <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Large button
        </button>
        <div class="dropdown-menu">
            ...
        </div>
    </div>
    <div class="container">
        <button type="button" class="btn btn-info" onclick="alerta();">
            Probar alerta!
        </button>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="recursos/js/sweetalert2.all.min.js" type="text/javascript"></script>
    <script src="recursos/js/AllSweetalert2.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
    </body>
</html>
