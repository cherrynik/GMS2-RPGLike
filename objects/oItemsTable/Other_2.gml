// База данных предметов
Item = {
	none: 0, // Пустой предмет
	
	// Название предмета в древе предметов
	wood: {
		name: "wood", // Название предмета
		class: "entity", // Класс предмета
		rarity: 0, // Редкость предмета
		type: { // Вариации предмета
			first: { // Первая вариация
				label: {
					ru: "Веточка",
				},
				desc: {
					ru: "Тоненькая и гибкая..."
				},
				name: "_small", // В данном случае - будет веточка (маленький). Дополняется к названию
				object: oWood_small,
				spriteID: sWood_small, // Айди спрайта
				isStacked: true, // Складывается ли предмет в стопку
				maxCount: 48 // Максимальное количество данного предмета одновременно в одном слоте
			}
		}
	},
	
	rock: {
		name: "rock",
		class: "entity",
		rarity: 0,
		type: {
			first: {
				label: {
					ru: "Камешек",
				},
				desc: {
					ru: "Подростки любят таким запускать блинчики.",
				},
				name: "_small",
				object: oRock_small,
				spriteID: sRock_small,
				isStacked: true,
				maxCount: 48
			},
			second: {
				label: {
					ru: "Камень",
				},
				desc: {
					ru: "Это тебе не малыш, им можно случайно задеть кого-то не без последствий...",
				},
				name: "_medium",
				spriteID: sRock,
				isStacked: true,
				maxCount: 12
			}
		}
	}
}

/*
enum ItemClassID {
	entity,
	food
}

enum ItemRarelyID {
	trifle,
	common,
	rare,
	epic,
	legendary
}
*/

function get_obj_data(_id) {
	if (is_undefined(_id)) _id = 0
	
	_itemID = {} // Здесь скапливаются данные о искомом предмете
	var _selected // Деклация на верхнем уровне
	var _temp = string_split(_id, ":") // Разбиваем айди элемента на массив
	var _tempLength = array_length(_temp)
	
	// Сохраняем базовые данные о предмете
	function get_default_data(_name) {
		_itemID.name = variable_struct_get(Item, _name).name
		_itemID.class = variable_struct_get(Item, _name).class
		_itemID.rarity = variable_struct_get(Item, _name).rarity

		return _itemID
	}
	
	/* Сохраняем обязательные конкретные данные о предмете,
	 * взяв сохранённое слово и
	 * нашедши по нему его данные в древе Item
	 */
	function get_advanced_data(_name, _type)  {
		switch (_type) {
			case 1:
			case "medium":
			case "second":
				_itemID.name = !is_undefined(_itemID.name) ? _itemID.name + variable_struct_get(Item, _name).type.second.name : variable_struct_get(Item, _name).type.second.name
				_itemID.spriteID = variable_struct_get(Item, _name).type.second.spriteID
				_itemID.isStacked = variable_struct_get(Item, _name).type.second.isStacked
				_itemID.maxCount = variable_struct_get(Item, _name).type.second.maxCount
				_itemID.object = variable_struct_get(Item, _name).type.second.object
				
				if (global.GameLanguage == "ru") {
					_itemID.label = variable_struct_get(Item, _name).type.second.label.ru
					_itemID.desc = variable_struct_get(Item, _name).type.second.desc.ru
				} else {
					_itemID.label = variable_struct_get(Item, _name).type.second.label.en
					_itemID.desc = variable_struct_get(Item, _name).type.second.desc.en
				}

				break
			case 2:
			case "big":
			case "third":
				_itemID.name = !is_undefined(_itemID.name) ? _itemID.name + variable_struct_get(Item, _name).type.third.name : variable_struct_get(Item, _name).type.third.name
				_itemID.spriteID = variable_struct_get(Item, _name).type.third.spriteID
				_itemID.isStacked = variable_struct_get(Item, _name).type.third.isStacked
				_itemID.maxCount = variable_struct_get(Item, _name).type.third.maxCount
				_itemID.object = variable_struct_get(Item, _name).type.third.object
				
				if (global.GameLanguage == "ru") {
					_itemID.label = variable_struct_get(Item, _name).type.third.label.ru
					_itemID.desc = variable_struct_get(Item, _name).type.third.desc.ru
				} else {
					_itemID.label = variable_struct_get(Item, _name).type.third.label.en
					_itemID.desc = variable_struct_get(Item, _name).type.third.desc.en
				}

				break
			default:
				_itemID.name = !is_undefined(_itemID.name) ? _itemID.name + variable_struct_get(Item, _name).type.first.name : variable_struct_get(Item, _name).type.first.name
				_itemID.spriteID = variable_struct_get(Item, _name).type.first.spriteID 
				_itemID.isStacked = variable_struct_get(Item, _name).type.first.isStacked
				_itemID.maxCount = variable_struct_get(Item, _name).type.first.maxCount
				_itemID.object = variable_struct_get(Item, _name).type.first.object
				
				if (global.GameLanguage == "ru") {
					_itemID.label = variable_struct_get(Item, _name).type.first.label.ru
					_itemID.desc = variable_struct_get(Item, _name).type.first.desc.ru
				} else {
					_itemID.label = variable_struct_get(Item, _name).type.first.label.en
					_itemID.desc = variable_struct_get(Item, _name).type.first.desc.en
				}

				break
		}

		return _itemID
	}
	
	// Если массив не пустой...
	if (_tempLength) {
		
		/* Здесь хранятся ключевые айди предметов,
		 * которые должны соответсвовать порядковому номеру
		 * элемента из древа предметов Item
		 */
		switch(_temp[0]) { // В этом участке собираем обязательные базовые данные о предмете по айди
			case 1:
				_selected = "wood" // Запоминаем выбранный предмет по айди и вводим его словом
				_itemID = get_default_data(_selected) break
			case 2:
				_selected = "rock"
				_itemID = get_default_data(_selected) break
			default:
				_selected = noone
				_itemID = noone break
		}

		// И если айди имеет подгруппу
		if (_tempLength == 3 && _temp[0] != 0) {
			// И это число больше 2, то оно ограничено максимум 2 (т.к. это макс. кол-во вариаций из всех)
			//_temp[2] = (is_numeric(_temp[2]) && (_temp[2] > 2)) ? undefined : _temp[2]
			
			// Собираем обязательные конкретные данные по айди
			switch(_temp[2]) {
				case 1: _itemID = get_advanced_data(_selected, "second") break
				case 2: _itemID = get_advanced_data(_selected, "third") break
				default: _itemID = get_advanced_data(_selected) break
			}
		} else { // Если айди не имеет подгруппу
			_itemID = (_temp[0] != 0) ? get_advanced_data(_selected) : noone // Сохранить в него конкретные данные по умолчанию
		}
	}

	return _itemID
}

//show_debug_message(get_obj_data("2:1"))