// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_weapon(){
	//draw_sprite_ext(DennyArmPistol,0,x, center_y,1,1,aim_dir,c_white,1);
	
	
	//draw the weapon	
	//get the weapon off the players body
	var _x_offset = lengthdir_x(weapon_offset_dist + 5, aim_dir);
	var _y_offset = lengthdir_y(weapon_offset_dist + 35, aim_dir);
	
	//flip the weapon upright
	var _weaponYscl = 1;
	if (aim_dir > 90 && aim_dir < 270) {
		_weaponYscl = -1;
	};

	draw_sprite_ext(weapon.sprite, 0, x + 8, center_y - 30, 1, _weaponYscl, aim_dir, c_white, 1);
}