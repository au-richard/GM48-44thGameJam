/// @description Set Up Camera
/*
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;

shake_length = 60;
shake_magnitude = 6;
shake_remain = 6;
buff = 32;
*/


//Resolution
#macro RES_W 960
#macro RES_H 540
#macro RES_SCALE 1
#macro CAM_SMOOTH 0.1 

//Enable Views
view_enabled = true;
view_visible[0] = true;

//Create Camera
camera = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, camera);

//Resize Windows & Application Surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE);
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

display_set_gui_size(RES_W, RES_H);

//Center Window
var display_width = display_get_width();
var display_height = display_get_height();
var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;

window_set_position((display_width / 2) - (window_width / 2), (display_height / 2) - (window_height / 2));

//Mouse Previous
mouse_x_previous = device_mouse_x_to_gui(0);
mouse_y_previous = device_mouse_y_to_gui(0);




