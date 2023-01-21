/// @description Insert description here


// movement
xspd = lengthdir_x(spd,dir);
yspd = lengthdir_y(spd,dir);

x += xspd;
y += yspd;

// collision
if (place_meeting(x,y,oWall)) {
 instance_destroy();
};
