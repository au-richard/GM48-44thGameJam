/// @description Insert description here

if (place_meeting(x,y,oPlayer) && oPlayer.armor < 3) {
	// sheild player
	oPlayer.armor += shield;
	
	// destroy self
	instance_destroy();
};

