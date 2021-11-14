#macro seconds 1000000 // Секунда
#macro gamefps 60 // Фреймрейт по умолчанию

function get_delta_time() {
	var time = (delta_time / seconds) * gamefps // Рассчёт: сколько времени прошло в кадре
	return max(1, time);
}