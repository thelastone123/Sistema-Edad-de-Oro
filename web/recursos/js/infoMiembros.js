/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function loadData(id,det,nom,ape,fIn,fNac,med,dis,enf,cont,paren,tel)
{
    $('#txtIdEditInfo').val(id);
    $('#txtDetEdit').val(det);    
    $('#txtNombreCompl').val(nom+" "+ape);
    $('#txtFechaInEdit').val(fIn);
    $('#txtFechaNacEdit').val(fNac);
    $('#txtMedEdit').val(med);
    $('#txtDiscEdit').val(dis);
    $('#txtEnfEdit').val(enf);
    $('#txtContEdit').val(cont);
    $('#txtParenEdit').val(paren); 
    $('#txtTelEmEdit').val(tel);    
};

function loadId(id)
{
    $('#txtIdEditInfo').val(id);
};



