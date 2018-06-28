const base = 'http://localhost:6789/api';
function setValueForm(data){
  $('[name="code"]').val(data.code);
  $('[name="width"]').val(data.width);
  $('[name="height"]').val(data.height);
  $('[name="length"]').val(data.length);
  $('[name="cube"]').val(data.cube);
}

function post(data) {
  return  $.post(`${base}/itemmasters`, data);
}
function senData(e){
  e.preventDefault();
  var data = $('#rxnForm').serializeArray(), obj = {};
  $.each(data, (i, item) => {
    obj[item.name] = item.value
  })
  post(obj).then(res => console.log(res));
}
$(document).ready(() => {
  $("#expiration").datepicker();
  $('#ItemMasterID_PK').autocomplete({
    source: `${base}/search`,
    minLength: 2,
    select: function (event, ui) {
      $.get(`${base}/itemmasters/${ui.item.value}`).then(res => {
        $.each( res, function( key, value ) {
          $(`[name=${key}]`).val(value);
        });
      })
    }
  });
  $('[name="code_cost"]').mask('ZZZZ-ZZ-ZZ', {
    placeholder: '____-__-__',
    translation: {
      'Z': {
        pattern: /[0-9]/, optional: true
      }
    }
  })
})