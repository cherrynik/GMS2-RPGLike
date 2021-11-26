function get_input_axis() {
  var left  = keyboard_check(global.Keymap.Movement.Left),
  	  right = keyboard_check(global.Keymap.Movement.Right),
  	  up    = keyboard_check(global.Keymap.Movement.Up),
  	  down  = keyboard_check(global.Keymap.Movement.Down);
  
  return {
    x: right - left,
    y: down - up,
  };
}