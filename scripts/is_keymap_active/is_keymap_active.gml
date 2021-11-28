function is_keymap_active(_keymap) {
  var result = undefined;
  for (var i = 0; i < array_length(_keymap); ++i) {
    result = result || keyboard_check(_keymap[@ i] ? _keymap[@ i] : noone);
	if (result) return result;
  }
  return result;
}