// База данных предметов
ItemTable = {
	none: 0, // Пустой предмет
	
	// Название предмета в древе предметов
	wood: {
		id: 1,
		name: "wood", // Название предмета
		class: "entity", // Класс предмета
		rarity: 0, // Редкость предмета
		type: { // Вариации предмета
			first: { // Первая вариация
				label: {
					ru: "Веточка",
					en: "Twig"
				},
				desc: {
					ru: "Тоненькая и гибкая...",
					en: "Slender and flexible..."
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
		id: 2,
		name: "rock",
		class: "entity",
		rarity: 0,
		type: {
			first: {
				label: {
					ru: "Камешек",
					en: "Pebble",
				},
				desc: {
					ru: "Подростки любят таким запускать блинчики.",
					en: "Teenagers like to run pancakes this way."
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
					en: "Rock"
				},
				desc: {
					ru: "Это тебе не малыш, им можно случайно задеть кого-то не без последствий...",
					en: "This is not a little, it can accidentally hurt someone with consequences..."
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
	if (is_undefined(_id) || _id == 0) {
		return noone
	}
	
	show_debug_message(_id)
	
	_itemID = {} // Здесь скапливаются данные о искомом предмете
	structCheck = ItemTable
	var _selected // Декларация на верхнем уровне
	var _temp = string_split(_id, ":") // Разбиваем айди элемента на массив
	var _tempLength = array_length(_temp)
	
	// Локальная функция для быстрого взаимодействия со структурами (объектами)
	function temp_struct_get(_name) {
		return variable_struct_get(structCheck, _name)
		
		/* Переменная _name везде одинаковая,
		 * но значения у неё везде разные —
		 * область видимости.
		 */
	}
	
	// Сохранение базовых данных об объекте
	function get_default_data(_name) {
		_itemID.name = temp_struct_get(_name).name
		_itemID.class = temp_struct_get(_name).class
		_itemID.rarity = temp_struct_get(_name).rarity

		return _itemID
	}

	/* Сохраняем обязательные конкретные данные о предмете,
	 * взяв сохранённое слово и
	 * нашедши по нему его данные в древе ItemTable
	 */
	function get_advanced_data(_name, _type)  {
		var _subtypeToString = function(_number) {
			switch (_number) {
				default:
					case 1: return "first" break
				case 2: return "second" break
				case 3: return "third" break
			}
		}
		
		if (is_numeric(_type)) {
			_type = _subtypeToString(_type)
		}
		
		_selfType = temp_struct_get(_name).type
		_typeStruct = variable_struct_get(_selfType, _type)
		
		// Локальная функция-переменная для доступа к данным к локализации
		var _localizedData = function(_struct) {
			var _gameLang = string(global.GameLanguage)
			var _currentStruct = variable_struct_get(_typeStruct, _struct)
			_currentStruct = variable_struct_get(_currentStruct, _gameLang)
			
			return _currentStruct
		}
		
		_itemID.name = (!is_undefined(_itemID.name)) ? _itemID.name + _typeStruct.name : _typeStruct.name
		_itemID.spriteID = _typeStruct.spriteID
		_itemID.isStacked = _typeStruct.isStacked
		_itemID.maxCount = _typeStruct.maxCount
		_itemID.object = _typeStruct.object
		
		_itemID.label = _localizedData("label")
		_itemID.desc = _localizedData("desc")

		return _itemID
	}
	
	// Если массив не пустой...
	if (_tempLength) {
		_selected = get_item_name_by_id(structCheck, _id)
		_itemID = get_default_data(_selected)

		// И если айди имеет подгруппу
		if (_tempLength == 3 && _temp[0] != 0) {
			// И это число больше 2, то оно ограничено максимум 2 (т.к. это макс. кол-во вариаций из всех)
			_temp[2] = (is_numeric(_temp[2]) && (_temp[2] > 2)) ? undefined : _temp[2]
			_itemID = get_advanced_data(_selected)
		} else { // Если айди не имеет подгруппу
			_itemID = (_temp[0] != 0) ? get_advanced_data(_selected, "first") : noone // Сохранить в него конкретные данные по умолчанию
		}
	}

	return _itemID
}