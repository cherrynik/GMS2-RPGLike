test_movement = function() {
  test_coords_normalize();
  test_collision();
  test_smooth_collision();
}

run_tests = function() {
  test_movement();
}();