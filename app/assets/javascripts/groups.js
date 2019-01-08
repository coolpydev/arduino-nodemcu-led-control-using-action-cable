$(document).on('turbolinks:load', function(){
  let hexField = document.getElementById('group_hex');
  let rgbField = document.getElementById('rgb');

  if (hexField) { 
    hexField.oninput = function(event) {
      let hex = hexField.value;
      let rgb = hexToRgb(hex);
      group_rgb_r.value = rgb.r;
      group_rgb_g.value = rgb.g;
      group_rgb_b.value = rgb.b;
    }
  }

  function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
      r: parseInt(result[1], 16),
      g: parseInt(result[2], 16),
      b: parseInt(result[3], 16)
    } : null;
  }
  
  // Group Control
  let buttons = document.getElementsByClassName('color-option');
  Array.from(buttons).forEach(function(button){
    button.onclick = function(e) {
      if ( Array.from(e.target.classList).includes('on')) {
        rgb = {r: 255, g: 255, b: 255};
      } else if (Array.from(e.target.classList).includes('off')) {
        rgb = {r: 0, g: 0, b: 0}
      } 
      sendRgbToServer(rgb, e.target);
    };
  });

  let colorPickers = document.getElementsByClassName("color");
  Array.from(colorPickers).forEach(function(colorPicker){
    colorPicker.onchange = function(e) {
      [r,g,b] = e.target.jscolor.rgb
      rgb = {r: r, g: g, b: b}
      sendRgbToServer(rgb, e.target)
    }
  });

  function sendRgbToServer(rgb, element) {
    $.ajaxSetup({
      headers: { 'X-CSRF-Token': $('#authenticity-token').attr('content') }
    })
    $.ajax({
      method: "PUT",
      url: `/groups/${element.parentElement.id}`,
      data: {group: {rgb: rgb}},
      dataType: "JSON",
      success: function(data) {
        Array.from(element.parentElement.children).forEach(function(el){
          el.style.backgroundColor = "lightgray";
          el.style.color = "black";
        });
        element.style.backgroundColor = data["color"];
      }
    })
  }

});

