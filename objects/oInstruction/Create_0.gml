/// @description Insert description here
/*
endtext[0] = "W to Jump";
endtext[1] = "A to Move Left";
endtext[2] = "D to Move Right";
endtext[3] = "Mouse Left Click to Fire Weapon";
endtext[4] = "Shift to Switch Weapon";
endtext[5] = "Mouse Middle Click to Drag Camera Panning";
endtext[6] = "Objective of the Game:";
endtext[7] = "Reach your human body at the top while killing or avoiding monsters along the way!";
*/

instructionText = [];
array_push(instructionText, 
"W to Jump", 
"A to Move Left", 
"D to Move Right", 
"Mouse Left Click to Fire Weapon", 
"Shift to Switch Weapon",
"Mouse Middle Click to Drag Camera Panning",
"Objective of the Game:",
"Reach your human body at the top while killing or avoiding monsters along the way!"
);
index = 0;
y_offset = 0;
spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(instructionText[currentline]);
text = "";


/*
sentences = ds_list_create();
ds_list_add(sentences, 
"W to Jump", 
"A to Move Left", 
"D to Move Right", 
"Mouse Left Click to Fire Weapon", 
"Shift to Switch Weapon", 
"Mouse Middle Click to Drag Camera Panning",
"Objective of the Game:",
"Reach your human body at the top while killing or avoiding monsters along the way!"
);

index = 0;
randomize();
var i = ds_list_size(sentences) - 1;
sentence = ds_list_find_value(sentences, i);
var interval = random_range(0.08, 0.15);
*/



