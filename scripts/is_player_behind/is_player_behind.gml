function is_player_behind(_x, _y, _rad, _opacityTo) {
	var isPlayerBehind = collision_circle(_x, _y, _rad, oPlayer, false, true)

	self.image_alpha = isPlayerBehind ? _opacityTo : 1
}