function clamp_rounded(_value, _min, _max) {
  if (_value < _min) {
	return _max div abs(_value);
  } else if (_value > _max) {
    return _min mod _value;
  }
  return _value;
}