/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function loadData(id,det,nom,ape,tel,ed,dui,direc,tipo,est)
{
    $('#txtIdEdit').val(id);
    $('#txtDetEdit').val(det);    
    $('#txtNombresEdit').val(nom);
    $('#txtApellidosEdit').val(ape);
    $('#txtTelefonoEdit').val(tel);
    $('#edadEdit').val(ed);
    $('#txtDuiEdit').val(dui);
    $('#txtDireccionEdit').val(direc); 
    $('#tipoEdit').val(tipo);
    $('#estadoEdit').val(est);    
};

function loadId(id)
{
    $('#txtIdEditInfo').val(id);
};



