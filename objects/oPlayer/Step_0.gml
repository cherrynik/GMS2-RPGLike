player_move(Collision, global.Player.defaultSpeed)
select_inventory_slot(Inventory)

if (keyboard_check_released(ord("R"))) {
	global.GameLanguage = "en"
	show_message("Переключено на английский язык")
} else if (keyboard_check_released(ord("T"))) {
	global.GameLanguage = "ru"
	show_message("Переключено на русский язык")
}