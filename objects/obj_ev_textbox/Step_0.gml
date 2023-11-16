event_inherited()
if window.selected_element == id {
	cursor_time++
	if size_time < 100
		size_time += 10

	var dir = ev_get_horizontal_pressed()
	if dir != 0
		cursor_time = 0
	cursor_pos = clamp(cursor_pos + dir, 1, string_length(txt) + 1)

	switch (keyboard_lastkey) {
		case vk_delete:
			txt = string_delete(txt, cursor_pos, 1)
			break;
		case vk_backspace:
			txt = string_delete(txt, cursor_pos - 1, 1)
			cursor_pos--
			break;
		case vk_enter:
			// alowing keyboard_lastchar inserts an Evil and Fucked Up newline character that is not \n
			// so we do this instead.
	
			txt = string_insert("\n", txt, cursor_pos)
			cursor_pos++
			break;
		case vk_escape:
			window.selected_element = noone
			break;
		default:
			if is_char_valid(keyboard_lastchar) {
				txt = string_insert(keyboard_lastchar, txt, cursor_pos)
				cursor_pos++
			}
			break;
	}

	keyboard_lastchar = ""
	keyboard_lastkey = 0
}
else {
	if size_time > 0 {
		size_time -= 10
		if size_time <= 0 && (xscale != base_scale_x || yscale != base_scale_y) {
			audio_play_sound(asset_get_index("snd_ev_textbox_click"), 10, false, 1, 0, 1.2)	
		}
	}
}
calculate_scale()

var t = animcurve_channel_evaluate(curve, size_time / 100)
image_xscale = lerp(base_scale_x, xscale, t)
image_yscale = lerp(base_scale_y, yscale, t)
update_position()