$(document).on('turbolinks:load', function(){
  const hexField = document.getElementById('light_hex');
  const rgbField = document.getElementById('rgb');

  if (hexField) {
    hexField.oninput = function(event) {
      let hex = hexField.value;
      let rgb = hexToRgb(hex);
      light_rgb_r.value = rgb.r;
      light_rgb_g.value = rgb.g;
      light_rgb_b.value = rgb.b;
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
});