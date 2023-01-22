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
	if (place_meeting(x,y+1,oWall)){
		// make sure player is facing correct direction
		var _current_face = 0;
		if (_right_key) {
		 sprite_index = DennyMoveRight;
		 _current_face = 0;			
		} else if (_left_key) {
		 sprite_index = DennyMoveLeft;
		 _current_face = 1;
		} else {
			sprite_index = sprite[_current_face];
		}
		// jumping		
		if (place_meeting(x,y+1,oWall)) && (_jump_key) {
			yspd = -5;
			if (_current_face = 0) {
				sprite_index = DennyJumpRight;

			} else {
				sprite_index = DennyJumpRight;
				image_xscale = -1;
			};			
		};
		
		xspd = _move_x * walk_spd;
	};	
	
	xspd += gunkick_x;
	gunkick_x = 0;
	yspd += grv + gunkick_y;
	gunkick_y = 0;
	
	//get the direction		
	move_dir = point_direction(0, 0, _move_x, _move_y);

	
	
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
if (!place_meeting(x,y+1, oWall) && !_jump_key) {
	// make sure player is facing correct direction
	// set the current sprite		
	sprite_index = sprite[face];
	face = round(aim_dir/180);
	if (face == 2) {
		face = 0;
	};
};
	// animate
	if (xspd == 0 && yspd == 0) {
		image_index = 0;
	};
	
	
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
			
			// move the player - propulsion
				
				
			// create the bullet
			var _x_offset = lengthdir_x(weapon.length, aim_dir);
			var _y_offset = lengthdir_x(weapon.length, aim_dir);
			
			var _spread = weapon.spread;
			var _spread_div = _spread / weapon.bulletNum;
			
			// create the correct number of bullets
			for (var i = 0; i < weapon.bulletNum; i++) {
				var _bullet_inst = instance_create_depth(x + _x_offset, center_y + _y_offset, depth-100, weapon.bulletObj);
				
				if (current_weapon == 2) {
					gunkick_x = lengthdir_x(8, aim_dir-180);
					gunkick_y = lengthdir_y(8, aim_dir-180);
				} else {
					gunkick_x = lengthdir_x(1.5, aim_dir-180); // -180 moves player opposite of aim dir
					gunkick_y = lengthdir_y(2, aim_dir-180);
				};				
				 
				// change the bullets direction
				with(_bullet_inst) {
					dir = other.aim_dir - _spread/2 + _spread_div*i;
				};
			};		
		};
		
			
		
		