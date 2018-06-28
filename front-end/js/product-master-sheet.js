function setValueForm(data){
  console.log(data);
  $('[name="code"]').val(data.code);
  $('[name="width"]').val(data.width);
  $('[name="height"]').val(data.height);
  $('[name="length"]').val(data.length);
  $('[name="cube"]').val(data.cube);
}

$(document).ready(() => {
  $("#expiration").datepicker();
  $('#icode').autocomplete({
    source: 'http://localhost:6789/api/product',
    minLength: 2,
    select: function (event, ui) {
      var data = {
        code: 1000,
        width: 12.00,
        height: 10.01,
        length: 3.00,
        cube: 360.01
      }
      setValueForm(data);
      console.log("Selected: " + ui.item.value + " aka " + ui.item.id);
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