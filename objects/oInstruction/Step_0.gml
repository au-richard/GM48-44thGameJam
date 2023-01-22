/// @description Insert description here


//Progress Text
letters += spd;
text = string_copy(instructionString, 1, floor(letters));

//Next Line
if ((letters >= length)) {
	if (currentline + 1 == array_length_1d(instructionString)) {
		currentline++;
		letters = 0;
		length = string_length(instructionString);
	} 
}




