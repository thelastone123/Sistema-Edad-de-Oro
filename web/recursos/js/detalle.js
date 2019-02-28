(function()
{
    $(document).ready(function ()
    {
        var state = parseInt($('#frm').attr('data-state'));
        if (state === 1)
        {
            $('#pId').prop('disabled', true);
            $('#cant').prop('disabled', true);
            $('#btnAdd').prop('disabled', true);
            $('#btnEdit').prop('disabled', true);
            $('#btnDelete').prop('disabled', true);
            $('#btnReset').prop('disabled', true);
        }
    })
    
    validateForm();
    
    reset();
    
    $('.changeControls').change(function ()
    {
        if ($('#pId').val() !== 0 && $('#pId').val() !== '' 
                && $('#cant').val() !== 0 && $('#cant').val() !== '')
        {
            var indice = $('#pId').val();
            console.log(datos[indice]);
            let data = datos[indice],
            pre = data.pre, 
            sub = pre * $('#cant').val();
            $('#pre').val(pre.toFixed(2));
            $('#sub').val(sub.toFixed(2));
            $('#pro').val(data.id);
        }
        else
        {
            let zero = 0;
            $('#pre').val(zero.toFixed(2));
            $('#sub').val(zero.toFixed(2));
        }
    });
    
    $('.select').click(function ()
    {
        let id, pId, cant, pre, sub;
        id = $(this).attr('data-idDf');
        pId = $(this).attr('data-pro');
        cant = $(this).attr('data-cant');
        pre = $(this).attr('data-pre');
        sub = $(this).attr('data-subTot');
        load(id, pId, cant, pre, sub);
        //window.scrollTo(0, 0);
        $('html, body').animate({scrollTop:0}, 'slow');
    });
    
    $('.btnAction').click(function (e)
    {
        var form = $('#frm')[0];
        sendData(form, $(this), e);
    });
    
    $('.btnCancel').click(function ()
    {
        reset();
    });
    
    $('.btnCode').click(function ()
    {
        let randomNumber = Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
        $('#num').val(randomNumber);
    });
    
    // Inicializando tabla
    $("#dataTable").DataTable({
        "language":
        {
            "sProcessing": "Procesando...",
            "lengthMenu": "Mostrar _MENU_ registros por pagina",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando pagina _PAGE_ de _PAGES_",
            "infoEmpty": "No hay registros disponibles",
            "infoFiltered": "(Filtrando de un total de _MAX_ registros)",
            "oPaginate":
            {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "sSearch": "Buscar:",
            "oAria":
            {
                "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
})(jQuery);

// Funcion para cargar datos
function load(idDf, idP, cant, pre, sub)
{
    var id = 12345;
    for(var i = 0; i < datos.length; i++)
    {
        if (parseInt(idP) === datos[i].id)
        {
            id = i;
        }
    }
    $('#dfId').val(idDf);
    $('#pId').val(id);
    $('#cant').val(cant);
    $('#pre').val(pre);
    $('#sub').val(sub);
    $('#pro').val(datos[id].id);
}

function calculate()
{
    let subTot = $('#cant').val() * $('#pre').val();
    $('#sub').val(subTot);
    console.log(subTot);
}

function reset()
{
    $('#pId').val("");
    $('#cant').val("0");
    $('#pre').val("0.0");
    $('#sub').val("0.0");
}

// Funcion para enviar datos
function sendData(form, btn, e)
{
    if (form.checkValidity() === false)
    {
        e.preventDefault();
        e.stopPropagation();
    }
    else
    {
        swal({
            title: 'Seguro que desea ' + btn.val() + ' el registro?',
            text: "Si selecciona 'Aceptar', la transaccion será realizada.",
            type: 'question',
            showCancelButton: true,
            confirmButtonColor: '#138496',
            cancelButtonColor: '#5A6268',
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.value)
            {
                $('#action').val($(btn).val());
                $('#frm').submit();
            }
        });
    }
    form.classList.add('was-validated');
}

function validateForm()
{
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = $('.needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form)
    {
        form.addEventListener('submit', function(event)
        {
          if (form.checkValidity() === false)
          {
            event.preventDefault();
            event.stopPropagation();
          }
          form.classList.add('was-validated');
        }, false);
    });
}

/*
function add ()
{
    var indice = $('#pId').val();
    var data = datos[indice];
    var idP = data.id;
    $.post('controllerDetalleFactura',
    {
        dfId: 0,
        fId: $('#num').attr('data-id'),
        num: $('#num').val(),
        pId: idP,
        cant: $('#cant').val().toFixed(2),
        sub: $('#sub').val().toFixed(2)
    }, function (data)
    {
        swal('Agregado!', 'Producto agregado exitosamente', 'success');
        var res = JSON.parse(data);
        $.each(res, function (i, item)
        {
            console.log(item.id);
        });
    });
}
*/