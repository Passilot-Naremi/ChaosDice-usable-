/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ
if fade {
	if image_alpha > 0 { image_alpha -= fade_inc; fade_inc+=0.02; }
	else instance_destroy()
}

if (image_angle != 0) image_angle-=35;
if (image_xscale != 1 && image_yscale != 1) { image_xscale+=0.1; image_yscale+=0.1; }
else if rotato {
	oPlayer.prohibited = 2
	alarm[0] = fps;
	rotato = false;
}