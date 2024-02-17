event_inherited()
var margin_y = 10;
var margin_x = 16;

left_edge = x - (image_xscale * 8) + margin_x
top_edge = y - (image_yscale * 8) + margin_y
var step = (image_xscale * 16 - 2 * margin_x) / 9

star_sprite = asset_get_index("spr_ev_star")

for (var i = 0; i < 7; i++) {
	// + 16 to make room for the star
	var inst = instance_create_layer(left_edge + 16 + i * step, top_edge, "WindowElements", asset_get_index("obj_ev_placeable_drag"), {
		num : i,
	}) 
	add_child(inst)
}

var step = (image_xscale * 16 - 2 * margin_x) / 8
var list = global.editor_instance.current_list
var i = 0, j = 0;
repeat (array_length(list)) {
	var inst = instance_create_layer(left_edge + i * step, top_edge + 40 + j * step, "WindowElements", asset_get_index("obj_ev_placeable_selection"), {
		num : i + j * 8,
		direct: true,
	}) 
	add_child(inst)
	i++;
	if i >= 8 {
		i = 0
		j++;
	}
}

