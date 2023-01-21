x = oPlayer.x;
y = oPlayer.y + 10;

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingdelay -= 1;
recoil = max(0, recoil - 1);

if ((mouse_check_button(mb_left)) && (firingdelay < 0)) {
	firingdelay = 25;
	recoil = 4;
	//ScreenShake(2, 10);
	with (instance_create_layer(x, y, "Player", oShotgunBullet)) {
		spd = 15;
		//Adding bullet spread on firing
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
	//Adding gun kickback
	with (oPlayer) {
		gunkickx = lengthdir_x(1, other.image_angle - 180);
		gunkicky = lengthdir_y(6, other.image_angle - 180);
	}
}

x -= lengthdir_x(recoil, image_angle);
y -= lengthdir_y(recoil, image_angle);

//Gun Facing Direction
if ((image_angle > 90) && (image_angle < 270)) {
	image_yscale = -1;
} else {
	image_yscale = 1;
}