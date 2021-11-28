// TODO: Gamepad and gestures support
function get_input_axis() {
  var move_key = global.Keymap.Movement,

      left  = is_keymap_active(move_key.Left),
      right = is_keymap_active(move_key.Right),
      up    = is_keymap_active(move_key.Up),
      down  = is_keymap_active(move_key.Down);
  
  return {
    x: right - left,
    y: down - up,
  };
}