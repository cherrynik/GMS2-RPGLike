// Декларация переменных
var _viewX = camera_get_view_x(camera)
var _viewY = camera_get_view_y(camera)

// Следование за игроком
var _targetX = target.x - RES_W / 2 + 8
var _targetY = target.y - RES_H / 2 + 8

_targetX = clamp(_targetX, 0, room_width - RES_W)
_targetY = clamp(_targetY, 0, room_height - RES_H)

// Плавное передвижение камеры
_viewX = lerp(_viewX, _targetX, CAM_SMOOTH)
_viewY = lerp(_viewY, _targetY, CAM_SMOOTH)

camera_set_view_pos(camera, _viewX, _viewY)