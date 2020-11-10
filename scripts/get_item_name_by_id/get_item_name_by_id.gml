function get_item_name_by_id(_itemsStruct, _id) {
	if (_id == 0) {
		return noone
	}
	
	var _struct = variable_struct_get_names(_itemsStruct)
	var _structSize = array_length(_struct)
	
	for (var i = 0; i < _structSize; i++) {
		var _currentStruct = variable_struct_get(_itemsStruct, _struct[i])

		if (_currentStruct.id == _id) {
			return _currentStruct.name
		}
	}
}