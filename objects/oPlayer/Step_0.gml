/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ
if (hp <= 0 && alive) {
	instance_create_layer(0,0,"Instances_3",oGameOver_Overlay);
	alive = false
}

if !prohibited {
	if (keyboard_check_pressed(ord("1"))) if (array_length(inventory) > 0) UseItem(0);
	if (keyboard_check_pressed(ord("2"))) if (array_length(inventory) > 1) UseItem(1);
	if (keyboard_check_pressed(ord("3"))) if (array_length(inventory) > 2) UseItem(2);
	if (keyboard_check_pressed(ord("4"))) if (array_length(inventory) > 2) UseItem(3);
	if (keyboard_check_pressed(ord("5"))) if (array_length(inventory) > 2) UseItem(4);
}

coinShower();