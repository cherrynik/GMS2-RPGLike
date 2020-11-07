#macro seconds 1000000
#macro gamefps 60

function get_delta_time() {
	time = (delta_time / seconds) * gamefps;
	return time;
}