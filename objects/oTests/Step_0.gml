if (debug_mode && keyboard_check_pressed(vk_enter)) {
  room_goto_next();
} else if (not debug_mode) {
  room_goto_next();
}