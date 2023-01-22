/// @description Insert description here

// chase the player
if (instance_exists(oPlayer)) {
	dir = point_direction(x,y,oPlayer.x,oPlayer.y);
};

// getting the speeds
xspd = lengthdir_x(spd, dir);
yspd = lengthdir_y(spd, dir);

// get the correct face
if (xspd > 0) {
	face = 1;
};
if (xspd < 0) {
	face = -1;
};
image_xscale = face;

// collisions
if (place_meeting(x + xspd,y,oWall) || place_meeting(x+xspd,y,oEnemyParent)) {
	xspd = 0;
};
if (place_meeting(x,y + yspd,oWall) || place_meeting(x,y+yspd,oEnemyParent)) {
	yspd = 0;
};

// moving
x += xspd;
y += yspd;

// Inherit the parent event
event_inherited();

