// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function UseItem(itemNum) {
	var StartingHP = oPlayer.hp;
	var ItemKeep = false;
	
	if (array_length(oPlayer.inventory)) {
		if (oPlayer.inventory[itemNum] == sSushiRoll) {
			oPlayer.hp++;
		}
	
		if (oPlayer.inventory[itemNum] == sHP_Refill) {
			if (oPlayer.hp < 8) oPlayer.hp = 8;
			else ItemKeep = true;
		}
		
		if (oPlayer.inventory[itemNum] == sBlockBlock) {
			audio_play_sound(sndPing, 1, false);
			oPlayer.blocking = true;
			oPlayer.alarm[0] = 1*fps;
		}
	}
	
	if (StartingHP < oPlayer.hp) audio_play_sound(sndHeal, 1, false);
	
	if (!ItemKeep) oPlayer.inventory[itemNum] = pointer_null;
	
	for (var i = 0; i < array_length(oPlayer.inventory) - 1; i++) {
		if (oPlayer.inventory[i] == pointer_null) {
			oPlayer.inventory[i] = oPlayer.inventory[i + 1];
			oPlayer.inventory[i + 1] = pointer_null;
		}
	}
}