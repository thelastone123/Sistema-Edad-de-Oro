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
        int iD = m.getId();

    %>
    <jsp:include page="templates/header.jsp"/>
    <body>
        <div class="container-fluid" style="margin-top: 1.5%; width: 96%;">
            <a href="index.jsp" class="btn btn-danger" style="float: left;">
                <i class="fas fa-home"></i>
            </a>&nbsp;
            <a href="pagMiem.jsp" class="btn btn-secondary" style="float: contour;">
                <i class="fas fa-chevron-left"> </i>
                 Página anterior
            </a>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAddInfo" 
                    style="float: right;">
                <i class="fas fa-address-card"> </i>
                 Añadir información de un miembro
            </button> 
        </div>
    <center>
        <h1>Información Adicional</h1>
    </center>
    <hr style="width: 93%; height: 0.5%; margin-top: 2%; margin-bottom: 2%;">
    <!-- MODAL AÑADIR INFORMACION ADICIONAL -->
    <div class="modal fade" id="modalAddInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 45%;" role="document">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h4 class="modal-title" id="exampleModalLabel">
                        <i class="fas fa-id-card-alt"> </i>
                        Información Adicional
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="procesarDetMiem" name="frmDet" method="POST">
                        <div class="form-row" style="padding-top: 1rem; margin-bottom: 1%;">
                            <div class="form-group col-md-5">
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
                            <div class="form-group col-md-3">
                                <label>Fecha de Ingreso:</label>
                                <input type="date" class="form-control" name="txtFechaIn"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" name="txtFechaNac"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Medicamentos:</label>
                                <input type="text" class="form-control" name="txtMedicamentos"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Discapacidad:</label>
                                <input type="text" class="form-control" name="txtDiscapacidad"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Enfermedad:</label>
                                <input type="text" class="form-control" name="txtEnfermedad"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Encargado en emergencia:</label>
                                <input type="text" class="form-control" name="txtContacto"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Parentesco:</label>
                                <input type="text" class="form-control" name="txtParentesco"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Número de Teléfono:</label>
                                <input type="text" class="form-control" 
                                       placeholder="0000-0000" data-mask="0000-0000" name="txtTelEmerg"/>
                            </div>
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="detail" name="detail" value="1" readonly required/>
                            </div>    
                        </div>
                        <div class="container-fluid">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">
                                <i class="fas fa-times"></i>
                                Cancelar
                            </button>
                            <button type="submit" name="btnInsertar" value="Insertar" id="btnInsertar" class="btn btn-info" style="float: right; margin-right: 10px;">
                                <i class="fas fa-save"></i>
                                Guardar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL AÑADIR INFORMACION ADICIONAL -->
    
    <!-- MODAL EDITAR INFORMACION ADICIONAL -->
    <div class="modal fade" id="modalEditInfo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 45%;" role="document">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h4 class="modal-title" id="exampleModalLabel">
                        <i class="fas fa-id-card-alt"> </i>
                        Editar Información Adicional
                    </h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="procesarDetMiem" name="frmDet" method="POST">
                        <div class="form-row" style="padding-top: 1rem; margin-bottom: 1%;">
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="txtIdEditInfo" name="miem" value="0" readonly required/>
                            </div>
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="txtDetEdit" name="detail" readonly required/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Miembro:</label>
                                <input type="text" class="form-control" id="txtNombreCompl" readonly/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Fecha de Ingreso:</label>
                                <input type="date" class="form-control" name="txtFechaIn" id="txtFechaInEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Fecha de Nacimiento:</label>
                                <input type="date" class="form-control" name="txtFechaNac" id="txtFechaNacEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Medicamentos:</label>
                                <input type="text" class="form-control" name="txtMedicamentos" id="txtMedEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Discapacidad:</label>
                                <input type="text" class="form-control" name="txtDiscapacidad" id="txtDiscEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Enfermedad:</label>
                                <input type="text" class="form-control" name="txtEnfermedad" id="txtEnfEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Encargado en emergencia:</label>
                                <input type="text" class="form-control" name="txtContacto" id="txtContEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Parentesco:</label>
                                <input type="text" class="form-control" name="txtParentesco" id="txtParenEdit"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Número de Teléfono:</label>
                                <input type="text" class="form-control" name="txtTelEmerg" id="txtTelEmEdit"/>
                            </div>    
                        </div>
                        <div class="container-fluid">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right">
                                <i class="fas fa-times"></i>
                                Cancelar
                            </button>
                            <button type="submit" name="btnEliminar" id="delete" value="Eliminar" 
                                    class="btn btn-danger" style="float: right; margin-right: 10px;">
                                <i class="fas fa-trash"></i>
                                Eliminar
                            </button>
                                    <button type="submit" name="btnModificar" id="edit" class="btn btn-info" 
                                            style="float: right; margin-right: 10px;">
                                <i class="fas fa-save"></i>
                                Guardar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- FIN MODAL EDITAR INFORMACION ADICIONAL -->
    
    <!-- TABLA -->
    <div class="container-flex" style="margin-bottom: 1%; margin-left: auto; margin-right: auto; width: 95%;">
        <table id="datatable" class="table table-hover text-center" style="width: 100%; float: inside" cellspacing="0">
            <thead class="thead-light">
                <tr>
                    <th scope="col" hidden="true" >Id</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">F. Ingreso</th>
                    <th scope="col">F. Nacimiento</th>
                    <th scope="col">Medicamentos</th>
                    <th scope="col">Discapacidad</th>
                    <th scope="col">Enfermedad</th>
                    <th scope="col">Encargado</th>
                    <th scope="col">Parentesco</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead> 
            <tbody class="table-light">
                <%
                    List<DetMiem> listaMi = daoD.filtrarDet();
                    for (DetMiem dm : listaMi) {
                        int cod = dm.getIdMiembro();
                %>
                <tr>
                    <td hidden="true"><%= dm.getIdMiembro()%></td>
                    <td><%= daoM.getMiembro(cod).getNombres() %></td>
                    <td><%= daoM.getMiembro(cod).getApellidos()%></td>
                    <td><%= dm.getFechaIngreso()%></td>
                    <td><%= dm.getFechaNacimiento()%></td>
                    <td><%= dm.getMedicamentos()%></td>
                    <td><%= dm.getDiscapacidad()%></td>
                    <td><%= dm.getEnfermedad()%></td>
                    <td><%= dm.getNombreEmergencia()%></td>
                    <td><%= dm.getParentesco()%></td>
                    <td><%= dm.getTelefonoEmergencia()%></td>
                    <td>
                        <div class="container">
                                <a class="btn btn-warning" onclick="loadData(<%= dm.getIdMiembro()%>,<%= dm.getHasDetail()%>,
                                                '<%= daoM.getMiembro(cod).getNombres()%>','<%= daoM.getMiembro(cod).getApellidos()%>','<%= dm.getFechaIngreso()%>',
                                                '<%= dm.getFechaNacimiento()%>','<%= dm.getMedicamentos()%>', '<%= dm.getDiscapacidad()%>','<%= dm.getEnfermedad()%>',
                                                '<%= dm.getNombreEmergencia()%>','<%= dm.getParentesco()%>','<%= dm.getTelefonoEmergencia()%>')" 
                                   data-toggle="modal" data-target="#modalEditInfo">
                                    <i class="fas fa-pen"></i>
                                </a>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <!-- FIN DE TABLA -->
    <hr style="width: 93%; height: 0.5%; margin-top: 2%; margin-bottom: 2%;">
    <jsp:include page="templates/footer.jsp"/>
    <script src="recursos/js/infoMiembros.js" type="text/javascript"></script>
</body>
</html>
