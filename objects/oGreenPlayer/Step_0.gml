/// @description Insert description here

if (hascontrol) {
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check(vk_space) || keyboard_check(ord("W"));
} else {
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//Calculate Movement
var moveHorizontal = key_right - key_left;
hsp = moveHorizontal * walksp;
vsp += grv;

//Jump
if ((place_meeting(x, y + 1, oWall)) && (key_jump)) {
	vsp = -10;
}

//Horizontal Collision
if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;









