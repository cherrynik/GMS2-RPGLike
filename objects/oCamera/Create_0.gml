// Декларация переменных
#macro RES_W 480
#macro RES_H 270
#macro CAM_SMOOTH .05

target = oPlayer
camera = noone

// Включение вьюпортов
view_enabled = true
view_visible[0] = true

// Стартовая позиция
var _initX = target.x - RES_W / 2
var _initY = target.y - RES_H / 2

// Создание камеры
camera = camera_create_view(_initX, _initY, RES_W, RES_H)
view_set_camera(0, camera)

// Генерация размеров окна
var _displayW = display_get_width()
var _displayH = display_get_height()

window_set_size(RES_W, RES_H)
surface_resize(application_surface, _displayW, _displayH) // Благодаря этому параметру, вид в игре будет лучше
display_set_gui_size(RES_W, RES_H) // Размер GUI будет совпадать на любых разрешениях с исходным