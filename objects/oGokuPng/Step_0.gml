if image_index = 11 {
	fade = true
	oPlayer.surge = 2
	image_speed = 0
}

if fade {
	if image_alpha > 0 { image_alpha -= fade_inc; }
	else instance_destroy()
}