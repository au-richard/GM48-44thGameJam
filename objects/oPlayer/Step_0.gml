/// @description Insert description here

// player input
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _jump_key = keyboard_check_pressed(ord("W"));
var _down_key = keyboard_check(ord("S"));
var _shoot_key = mouse_check_button(mb_left);
var _pickup_key = mouse_check_button_pressed(mb_right);

// player movement
	// walking
	var _move = _right_key - _left_key;
	xspd = _move * walk_spd;
	yspd += grv;
	
	// collisions
		// horizontal
		if (place_meeting(x+xspd,y,oPlatform)) {
			while (!place_meeting(x+sign(xspd),y,oPlatform)) {
				x += sign(xspd);
			};
			xspd = 0;
		};	
		x += xspd;
		
		// vertical
		if (place_meeting(x,y+yspd, oPlatform)) {
			while (!place_meeting(x,y+sign(yspd),oPlatform)) {
				y += sign(yspd);
			};
			yspd = 0;
		};	
		y += yspd;

	// jumping
	if (place_meeting(x,y+1,oPlatform)) && (_jump_key) {
		yspd = -7
	};