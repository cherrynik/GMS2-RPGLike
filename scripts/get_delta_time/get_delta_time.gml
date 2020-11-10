#macro seconds 1000000 // Секунда
#macro gamefps global.GameFPS // Фреймрейт по умолчанию

function get_delta_time() {
	var _time = (delta_time / seconds) * gamefps // Рассчёт: сколько времени прошло в кадре
	return _time
}