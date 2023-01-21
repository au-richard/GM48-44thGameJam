/// @description Insert description here

// player input
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _jump_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));
var _shoot_key = mouse_check_button(mb_left);
var _pickup_key = mouse_check_button_pressed(mb_right);
var _swap_weapon = keyboard_check_pressed(vk_shift);
var _pause_key = keyboard_check_pressed(vk_enter);

// pause menu
if (_pause_key) {
	if (!instance_exists(oScreenPause)) {
		instance_create_depth(0,0,0,oScreenPause);
	} else {
		instance_destroy(oScreenPause);
	};
};

// player movement
	// walking
	var _move_x = _right_key - _left_key;
	var _move_y = _down_key - _jump_key;
	xspd = _move_x * walk_spd;
	yspd += grv;
	
	//get the direction		
	move_dir = point_direction(0, 0, _move_x, _move_y);

	// jumping
	if (place_meeting(x,y+1,oWall)) && (_jump_key) {
		yspd = -10
	};	
	
	// collisions
		// horizontal
		if (place_meeting(x+xspd,y,oWall)) {
			while (!place_meeting(x+sign(xspd),y,oWall)) {
				x += sign(xspd);
			};
			xspd = 0;
		};	
		x += xspd;
		
		// vertical
		if (place_meeting(x,y+yspd, oWall)) {
			while (!place_meeting(x,y+sign(yspd),oWall)) {
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
		
		// shoot the weapon
		if (shoot_timer > 0) {
			shoot_timer--;
		};
		if (_shoot_key && shoot_timer <= 0) {
			// reset the timer
				shoot_timer = weapon.cooldown;
			// create the bullet
			var _x_offset = lengthdir_x(weapon.length, aim_dir);
			var _y_offset = lengthdir_x(weapon.length, aim_dir);
			
			var _spread = weapon.spread;
			var _spread_div = _spread / weapon.bulletNum;
			
			// create the correct number of bullets
			for (var i = 0; i < weapon.bulletNum; i++) {
				var _bullet_inst = instance_create_depth(x + _x_offset, center_y + _y_offset, depth-100, weapon.bulletObj);
			
				// change the bullets direction
				with(_bullet_inst) {
					dir = other.aim_dir - _spread/2 + _spread_div*i;
				};
			};		
		};
		
			
		
		