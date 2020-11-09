#region Override settings
global.GameLanguage = "ru"
#endregion

Collision = oCollisionTest

Direction = {
	coords: [0, 0],
	orientations: [
		"top",
		"right",
		"bottom",
		"left"
	],
	result: ""
}

isInvFull = false
Inventory = array_create(9, 0)
	
for (var i = 0; i < array_length(Inventory); i++) {
	Inventory[i] = {
		item: noone,
		selected: false
	}
}

Inventory[1].selected = true