/* 
 * Confirm Alert for forms
 */

function confirmar()
{
    Swal.fire({
            title: '¿Desea continuar con la operación?',
            text: "Si selecciona 'Confirmar', la operación será realizada.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#138496',
            cancelButtonColor: '#5A6268',
            confirmButtonText: 'Confirmar',
            cancelButtonText: 'Cancelar',
            timer: 5000
        }).then((result) => {
            if (result.value) {
                swalWithBootstrapButtons.fire(
                        'Realizado!',
                        'Operación realizada exitosamente.',
                        'success'
                        )
            } else if (
                    // Read more about handling dismissals
                    result.dismiss === Swal.DismissReason.cancel
                    ) {
                swalWithBootstrapButtons.fire(
                        'Cancelado',
                        'La operación ha sido cancelada.',
                        'error'
                        )
            }
        })
}


