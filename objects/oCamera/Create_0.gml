// Переменные
#macro RES_W 480
#macro RES_H 270
#macro CAM_SMOOTH .1

target = oPlayer

// Включение вьюпортов
view_enabled = true
view_visible[0] = true

// Стартовая позиция
var _initX = target.x - RES_W / 2
var _initY = target.y - RES_H / 2

// Создание камеры
camera = camera_create_view(_initX, _initY, RES_W, RES_H)
view_set_camera(0, camera)

// Генерация размеров
window_set_size(RES_W, RES_H)
surface_resize(application_surface, RES_W, RES_H)
display_set_gui_size(RES_W, RES_H)