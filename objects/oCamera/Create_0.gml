#region Variables
Resolution = {
  Width:  undefined,
  Height: undefined
};

Display = {
  Width:  undefined,
  Height: undefined,
};

Borders = {
  x_start: 0,
  y_start: 0,
  x_end:   undefined,
  y_end:   undefined,
};

Instance = undefined;
Target   = {
  Object: undefined,
  x:      undefined,
  y:      undefined,
}

SmoothBy = undefined;
#endregion

#region Methods
View = function(_view_id = 0) {
  view_enabled           = true;
  view_visible[_view_id] = true;
  view_set_camera(_view_id, Instance);

  Render();
}

Render = function() {
  // FIXME: Pixel lagging on non-display resolutions
  display_set_gui_size(Resolution.Width, Resolution.Height);

  Display.Width  = display_get_width();
  Display.Height = display_get_height();
  surface_resize(application_surface, Display.Width, Display.Height);
}

Follow = function() {
  Target.x = clamp(Target.Object.x - Resolution.Width  / 2 + sprite_get_width(Target.Object.sprite_index),
                   Borders.x_start,
			       Borders.x_end);
  Target.y = clamp(Target.Object.y - Resolution.Height / 2 + sprite_get_height(Target.Object.sprite_index),
                   Borders.x_start,
			       Borders.y_end);
}

Smooth = function() {
  var x_view = lerp(camera_get_view_x(Instance), Target.x, SmoothBy),
      y_view = lerp(camera_get_view_y(Instance), Target.y, SmoothBy);
  
  camera_set_view_pos(Instance, x_view, y_view);
}

FollowSmoothly = function() {
  Follow();
  Smooth();
}

Camera = function(_resolution = global.Resolution,
                  _target     = oPlayer,
				  _smooth     = .05) constructor {
  Target.Object = _target;
  Resolution    = _resolution;
  SmoothBy      = _smooth;
  
  Borders.x_end = room_width - Resolution.Width;
  Borders.y_end = room_height - Resolution.Height;
  
  Follow();

  Instance = camera_create_view(Target.x, Target.y, Resolution.Width, Resolution.Height);
  
  View();
}();
#endregion