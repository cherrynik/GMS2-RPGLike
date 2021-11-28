function test_camera_view() {
  var Player = instance_create_depth(0, 0, 0, oPlayer),
      Camera = instance_create_depth(0, 0, 0, oCamera);

  {
  }
  
  instance_destroy(Player);
  instance_destroy(Camera);
}