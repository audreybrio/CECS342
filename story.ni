"CECS323-Assignment1" by audreybrio
[creating rooms]
The red room is a room. The description of the red room is "Welcome to the red room.".
The blue room is a room.  "Welcome to the blue room".
The green room is a room. "Welcome to the green room".
The yellow room is a room."Welcome to the yellow room".
The freedom is a room. "FREEEEDOMMMMMM".

[creating door that is locked and need to open to win game]
[locked door]
Wooden Door is a door. Wooden door is closed and locked. Wooden door can be locked or unlocked. Wooden Door can be open or closed.

[red room is connected to blue room]
The door to the red room is south of the red room and north of the blue room. 

[objects in the red room]
[contains one number needed for the combo]
The red room contains a bed. The bed is fixed in place. There are four stuffed animals on the bed.
The red room contains rug. 
[other half of incomplete object]
A desk is here. There is a candle on the desk. It is unlit. An openable container called the drawer is part of the desk. The drawer is closed. In the drawer is a battery. 
Instead of opening the desk:
	try opening the drawer. 
Instead of closing the desk:
	try closing the drawer. 

[blue room connected to green room]
The door to the blue room is east of the blue room and west of the green room. 

[blue room has final door needed to escape]
The wooden door is south of the blue room and north of the freedom.  

[objects in blue room]
[contains one number needed for the combo]
The blue room contains a circular table. The blue room contains a chair. There is a carving of the number 0 in the chair. There is a stack of five books on the table.

[green room connected to yellow room]
The door to the green room is north of the green room and south of the yellow room. 

[objects in green room]
[contains one number needed for the combo]
[hidden object]
The green room contains a safe. The safe is a closed, locked container. "A safe is placed in the corner of the room. It has a keypad on it and requires a 4-digit combination to open. It's important to know the correct order of the numbers, you only get one shot at it."
The safe has a number called the combo. The combo of the safe is 0342. 
[how to text it while playing game]
Entering on it is an action applying to one number and one thing. Understand "Enter [a number] on [something]" as entering on it. Understand "keypad" as safe.
Check entering on it: 
	if the second noun is not the safe:
		say "[The second noun] doesn't open." instead;
Carry out entering on it: 
	if the number understood is the combo of the safe: 
		now the second noun is unlocked;
[if get it right, it opens, it get it wrong, game ends]
Report entering on it:
	if the second noun is unlocked:
		say "The lock clicks unlocked and opens slightly";  
	otherwise: 
		[limited resource]
		end the story finally;
		say "Imagine not being able to figure out the combination to the safe. Couldn't be me. Anyways, better luck next time."
[key is hidden in the safe, this key unlocks the wooden door]
The safe contains a silver key. The silver key unlocks the wooden door. 
The green room contains a portrait of a beach on the wall.
The green room contains a portrait of a mountain on the wall.
The green room contains a portrait of a desert on the wall.
The green room contains a mirror. 

[yellow room connected to red room]
The door to the yellow room is west of the yellow room and east of the red room. 

[objects in the yellow room]
[contains one number needed for the combo]
The yellow room contains a window.
The yellow room contains a pair of shoes. 
The yellow room contains a backpack. The backpack is openable and closed. In the backpack is a flashlight. The flashlight is a container. The flashlight can be switched on. The flashlight can be switched off.
[incomplete object]
A flashlight can hold one battery.
[if try to turn on flashlight and no battery, then you need to turn flashlight back off]
Check switching on the flashlight:
	if flashlight does not contain battery:
		say "Missing battery, Must turn off flashlight";
Carry out switching on the flashlight:
	if flashlight contains a battery:
		now the flashlight is lit;	
[if complete missing object, gives hint]		
Report switching on the flashlight:
	if the flashlight is lit:
		say "You happen to shine the flashlight directly at the wall where a secret message was written. It says, 'Alright, I'll give you a hint: Don't worry to much about the greatest of them all, they're just here for moral support.'"
Carry out switching off the flashlight:
	now the flashlight is unlit.

[ending the game]			
After opening wooden door:
	end the story finally;
	say "You managed to escape this time, next time you might not be as lucky."



