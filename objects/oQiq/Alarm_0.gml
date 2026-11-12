/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ

result = choose(2,3,4,5,6,7,8); // will have up to like 50 possible results
switch result {
	// case 1: { Roll_Caramell(); break; }
	case 2: { Roll_FredBear(); break; }
	case 3: { Roll_Item(); break; }
	case 4: { Roll_Death(oArleMommy); break; }
	case 5: { Roll_Death(oZhongDaddy); break; }
	case 6: { Roll_Jackpot(); break; }
	case 7: { Roll_Modifier(oSubaru); break; }
	case 8: { Roll_Modifier(oGokuPng); break; }
}

with oPlayer {
	if prohibited>0 prohibited--
	prohibited = clamp(prohibited, 0, 100)
	
	if surge>0 surge--
	surge = clamp(surge, 0, 100)
	
}
global.scr++