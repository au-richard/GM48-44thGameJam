/// @description Description here
function gun_kickback(_gun_type) {
	/*if ((mouse_check_button(mb_left)) && (firingdelay < 0)) {
	firingdelay = 5;
	recoil = 4;
	ScreenShake(2, 10);
	with (instance_create_layer(x, y, "Bullets", oBullet)) {
		spd = 25;
		//Adding bullet spread on firing
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}*/
	
	
	//shotgun if statement not working, interfering with others - causing kickback only to go left
	//Adding gun kickback	
	/* if (global.PlayerWeapons[0] == global.WeaponList.pistol) {
		gunkickx = lengthdir_x(0, other.image_angle - 180);
		gunkicky = lengthdir_y(0, other.image_angle - 180);
	}
	if (global.PlayerWeapons[1] == global.WeaponList.machineGun) {
		gunkickx = lengthdir_x(0, other.image_angle - 180);
		gunkicky = lengthdir_y(0, other.image_angle - 180);
	}
	if (global.PlayerWeapons[2] == global.WeaponList.shotgun) {
		gunkickx = lengthdir_x(0, other.image_angle - 180);
		gunkicky = lengthdir_y(0, other.image_angle - 180);
	} */
	with (oPlayer) {
			if (current_weapon == global.WeaponList.pistol) {
				global.gunkickx = lengthdir_x(1.5, other.image_angle - 180);
				global.gunkicky = lengthdir_y(1, other.image_angle - 180);
			}
			if (global.WeaponList.machineGun) {
				global.gunkickx = lengthdir_x(2.5, other.image_angle - 180);
				global.gunkicky = lengthdir_y(2, other.image_angle - 180);
			}
			if (global.WeaponList.shotgun) {
				global.gunkickx -= other.lengthdir_x(6, image_angle - 180);
				global.gunkicky -= other.lengthdir_y(6, image_angle - 180);
			}
	}

}