#region Variables
Resolution = {
  Width:  undefined,
  Height: undefined
};

Instance = undefined;
Target   = undefined;
Smooth   = undefined;
#endregion

// TODO: Camera effects, tests for camera, improvements, fixes
#region Methods
View = function(_view_id = 0) {
  var display_w          = display_get_width(),
  	  display_h          = display_get_height();
  view_enabled           = true;
  view_visible[_view_id] = true;

  view_set_camera(_view_id, Instance);

  window_set_size(Resolution.Width, Resolution.Height); 
  surface_resize(application_surface, display_w, display_h); // Благодаря этому параметру, вид в игре будет лучше
  display_set_gui_size(Resolution.Width, Resolution.Height); // Размер GUI будет совпадать на любых разрешениях с исходным
}

Follow = function() {
  var x_view   = camera_get_view_x(Instance),
      y_view   = camera_get_view_y(Instance),
	  x_target = Target.x - Resolution.Width / 2 + sprite_get_width(Target.sprite_index),
      y_target = Target.y - Resolution.Height / 2 + sprite_get_height(Target.sprite_index);
  
  x_target = clamp(x_target, 0, room_width - Resolution.Width)
  y_target = clamp(y_target, 0, room_height - Resolution.Height)
  
  // Плавное передвижение камеры
  x_view = lerp(x_view, x_target, Smooth)
  y_view = lerp(y_view, y_target, Smooth)
  
  camera_set_view_pos(Instance, x_view, y_view)	
}

var Camera = function(_resolution = { Width: 480, Height: 270 },
                      _target     = oPlayer,
				      _smooth     = .05) constructor {
  Target     = _target;
  Resolution = _resolution;
  Smooth     = _smooth;

  var x_start = Target.x - Resolution.Width  / 2,
      y_start = Target.y - Resolution.Height / 2;
  Instance = camera_create_view(x_start, y_start, Resolution.Width, Resolution.Height);

  View();
}();
#endregion Methods