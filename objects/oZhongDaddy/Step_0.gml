if fade {
	if image_alpha > 0 { image_alpha -= fade_inc; fade_inc+=0.02; }
	else instance_destroy()
}