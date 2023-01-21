/// @description Insert description here
/*
for (var i = 0; i < instructionText.length ; i++) {
	DrawSetText(c_black, fMenu, fa_center, fa_top);
	draw_text(RES_W * 0.5 + 2, RES_W * 0.3 + y_offset, text);
	draw_set_color(c_white);
	draw_text(RES_W * 0.5, RES_W * 0.3 + 5, instructionText[i]);
	//draw_text(x, y + y_offset, text);
	y_offset += 20;
}
*/



if (index < instructionText.length) {
	index++;
	DrawSetText(c_black, fMenu, fa_center, fa_top);
	draw_text(RES_W * 0.5 + 2, RES_W * 0.3 + y_offset, text);
	draw_set_color(c_white);
	draw_text(RES_W * 0.5, RES_W * 0.3 + 5, instructionText[i]);
	//draw_text(x, y + y_offset, text);
	y_offset += 20;
} else {
	exit;
}


