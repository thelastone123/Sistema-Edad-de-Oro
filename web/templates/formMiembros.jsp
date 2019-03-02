<%-- 
    Document   : formMiembros
    Created on : feb 25, 2019, 8:02:49 p.m.
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
        <form action="procesarMiembro" class="needs-validation" novalidate method="POST">                    
            <div class="form-row" style="padding-top: 1rem;">
                <div class="form-group col-s-4" style="display: none;">
                    <input type="text" class="form-control" name="txtId" value="0" readonly required/>
                </div>
                <div class="form-group col-s-4" style="display: none;">
                    <input type="text" class="form-control" name="txtDet" value="2" readonly required/>
                </div>
                <div class="form-group col-md-3">
                    <label>Nombres:</label>
                    <input type="text" class="form-control" name="txtNombres" required/>
                    <div class="invalid-tooltip">
                        Por favor, ingrese los nombres.
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label>Apellidos:</label>
                    <input type="text" class="form-control" name="txtApellidos" required/>
                    <div class="invalid-tooltip">
                        Por favor, ingrese los apellidos.
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label>Edad:</label>
                    <input type="number" class="form-control" name="edad" required/>
                    <div class="invalid-tooltip">
                        Por favor, ingrese la edad.
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label>Teléfono:</label>
                    <input type="text" class="form-control phone-mask" 
                           placeholder="0000-0000" data-mask="0000-0000" name="txtTelefono" required/>
                    <div class="invalid-tooltip">
                        Por favor, ingrese el teléfono.
                    </div>
                </div>                    
                <div class="form-group col-md-4">
                    <label>DUI:</label>
                    <input type="text" class="form-control mixed-mask" 
                           placeholder="00000000-0" data-mask="00000000-0"
                           name="txtDui" required/>
                    <div class="invalid-tooltip">
                        Por favor, ingrese el dui.
                    </div>
                </div>                                
                <div class="form-group col-md-4">
                    <label>Dirección:</label>
                    <textarea class="form-control" name="txtDireccion"
                              style="height: 38px;" rows="3" required></textarea>
                    <div class="invalid-tooltip">
                        Por favor, ingrese la dirección.
                    </div>
                </div> 
                <div class="form-group col-md-4">
                    <label>Estado:</label>                                    
                    <select name="estado" class="form-control" required>
                        <option value="">-- Seleccione un estado --</option>
                        <option value="1">Activo</option>
                        <option value="2">Poco frecuente</option>
                        <option value="3">Inactivo</option>
                    </select>
                    <div class="invalid-tooltip">
                        Por favor, seleccione un estado.
                    </div>
                </div>
            </div>
            <br>
            <div class="container-fluid">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">
                    <i class="fas fa-times"></i>
                    Cancelar
                </button>
                <button type="submit" name="btnInsertar" class="btn btn-info" style="float: right; margin-right: 10px;">
                    <i class="fas fa-save"></i>
                    Registrar
                </button>
            </div>
        </form>
    </body>
</html>
