<%-- 
    Document   : servidores
    Created on : 11-21-2018, 09:45:01 PM
    Author     : Andrés Alfaro
--%>

<%@page import="com.modelo.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equipo</title>
        <link rel="icon" type="image/png" href="recursos/img/icon/member.ico" sizes="64x64">
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
        DaoEquipo dao = new DaoEquipo();
        String estd = "";
    %>
    <body>
        <div class="container-fluid" style="margin-top: 1.5%; width: 86%;">
            <a href="index.jsp" class="btn btn-danger" style="float: left;">
                <i class="fas fa-home"></i>
            </a>&nbsp;
            <a href="pagEq.jsp" class="btn btn-secondary" style="float: contour;">
                <i class="fas fa-chevron-left"></i>
                Página anterior
            </a>
            <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#modalReport" style="float: right;"
                    data-toggle="tooltip" data-placement="right" title="Reportes">
                <i class="fas fa-book-open"></i>
            </button>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAdd" 
                    style="float: right; margin-right: 1%;">
                <i class="fas fa-address-card"></i>
                Registrar nuevo integrante
            </button> 
        </div>
    <center>
        <h1>Integrantes Actuales</h1>  
    </center>
    <hr style="width: 86%; margin-top: 2%; margin-bottom: 2%;">
    <!-- MODAL REGISTRO INTEGRANTES-->
    <div class="container">
        <div class="modal fade" id="modalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 45%;" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h4 class="modal-title" id="exampleModalLabel">
                            <i class="fas fa-id-badge"> </i>
                            Nuevo Integrante
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- FORMULARIO -->
                    <div class="modal-body">
                        <form action="procesarEquipo" class="needs-validation" novalidate method="POST">                    
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
                                <div class="form-group col-md-3">
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
                                <div class="form-group col-md-5">
                                    <label>Tipo:</label>                                    
                                    <select name="tipo" class="form-control" required>
                                        <option value="">-- Seleccione un tipo --</option>
                                        <option value="Colaborador">Colaborador</option>
                                        <option value="Miembro">Miembro</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                    <div class="invalid-tooltip">
                                        Por favor, seleccione un estado.
                                    </div>
                                </div>
                                <div class="form-group col-md-5">
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
                    </div>
                    <!-- FIN DEL FORMULARIO -->
                </div>
            </div>
        </div>        
    </div>
    <!-- FIN DEL MODAL REGISTRO MIEMBROS -->

    <!-- MODAL EDICION MIEMBROS -->
    <div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 45%;" role="document">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h5 class="modal-title" id="exampleModalLabel">
                        <i class="fas fa-chalkboard-teacher"> </i>
                        Editar Información
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <!-- FORMULARIO -->
                <div class="modal-body bg-transparent">
                    <form action="procesarEquipo" name="frmMiemb" method="POST">                    
                        <div class="form-row" style="padding-top: 1rem;">
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="txtIdEdit" name="txtId" value="0" readonly required/>
                            </div>
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="txtDetEdit" name="txtDet" readonly required/>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Nombres:</label>
                                <input type="text" class="form-control" name="txtNombres" id="txtNombresEdit"/>
                                <div class="invalid-feedback">
                                    Por favor, ingrese los nombres.
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Apellidos:</label>
                                <input type="text" class="form-control" name="txtApellidos" id="txtApellidosEdit"/>
                                <div class="invalid-feedback">
                                    Por favor, ingrese los apellidos.
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Edad:</label>
                                <input type="number" class="form-control" name="edad" id="edadEdit"/>
                                <div class="invalid-feedback">
                                    Por favor, ingrese la edad.
                                </div>
                            </div>
                            <div class="form-group col-md-3">
                                <label>Teléfono:</label>
                                <input type="text" placeholder="0000-0000" data-mask="0000-0000"
                                       class="form-control" name="txtTelefono" id="txtTelefonoEdit"/>
                                <div class="invalid-feedback">
                                    Por favor, ingrese el teléfono.
                                </div>
                            </div>                    
                            <div class="form-group col-md-3">
                                <label>DUI:</label>
                                <input type="text" data-mask="00000000-0" placeholder="00000000-0" 
                                       class="form-control" id="txtDuiEdit" name="txtDui" id="txtDuiEdit" required/>
                                <div class="invalid-feedback">
                                    Por favor, ingrese el dui.
                                </div>
                            </div>                                
                            <div class="form-group col-md-4">
                                <label>Dirección:</label>
                                <textarea class="form-control" name="txtDireccion" id="txtDireccionEdit"
                                          style="height: 38px;" rows="3"></textarea>
                                <div class="invalid-feedback">
                                    Por favor, ingrese la dirección.
                                </div>
                            </div>
                            <div class="form-group col-md-5">
                                    <label>Tipo:</label>                                    
                                    <select name="tipo" class="form-control" id="tipoEdit" required>
                                        <option value="">-- Seleccione un tipo --</option>
                                        <option value="Colaborador">Colaborador</option>
                                        <option value="Miembro">Miembro</option>
                                        <option value="Otro">Otro</option>
                                    </select>
                                    <div class="invalid-tooltip">
                                        Por favor, seleccione un estado.
                                    </div>
                                </div>
                            <div class="form-group col-md-4">
                                <label>Estado:</label>
                                <select name="estado" class="form-control" id="estadoEdit">
                                    <option value="1">Activo</option>
                                    <option value="2">Poco frecuente</option>
                                    <option value="3">Inactivo</option>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor, seleccione un estado.
                                </div>                                                   
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
                <!-- FIN DEL FORMULARIO -->
            </div>
        </div>
    </div>
    <!-- FIN MODAL EDICION MIEMBROS -->

    <!-- MODAL INFORMACION ADICIONAL -->
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
                            <div class="form-group col-s-4" style="display: none;">
                                <input type="text" class="form-control" id="txtIdEditInfo" name="miem" value="0" readonly required/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>Miembro:</label>
                                <input type="text" class="form-control" id="txtNombreCompl" readonly/>
                            </div>
                            <div class="form-group col-md-4">
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
                                <input type="text" class="form-control" name="txtTelEmerg"/>
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
    <!-- FIN MODAL INFORMACION ADICIONAL -->

    <!-- MODAL REPORTES MIEMBROS-->
    <div class="container">
        <div class="modal fade" id="modalReport" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl" style="width: 45%;" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-light">
                        <h4 class="modal-title" id="exampleModalLabel">
                            <i class="fas fa-bookmark"> </i>
                            Reportes
                        </h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- FORMULARIO -->
                    <div class="modal-body">
                        <jsp:include page="templates/modalReportes.jsp"/>    
                    </div>
                    <!-- FIN DEL FORMULARIO -->
                </div>
            </div>
        </div>        
    </div>
    <!-- FIN DEL MODAL REPORTES MIEMBROS -->
    <!-- TABLA -->
    <div class="container-flex" style="margin-bottom: 1%; margin-left: auto; margin-right: auto; width: 86%;">
        <table id="datatable" class="table table-hover text-center" style="width: 100%;" cellspacing="0">
            <thead class="thead-light">
                <tr>
                    <th scope="col" hidden="true" >Id</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Edad</th>
                    <th scope="col">Dui</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Tipo</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead> 
            <tbody class="table-light">
                <%
                    List<Equipo> listaE = dao.mostrar();
                    for (Equipo e : listaE) {
                %>
                <tr>
                    <td hidden="true"><%= e.getId()%></td>
                    <td><%= e.getNombres()%></td>
                    <td><%= e.getApellidos()%></td>
                    <td><%= e.getTelefono()%></td>
                    <td><%= e.getEdad()%> años</td>
                    <td><%= e.getDui()%></td>
                    <td><%= e.getDireccion()%></td>
                    <%
                        if (e.getEstado() == 1) {
                            estd = "Activo";
                        } else if (e.getEstado() == 2) {
                            estd = "Poco frecuente";
                        } else if (e.getEstado() == 3) {
                            estd = "Inactivo";
                        }
                    %>
                    <td><%= e.getTipo()%></td>
                    <td><%= estd%></td>
                    <td>
                        <div class="btn-group btn-sm">
                            <button type="button" class="btn btn-outline-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Seleccionar
                            </button>
                            <div class="dropdown-menu text-center">
                                <a class="dropdown-item" onclick="loadData(<%= e.getId()%>,<%= e.getHasDetail()%>,
                                                '<%= e.getNombres()%>', '<%= e.getApellidos()%>', '<%= e.getTelefono()%>',<%= e.getEdad()%>,
                                                '<%= e.getDui()%>', '<%= e.getDireccion()%>','<%= e.getTipo()%>',<%= e.getEstado()%>)" 
                                   data-toggle="modal" data-target="#modalEdit">
                                    Editar 
                                </a>
                                <%
                                    int id = e.getId();
                                    String cad = e.getNombres() + e.getApellidos();
                                    if (e.getHasDetail() == 2) {
                                %>
                                <a class="dropdown-item" onclick="loadId(<%= e.getId()%>, '<%= e.getNombres()%>', '<%= e.getApellidos()%>')" 
                                   data-toggle="modal" data-target="#modalAddInfo">
                                    Añadir información
                                </a>
                                <%
                                } else if (e.getHasDetail() == 1) {
                                %>
                                <a class="dropdown-item" href="detMiembro.jsp?id=<%= e.getId()%>">
                                    Ver detalles
                                </a>
                                <%
                                    }
                                %>
                            </div>
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
    <hr style="width: 75%;">
    <jsp:include page="templates/footer.jsp"/>
    <script src="recursos/js/equipo.js" type="text/javascript"></script>
</body>
</html>
