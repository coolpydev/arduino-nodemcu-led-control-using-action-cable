let hexField = document.getElementById('hex');
let rgbField = document.getElementById('rgb');
hexField.oninput = function(event) {
  let hex = hexField.value;
  let rgb = hexToRgb(hex);
  _rgb_r.value = rgb.r;
  _rgb_g.value = rgb.g;
  _rgb_b.value = rgb.b;
}

function hexToRgb(hex) {
  var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
  return result ? {
    r: parseInt(result[1], 16),
    g: parseInt(result[2], 16),
    b: parseInt(result[3], 16)
  } : null;
}