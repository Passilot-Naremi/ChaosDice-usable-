// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function coinShower(){
	if (oPlayer.showering) instance_create_layer(irandom_range(10, 1910), -50, "Instances_2", oCoin);
}