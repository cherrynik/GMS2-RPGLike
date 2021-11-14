function test_coords_normalize() {
  var Player = instance_create_layer(0, 0, "Instances", oPlayer);

  {
	var input_normalized = Player.GetCoordsNormalized({x: 1, y: 1});
	assert_is_real(input_normalized.x);
	assert_in_range(input_normalized.x, 0.65, 0.75);

	assert_is_real(input_normalized.y);
	assert_in_range(input_normalized.y, 0.65, 0.75);
	
	assert_equal(input_normalized.direction, 315);
  }
  
  {
	var input_normalized = Player.GetCoordsNormalized({x: 0, y: 1});
	assert_equal(input_normalized.x, 0);

	assert_equal(input_normalized.y, 1);

	assert_equal(input_normalized.direction, 270);
  }
  
  {
	var input_normalized = Player.GetCoordsNormalized({x: 0, y: 0});
	assert_equal(input_normalized.x, 0);
	assert_equal(input_normalized.y, 0);
	assert_equal(input_normalized.direction, 0);
  }

  instance_destroy(Player);
}