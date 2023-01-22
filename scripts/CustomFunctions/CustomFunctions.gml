// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ScreenPause(){
	if (instance_exists(oScreenPause)) {
		image_speed = 0;
		speed = 0; // for bat
		return true;
	} else {
		image_speed = 1;
		speed = 2; // for bat
		return false;
	};
};