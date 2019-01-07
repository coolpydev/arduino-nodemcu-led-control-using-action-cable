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
      let selection;
      if ( Array.from(e.target.classList).includes('on')) {
        rgb = {r: 255, g: 255, b: 255};
        selection = "on";
      } else if (Array.from(e.target.classList).includes('off')) {
        rgb = {r: 0, g: 0, b: 0}
        selecton = "off";
      } else if (Array.from(e.target.classList).includes('color')) {
        rgb = {r: 100, g: 50, b: 100}
        selection = "color";
      }
      $.ajaxSetup({
        headers: { 'X-CSRF-Token': $('#authenticity-token').attr('content') }
      })
      $.ajax({
        method: "PUT",
        url: `/groups/${e.target.parentElement.id}`,
        data: {group: {rgb: rgb}},
        dataType: "JSON",
        success: function(data) {
          console.log(data)
          Array.from(e.target.parentElement.children).forEach(function(el){el.style.backgroundColor = "lightgray"})
          e.target.style.backgroundColor = data["color"];
        }
      })

    }
  })

});

