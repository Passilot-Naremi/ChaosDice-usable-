/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ
for (var i = 1; i <= hp; i++) {
	var blend = c_white
	if oPlayer.surge blend = c_teal
	else blend = c_white
	draw_sprite_ext(sHP_Shard, 0, i*64, 32, 1, 1, 0, blend, 1);
}

for (var i = 1; i <= array_length(inventory); i++) {
	var blend = c_white
	if (typeof(inventory[i-1]) != "ptr") {
		if oPlayer.prohibited blend = c_red
		else blend = c_white
		draw_sprite_ext(inventory[i-1], 0, i*70, 992, 1, 1, 0, blend, 1);
	}
}