#macro DO_SKIP_FRAMES false
#macro FPS_LOCK       60

function get_delta_time() {
	var SEC_IN_MS = 1000000,
	    lag_count = DO_SKIP_FRAMES ?
				      (delta_time / SEC_IN_MS) * FPS_LOCK :
					  (delta_time / SEC_IN_MS) * fps;
	return max(1, lag_count);
}