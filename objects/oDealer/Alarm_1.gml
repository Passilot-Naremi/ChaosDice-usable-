/// @description Insert description here
// You can write your code in this editor
// have an amogu ඞ
if (caramellCount < 21) {
	instance_create_layer(irandom_range(186, 1759), irandom_range(123, 952), "Instances_2", choose(oCaramell1, oCaramell2));
	caramellCount++;
	alarm[1] = 0.2*fps;
}
else caramellCount = 0;