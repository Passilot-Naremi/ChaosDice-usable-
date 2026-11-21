function Roll_Caramell() {
	with oDealer {
		audio_play_sound(snd1, 0, 0);
		instance_create_layer(irandom_range(186, 1759), irandom_range(123, 952), "Instances_2", choose(oCaramell1, oCaramell2));
		caramellCount++;
		alarm[1] = 0.2*fps;
	}
}

function Roll_FredBear() {
	with oDealer {
		audio_play_sound(snd2, 0, 0);
		instance_create_layer(0, 0, "Instances_2", oFredbear);
	}
}

function Roll_Item() {
	with oDealer {
		audio_play_sound(snd3, 0, 0);
		for (var i = 0; i <= array_length(oPlayer.inventory) - 1; i++) {
			if (oPlayer.inventory[i] = pointer_null) {oPlayer.inventory[i] = choose(sSushiRoll, sSushiRoll, sHP_Refill); break;}
		}
	}
}

function Roll_Death(killer) {
	with oDealer {
		audio_play_sound(snd4, 0, 0);
		instance_create_layer(0, 0, "Instances_2", killer);
	}
}

function Roll_Jackpot() {
	with oDealer {
		audio_play_sound(snd5, 0, 0);
		oPlayer.showering = true;
		oPlayer.alarm[1] = 4*fps;
		for (var j = 5; j > 0; j--) {
			for (var i = 0; i <= array_length(oPlayer.inventory) - 1; i++) {
				if (oPlayer.inventory[i] = pointer_null) {oPlayer.inventory[i] = choose(sSushiRoll, sSushiRoll, sHP_Refill, sBlockBlock); break;}
			}
		}
	}
}

function Roll_Modifier(modif) {
	with oDealer {
		audio_play_sound(snd6, 0, 0);
		instance_create_layer(room_width/2, room_height/2, "Instances_2", modif);
	}
}