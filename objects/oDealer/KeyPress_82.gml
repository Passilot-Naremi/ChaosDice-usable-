/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ
if !inAnim && !instance_exists(oRoll) {
	if oPlayer.surge oPlayer.hp--;
	sprite_index = sDealerRoll;
	image_index = 0;
	inAnim = true;
	alarm[0] = 1*fps;
}