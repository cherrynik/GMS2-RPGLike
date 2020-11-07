function parse_inventory( _item, _invLink) {
	var _invSlots = array_length(_invLink)
	var _again = false
	
	if (!oPlayer.isInvFull) {
		for (var i = 0; i < _invSlots; i++) {
			if (_invLink[i].item != noone && i != _invSlots - 1 && !_again) {
				if ((_item.name == _invLink[i].item.name) && (_item.maxCount > _invLink[i].count)) {
					_invLink[i].count++

					instance_destroy(self)
					break
				}
			} else if (i == _invSlots - 1) {
				_again = true
				i = -1
			} else if (_again) {
				if (_invLink[i].item == noone && i != _invSlots - 1) {
					if (_invLink[i].selected) {
						_invLink[i] = {
							item: _item,
							count: 1,
							selected: true
						}
					} else {
						_invLink[i] = {
							item: _item,
							count: 1,
							selected: false
						}
					}

					instance_destroy(self)
					break
				} else if (_again && i == _invSlots - 1) {
					oPlayer.isInvFull = true
					break
				}
			}
		}
	}
	
	return _invLink
}