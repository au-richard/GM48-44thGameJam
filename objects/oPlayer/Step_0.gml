/// @description Insert description here

// player input
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _jump_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));
var _shoot_key = mouse_check_button(mb_left);
var _pickup_key = mouse_check_button_pressed(mb_right);
var _swap_weapon = keyboard_check_pressed(vk_shift);

// player movement
	// walking
	var _move_x = _right_key - _left_key;
	var _move_y = _down_key - _jump_key;
	xspd = _move_x * walk_spd;
	yspd += grv;
	
	//get the direction		
	move_dir = point_direction(0, 0, _move_x, _move_y);

	// jumping
	if (place_meeting(x,y+1,oPlatform)) && (_jump_key) {
		yspd = -7
	};	
	
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
		
// player aiming		
 center_y = y + center_y_offset;
 // aiming
	aim_dir = point_direction(x, center_y, mouse_x, mouse_y);
 
		
// sprite control
	// make sure player is facing correct direction
	face = round(aim_dir/90);
	if (face == 4) {
		face = 0;
	};
	// animate
	if (xspd == 0 && yspd == 0) {
		image_index = 0;
	};
	// set the current sprite
	mask_index = sPlayer;
	sprite_index = sprite[face];
	
// weapons
	//cycle through weapons
	var _player_weapons = global.PlayerWeapons;
	
		if (_swap_weapon) {
			//change the selection and wrap around
			current_weapon++;
			if (current_weapon >= array_length(_player_weapons)) {
			 current_weapon = 0;
			};
		
			//set the new weapon
			weapon = _player_weapons[current_weapon];
		
		};
		