/// @description Insert description here

// receive damage
if (place_meeting(x,y,oDamageEnemy)) {
	var _inst = instance_place(x,y,oDamageEnemy);
	
	// take damage from specific instance
	hp -= _inst.damage;
	sprite_index = hit_sprite;
	
	// tell the damage instance to destroy itself
	instance_destroy(_inst)
};

// death
if (hp <= 0) {
	// enemy death direction
	if (oPlayer.x < x) {
	sprite_index = death_sprite;	
	} else {
		sprite_index = death_sprite;
		image_xscale = -1;
	};
	
	if (image_index > image_number -1) {
		instance_destroy();
	};
};

