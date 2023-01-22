/// @description Insert description here

hascontrol = true;
enteredRoom = false;

// movement variables
xspd = 0;
yspd = 0;
grv = 0.01;
walk_spd = 4;

// aiming variables
move_dir = 0;
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
	//add weapons to player weapon inv
		array_push(global.PlayerWeapons, global.WeaponList.pistol);
		array_push(global.PlayerWeapons, global.WeaponList.machineGun);
		array_push(global.PlayerWeapons, global.WeaponList.shotgun);

current_weapon = 0;
weapon = global.PlayerWeapons[current_weapon];