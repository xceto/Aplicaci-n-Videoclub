$(function() {
  $(document).ready(function() {
    $('#new_pelicula').validate({ // initialize the plugin
        rules: {
            'pelicula[titulo]': {
                required: true,
                pattern: '[a-zA-ZñÑáéíóúÁÉÍÓÚ 0-9]+'
            },
            'pelicula[genero]': {
                required: true
            },
            'pelicula[precio_arriendo]': {
                required: true,
                number: true
            },
            'pelicula[duracion]': {
                required: true,
                number: true
            }                           
        },        
        messages:{
         'pelicula[titulo]':{required:'<div style="color:red">Debe ingresar el Titulo<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         'pelicula[genero]':{required:'<div style="color:red">Debe ingresar el Genero<div>'},
         'pelicula[precio_arriendo]':{required:'<div style="color:red">Debe ingresar el Precio<div>', number:'<div style="color:red">Solo puede ingresar numeros<div>'},
         'pelicula[duracion]':{required:'<div style="color:red">Debe ingresar la duración<div>', number:'<div style="color:red">Solo puede ingresar numeros<div>'}         
       },
    });
  });
});