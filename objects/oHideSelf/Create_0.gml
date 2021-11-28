#region Variables
Opacity  = undefined;
SmoothBy = undefined;

Target = {
  Object:  undefined,
  x_start: undefined,
  y_start: undefined,
  x_end:   undefined,
  y_end:   undefined,
};
#endregion

#region Methods
Run = function() {
  var _is_player_behind = collision_rectangle(Target.x_start, Target.y_start,
                                              Target.x_end, Target.y_end,
											  Target.Object,
											  false,
											  true);
  if (_is_player_behind) Hide();
  else Unhide();
}

Hide = function() {
  image_alpha = lerp(image_alpha, Opacity, SmoothBy);
}

Unhide = function() {
  image_alpha = lerp(image_alpha, 1, SmoothBy);
}

Init = function(_opacity = .25,
                _smooth_by = .1,
				_target = oPlayer) constructor {
  Opacity  = _opacity;
  SmoothBy = _smooth_by;
  Target   = {
	Object:  _target,
    x_start: x,
	y_start: y,
	x_end:   x + sprite_width,
	y_end:   y + sprite_height,
  };
}();
#endregion