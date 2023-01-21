/// @description Insert description here


//Get Current Camera Position
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);
var camW = camera_get_view_width(camera);
var camH = camera_get_view_height(camera);

//Panning
if (mouse_check_button(mb_middle)) {
	var move_x = device_mouse_x_to_gui(0) - mouse_x_previous;
	var move_y = device_mouse_y_to_gui(0) - mouse_y_previous;
	camX -= move_x;
	camY -= move_y;
} else {
	//Set Target Camera Position
	var targetX = oPlayer.x - RES_W / 2;
	var targetY = oPlayer.y - RES_H / 2;
	
	//Clamp Target to Room Bounds
	targetX = clamp(targetX, 0, room_width - camW);
	targetY = clamp(targetY, 0, room_height - camH);

	//Smooth Move Camera to Target Location
	camX = lerp(camX, targetX, CAM_SMOOTH);
	camY = lerp(camY, targetY, CAM_SMOOTH);
}

//Zooming
var wheel = mouse_wheel_down() - mouse_wheel_up();

if (wheel != 0) {
	wheel *= 0.1;
	
	//Add to Size
	var addW = camW * wheel;
	var addH = camH * wheel;
	camW += addW;
	camH += addH;
	
	//Position
	camX -= addW / 2;
	camY -= addH / 2;
}

//Apply Camera Position
camera_set_view_pos(camera, camX, camY);
camera_set_view_size(camera, camW, camH);

//Test Test
//Screen Shake
//x += random_range(-shake_remain, shake_remain);
//y += random_range(-shake_remain, shake_remain);
//shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

//Store Previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);

