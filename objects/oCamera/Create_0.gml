#region Variables
Resolution = {
  Width: 480,
  Height: 270
}

#macro CAM_SMOOTH .05

target = oPlayer
camera = noone
#endregion

#region Methods
// Включение вьюпортов
view_enabled = true
view_visible[0] = true

// Стартовая позиция
var _initX = target.x - Resolution.Width / 2
var _initY = target.y - Resolution.Height / 2

// Создание камеры
camera = camera_create_view(_initX, _initY, Resolution.Width, Resolution.Height)
view_set_camera(0, camera)

// Генерация размеров окна
var _displayW = display_get_width()
var _displayH = display_get_height()

window_set_size(Resolution.Width, Resolution.Height)
surface_resize(application_surface, _displayW, _displayH) // Благодаря этому параметру, вид в игре будет лучше
display_set_gui_size(Resolution.Width, Resolution.Height) // Размер GUI будет совпадать на любых разрешениях с исходным
#endregion Methods