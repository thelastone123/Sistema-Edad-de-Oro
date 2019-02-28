function loadData(id,det,nom,ape,tel,ed,dui,direc,est)
{
    $('#txtIdEdit').val(id);
    $('#txtDetEdit').val(det);    
    $('#txtNombresEdit').val(nom);
    $('#txtApellidosEdit').val(ape);
    $('#txtTelefonoEdit').val(tel);
    $('#edadEdit').val(ed);
    $('#txtDuiEdit').val(dui);
    $('#txtDireccionEdit').val(direc); 
    $('#estadoEdit').val(est);    
};

function loadId(id,nom,ape)
{
    $('#txtIdEditInfo').val(id);
    $('#txtNombreCompl').val(nom+" "+ape);
};

function loadDel(id)
{
    $('#txtIdEdit').val(id);
};




