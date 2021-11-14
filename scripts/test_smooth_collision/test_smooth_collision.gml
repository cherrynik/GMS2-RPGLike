function test_smooth_collision() {
  var Player   = instance_create_layer(0, 0, "Instances", oPlayer),
      Collider = instance_create_layer(8, 4, "Instances", oCollision);
  
  Collider.image_angle = 0;

  {
	assert_equal([Player.x, Player.y], [0, 0]);
	while (Player.CheckIfFreeAndMoveOn(.01, 0)) {}
	assert_equal([Player.x, Player.y], [2, 0]);
	Player.CollideSmoothlyAt({x: 1, y: 0, direction: 0});
	assert_equal([Player.x, Player.y], [2, 0]);

	/* show_message([Player.x, Player.y]);
	var input = Player.GetCoordsNormalized({x: 
	Player.CollideSmoothlyAt({x: Player.x + .1, y: Player.y, direction: });
	show_message([Player.x, Player.y]); */
  }
  
  Collider.image_angle = 15;
  {
  
  }
}