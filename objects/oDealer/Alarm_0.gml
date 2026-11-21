/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ

if !risk { // low-risk: anything can happen
	result = choose(1,2,3,4,5); // will have up to like 50 possible results
	switch result {
		case 1: { Roll_FredBear(); break; }
		case 2: { Roll_Item(); break; }
		case 3: { Roll_Jackpot(); break; }
		case 4: { Roll_Modifier(oSubaru); break; }
		case 5: { Roll_Modifier(oGokuPng); break; }
	}
}
else { // high-risk: game throws riskier things at you
	result = choose(1,4);
	switch result {
		case 1: { Roll_FredBear(); break; }
		case 4: { Roll_Modifier(oSubaru); break; }
	}
}
with oPlayer {
	if prohibited>0 prohibited--
	prohibited = clamp(prohibited, 0, 100)
	
	if surge>0 surge--
	surge = clamp(surge, 0, 100)
	
}
global.scr++