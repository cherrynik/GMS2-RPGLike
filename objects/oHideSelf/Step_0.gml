var _startX = x + oPlayer.sprite_width / 2
var _endX = x + sprite_width - oPlayer.sprite_width / 2

var _startY = y
var _endY = y + sprite_height - oPlayer.sprite_height / 2

var _isPlayerBehind = collision_rectangle(_startX, _startY, _endX, _endY, oPlayer, false, true)

if (_isPlayerBehind) {
	alarm[0] = 1
} else {
	alarm[1] = 1
}

image_alpha = clamp(image_alpha, global.GlobalOpacity, 1)