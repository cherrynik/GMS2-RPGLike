function player_get_direction(_listDirs, _currentDir) {
	var _dir = ""

	switch (round(_currentDir[0])) {
		case 0: _dir = (_currentDir[1] != 0) ? "" : "staying" break
		case 1: _dir = _listDirs[1] break
		case -1: _dir = _listDirs[3] break
	}
	
	switch (round(_currentDir[1])) {
		case 1: _dir = (_dir != "") ? _dir + " " + _listDirs[2] : _listDirs[2] break
		case -1: _dir = (_dir != "") ? _dir + " " + _listDirs[0] : _listDirs[0] break
	}
	
	return _dir
}