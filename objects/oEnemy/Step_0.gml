/// @description Insert description here

// receive damage
if (place_meeting(x,y,oDamageEnemy)) {
	var _inst = instance_place(x,y,oDamageEnemy);
	
	// take damage from specific instance
	hp -= _inst.damage;
	
	// tell the damage instance to destroy itself
	instance_destroy(_inst)
};

// death
if (hp <= 0) {
	instance_destroy();
};

