$(function() {
  $("#tipo_arriendo").change(function() {
    if ($('#tipo_arriendo').val() == 1) {
      var ruta= '../../../peliculas/lista';
      $('option', '#opciones').remove();
      $('#opciones').append("<option value=''> Selecciona </option>");     
    }else if ($('#tipo_arriendo').val() == 2) {
      var ruta= '../../../serials/lista';
      $('option', '#opciones').remove();
      $('#opciones').append("<option value=''> Selecciona </option>");     
    }else{
      console.log("entra");
      $('option', '#opciones').remove();
      $('#opciones').append("<option value=''> Selecciona </option>");
    }
    $.get(ruta, function(data) {
      data.forEach(function(element) {
       $('#opciones').append($("<option></option>")
                     .attr("value",element.id)
                     .text(element.titulo+" ($"+element.precio_arriendo+")")); 
        });
    });
  });

  $(document).ready(function() {
    $('#new_user').validate({ // initialize the plugin
        rules: {
            'user[nombre]': {
                required: true,
                pattern: '[a-zA-ZñÑáéíóúÁÉÍÓÚ 0-9]+'
            },
            'user[email]': {
                required: true,
                email: true
            }                         
        }, 
        messages:{
         'user[nombre]':{required:'<div style="color:red">Debe ingresar un nombre<div>', pattern:'<div style="color:red">No puede ingresar caracteres<div>'},
         'user[email]':{required:'<div style="color:red">Debe ingresar un correo <div>', email:'<div style="color:red">Ingrese un correo valido<div>'}
       },
    });
  });
});