children = []

function add_child(obj) {
	obj.window = id
	obj.layer_num = layer_num
	array_push(children, obj)	
}

var inst = instance_create_layer(x + image_xscale * 8 - 8, y - image_yscale * 8 + 8, "WindowElements", asset_get_index("obj_ev_close_window"))
add_child(inst)

selected_element = noone

function deselect(element) {
	if object_is_ancestor(element.object_index, obj_ev_window_element) {
		with (element)
			event_user(we_deselect_event)
	}	
	if element == selected_element
		selected_element = noone
}
function select(element) {
	if object_is_ancestor(element.object_index, obj_ev_window_element) {
		with (element)
			event_user(we_select_event)
	}	
	selected_element = element;
}

function find_selected_element() {
	
	
	for (var i = 0; i < array_length(children); i++) {
		var child = children[i];
		if position_meeting(mouse_x, mouse_y, child) {
			
			if selected_element != noone {
				if child == selected_element
					return;
				deselect(selected_element)
			}
			
			select(child)
			return
		}
	}
	if selected_element != noone {
		deselect(selected_element)
		selected_element = noone
	}
		
}