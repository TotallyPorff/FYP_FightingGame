/// @description Adds initial wait to avoid bugs

//Store number of players
numberOfChars = instance_number(Obj_AttackSystem);

//Grabs ID of all characters in the level
for (var i = 0; i < numberOfChars; i++) {
	IDToAdd = instance_find(Obj_AttackSystem, i);
	ds_list_add(playerIDList, IDToAdd);
}

//Calculate space in between each damage bar
barGapSize = display_get_gui_width() - (barWidth * numberOfChars);
barGapSize = barGapSize / (numberOfChars + 1);

//Activates all other code
initialWaitOver = true;