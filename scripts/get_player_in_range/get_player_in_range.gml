function get_player_in_range(_x, _y, _r) {
	return collision_circle(_x, _y, _r, oPlayer, false, true)
}