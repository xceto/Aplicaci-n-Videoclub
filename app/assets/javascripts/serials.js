$(function() {
  $(document).ready(function() {
    $('#new_serial').validate({ // initialize the plugin
        rules: {
            'serial[titulo]': {
                required: true,
                pattern: '[a-zA-ZñÑáéíóúÁÉÍÓÚ 0-9]+'
            },
            'serial[genero]': {
                required: true,
                pattern: '[a-zA-Z 0-9]+'
            },
            'serial[precio_arriendo]': {
                required: true,
                number: true,
                pattern: '[0-9]+'
            },
            'serial[temporada]': {
                required: true,
                number: true,
                pattern: '[0-9]+'
            }                           
        }, 
        messages:{
         'serial[titulo]':{required:'<div style="color:red">Debe ingresar el Titulo<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         'serial[genero]':{required:'<div style="color:red">Debe ingresar el Genero<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         'serial[precio_arriendo]':{required:'<div style="color:red">Debe ingresar el Precio<div>', number:'<div style="color:red">Solo puede ingresar numeros<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         'serial[temporada]':{required:'<div style="color:red">Debe ingresar la cantidad de temporadas<div>', number:'<div style="color:red">Solo puede ingresar numeros<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'}         
       },
    });
  });
});