/// @description Adds initial wait to avoid bugs

//Store number of players
numberOfChars = instance_number(Obj_AttackSystem);

//Calculate space in between each damage bar
barGapSize = display_get_gui_width() - (barWidth * numberOfChars);
barGapSize = barGapSize / (numberOfChars + 1);

//Activates all other code
initialWaitOver = true;