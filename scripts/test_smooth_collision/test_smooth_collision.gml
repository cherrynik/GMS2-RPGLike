function test_smooth_collision() {
  var Player   = instance_create_layer(0, 0, "Instances", oPlayer),
      Collider = instance_create_layer(8, 4, "Instances", oCollider);
  
  Collider.image_angle = 0;
  {
	var tolerance = .01;
	while (Player.CheckIfFreeAndMoveOn(tolerance, 0)) {}

	assert_equal([Player.x, Player.y], [2, 0]);

	assert_is(Player.CollideSmoothlyAt({x: 1, y: 0, direction: 0}), false);
	assert_equal([Player.x, Player.y], [2, 0]);

	assert_is(Player.CollideSmoothlyAt({x: 1, y: 1, direction: 315}), true);
	assert_not_equal(Player.x, 2);
	assert_not_equal(Player.y, 0);
	assert_in_range(Player.x, 1.5, 2);
  }
  
  Collider.image_angle = 45;
  {
    var tolerance = .01,
	    previous_pos = [Player.x, Player.y];
	while (Player.CheckIfFreeAndMoveOn(tolerance, 0)) {}

	// Going down 'n' right till right pos ain't free
	repeat(25) {
	  assert_is(Player.CollideSmoothlyAt({x: 1, y: 0, direction: 0}), true);
	}
	assert_greater_than(Player.x, previous_pos[0]);
	assert_greater_than(Player.y, previous_pos[1]);

	while (Player.CheckIfFreeAndMoveOn(0, -tolerance)) {}
	previous_pos = [Player.x, Player.y];
    assert_is(Player.CollideSmoothlyAt({x: 0, y: -1, direction: 90}), false);
	assert_equal(previous_pos, [Player.x, Player.y]);
  }
}