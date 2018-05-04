$(function() {
  $(document).ready(function() {
    $('#new_arriendo').validate({ // initialize the plugin
        rules: {
            tipo_arriendo: {
                required: true
            },
            opciones: {
                required: true
            }                         
        }, 
        messages:{
         tipo_arriendo:{required:'<div style="color:red">Debe seleccionar un tipo de arriendo<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         opciones:{required:'<div style="color:red">Debe seleccionar una Pelicula/Serie <div>', email:'<div style="color:red">Ingrese un correo valido<div>'}
       },
    });
  });
});