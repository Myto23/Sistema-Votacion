function validarCheckbox() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
  if (checkboxes.length < 2) {
    alert("Debe seleccionar al menos dos opciones.");
    return false;
  }
  return true;
}

$(document).ready(function() {
  $('#rut').on('input', function() {
    // Permitir números y 'K'/'k' 
    $(this).val($(this).val().replace(/[^0-9kK]/g, ''));
  });

  $('#votacionForm').on('submit', function(event) {
    event.preventDefault(); 
    submitVote();
  });

  // Llenar el combobox de regiones al cargar la página
  $.ajax({
    url: '../PHP/get_regiones.php',
    success: function(data) {
      $('#region').html(data);
      cargarComunas();
    }
  });

  // Llenar el combobox de candidatos al cargar la página
  cargarCandidatos();

  // Cargar comunas según la región seleccionada
  $('#region').change(cargarComunas);
});

function submitVote() {
  var fullName = $('#full_name').val();
  var alias = $('#alias').val();
  var rut = $('#rut').val();
  var email = $('#email').val();
  var region = $('#region').val();
  var candidate = $('#candidate').val();
  var comuna = $('#comuna').val();
  var heardAboutUs = $('input[name="heardAboutUs"]:checked').map(function() {
    return $(this).val();
  }).get().join(', ');

  if (fullName === "" || rut === "" || email === "" || region === "" || !candidate || !comuna) {
    alert("Por favor, rellene todos los campos requeridos.");
    return;
  }

  if (!validarCheckbox()) {
    return;
  }

  $.ajax({
    type: 'POST',
    url: '../PHP/votacion.php', 
    dataType: 'json',
    data: {
      full_name: fullName,
      alias: alias,
      rut: rut,
      email: email,
      region: region,
      candidate: candidate,
      comuna: comuna,
      heard_about_us: heardAboutUs
    },
    success: function(response) {
      alert(response.message);
      if (response.success) {
        limpiarCampos();
      }
    },
    error: function() {
      alert("Hubo un error al procesar la votación. Intente nuevamente.");
    }
  });
}

function limpiarCampos() {
  $('#full_name').val('');
  $('#alias').val('');
  $('#rut').val('');
  $('#email').val('');
  $('#region').val('');
  $('#candidate').val('');
  $('#comuna').val('');
  $('input[name="heardAboutUs"]').prop('checked', false);
}

// Carga comunas dependiendo de la región seleccionada en base a su ID
function cargarComunas() {
  var regionId = $('#region').val();
  $.ajax({
    url: '../PHP/get_comunas.php', 
    method: 'POST',
    data: { region_id: regionId },
    success: function(data) {
      $('#comuna').html(data);
    }
  });
}

function cargarCandidatos() {
  $.ajax({
    url: '../PHP/get_candidatos.php', 
    success: function(data) {
      $('#candidate').html(data);
    }
  });
}
