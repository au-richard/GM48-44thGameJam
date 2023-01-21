/// @description Insert description here

// movement variables
xspd = 0;
yspd = 0;
grv = .1;
walk_spd = 4;

//Gun Kickback
global.gunkickx = 0.1;
global.gunkicky = 4;

// aiming variables
move_dir = 0;
weapon_offset_dist = 4;
aim_dir = 0;
center_y_offset = -5; // set weapon position in relation to player
center_y = y + center_y_offset;

// sprite control
face = 3;
sprite[0] = sPlayerRight;
sprite[1] = sPlayer; // up
sprite[2] = sPlayerLeft;
sprite[3] = sPlayer; // down

// weapons
	shoot_timer = 0;
	shoot_cooldown = 0;	
	//add weapons to player weapon inv
		array_push(global.PlayerWeapons, global.WeaponList.pistol);
		array_push(global.PlayerWeapons, global.WeaponList.machineGun);
		array_push(global.PlayerWeapons, global.WeaponList.shotgun);

current_weapon = 0;
weapon = global.PlayerWeapons[current_weapon];