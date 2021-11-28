test_movement = function() {
  test_coords_normalize();
  test_collision();
  test_smooth_collision();
}

test_camera = function() {
  test_camera_view();
  /*
  test_camera_following();
  test_camera_limits(); */
}

test_depth_system = function() {
  
}

run_tests = function() {
  test_movement();
  test_camera();
  test_depth_system();
}();
