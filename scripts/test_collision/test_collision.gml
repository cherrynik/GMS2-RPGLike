function test_collision() {
  var Player   = instance_create_layer(16, 0,  "Instances", oPlayer),
      Collider = instance_create_layer(16, 16, "Instances", oCollision);

  {
	assert(Player.CheckIfFreeAndMoveOn(1, 3));
	assert_equal(Player.x, 17);
	assert_equal(Player.y, 3);
  }
  // Player: {x: 17, y: 3}
  
  {
	assert_fail(Player.CheckIfFreeAndMoveOn(-1, 13));
	assert(Player.CheckIfFreeAndMoveOn(0, 5)); // Player: {x: 17, y: 8}
	assert_fail(Player.CheckIfFreeAndMoveOn(0, 1));
	assert_fail(Player.CheckIfFreeAndMoveOn(0, 10)); //   8 - Collider's collision mask
													 // + 2 - Player's   collision mask
	assert(Player.CheckIfFreeAndMoveOn(0, 11));
  }

  instance_destroy(Player);
  instance_destroy(Collider);
}