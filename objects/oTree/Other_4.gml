// Генерация коллизии у ствола дерева
// instance_create_layer(x + sprite_width / 2 - 6, y + sprite_height - 8, "Game", oCollider)

/* TODO:
 * Создать две системы частиц:
 * Первая создаётся на переднем плане и имеет свою "глубину"
 * Вторая создаётся на заднем плане и имееют иную свою "глубину"
 *
 * Когда Life particle'а равен или менее определенного числа - создавать объект 
 */
 
// Пример рандомной генерации "глубины":
/*
	alarm[2] = true
	
	// Alarm 2:
	var _depth = round(random(1))
	var _depthArr = [-bbox_bottom, bbox_top]
	_depth = _depthArr[_depth]
	show_debug_message(_depth)

	part_system_depth(part, _depth)

	alarm[2] = 15
*/
// ---===@@@===---

// Система частиц
part = part_system_create()
partType = part_type_create()
//part_type_shape(partType, pt_shape_pixel)
part_type_sprite(partType, sLeaf, true, true, true)
part_type_orientation(partType, -45, 45, .1, .5, true)
part_type_size(partType, .5, 1, 0, 0)
part_type_speed(partType, .05, .1, .0, 0)
part_type_direction(partType, 250, 270, .1, .2)
part_type_life(partType, 500, 500)

partEmitter = part_emitter_create(part)
part_emitter_region(part, partEmitter, x + sprite_width / 2 - 6 - 20, x + sprite_width / 2 - 6 + 35, y + 15, y + 15, ps_shape_ellipse, ps_distr_linear)
part_emitter_stream(part, partEmitter, partType, -400)