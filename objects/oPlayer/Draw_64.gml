/* draw_set_color(c_white);
draw_set_font(Example);

var _InvSlots = array_length(Inventory);

for (var i = 0; i < _InvSlots; i++) {
	if (Inventory[i].item == noone) {
		if (Inventory[i].selected) {
			draw_sprite(sSlot, 1, 15, i * 15 + 5);
		} else {
			draw_sprite(sSlot, 0, 15, i * 15 + 5);
		}
	} else {
		if (Inventory[i].selected) {
			draw_sprite_ext(sSlot, 0, 12.75, i * 15 + 5, 1.5, 1.5, 0, c_yellow, 1);
			draw_sprite(Inventory[i].item.spriteID, 0, 15.2, i * 15 + 5);

			draw_text_ext_transformed(26, i * 15 + 5, Inventory[i].item.label, 30, 300, .3, .3, 0);
			draw_text_ext_transformed(26, i * 15 + 10, Inventory[i].count, 30, 300, .3, .3, 0);
		} else {
			draw_sprite_ext(sSlot, 0, 12.75, i * 15 + 5, 1.5, 1.5, 0, c_white, 1);
			draw_sprite(Inventory[i].item.spriteID, 0, 15.2, i * 15 + 5);

			draw_text_ext_transformed(26, i * 15 + 5, Inventory[i].count, 30, 300, .3, .3, 0);
		}
	}
} */