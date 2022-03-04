%CECS 342 Sec 5
%Assignment 4

:- dynamic i_am_at/1, at/2, holding/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).

%starting location 
i_am_at(bridge).

% connecting rooms together 
% map of rooms:
% closet			store
% house 	beach		garden 
%		bridge
% 		cave
%		school		door 		secret

path(bridge, n, beach).
path(beach, s, bridge).

path(cave, s, school).
path(school, n, cave).

% incomplete object, need wood to finish the bridge
path(bridge, s, cave) :- holding(wood).
path(bridge, s, cave) :- 
	write('You can not cross the bridge until you finish building the bridge! Dont wanna die already do ya?'), nl, 
	fail.
path(cave, n, bridge).

% locked door, need badge to open it 
path(school, e, door) :- holding(badge).
path(school, e, door) :- 
	write('You need a badge to open that door missy.'), nl, 
	fail.
path(door, w, school).

path(door, e, secret).
path(secret, w, door).


path(beach, e, garden).
path(garden, w, beach).

path(garden, n, store).
path(store, s, garden).

path(beach, w, house).
path(house, e, beach).

% locked door, need key to open door
path(house, n, closet) :- holding(key).
path(house, n, closet) :- 
	write('The door appears to be locked. Oh gosh darn it.'), nl, 
	fail.
path(closet, s, house).

%where things are located.
at(flashlight, beach).
at(wood, store).
% hidden object, key is in the secret room.
at(key, secret).
at(blue_gem, closet).
at(yellow_gem, house).
at(red_gem, secret).
at(green_gem, cave).
at(badge, garden).

% how to pick up an object 
take(X) :-
        holding(X),
        write('You''re already holding it!'),
        !, nl.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(holding(X)),
        write('OK.'),
        !, nl.

take(_) :-
        write('I don''t see it here.'),
        nl.


% These rules describe how to put down an object.
drop(X) :-
        holding(X),
        i_am_at(Place),
        retract(holding(X)),
        assert(at(X, Place)),
        write('OK.'),
        !, nl.

drop(_) :-
        write('You aren''t holding it!'),
        nl.


%These rules define the direction letters as calls to go/1.

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


% This rule tells how to move in a given direction.

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('You can''t go that way.').


%This rule tells how to look about you.

look :-
        i_am_at(Place),
        nl,
        notice_objects_at(Place),
        nl,
	describe(Place), nl.


/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).


/* This rule tells how to die. */

die :-
        finish.

% how to see what player is currently holding 
i :-
        holding(X),	
	write('You are currently holding a '),
	write(X), nl.



/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('The game is over. Please enter the "halt." command.'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.             -- to start the game.'), nl,
        write('n.  s.  e.  w.     -- to go in that direction.'), nl,
        write('take(Object).      -- to pick up an object.'), nl,
        write('drop(Object).      -- to put down an object.'), nl,
        write('look.              -- to look around you again.'), nl,
        write('instructions.      -- to see this message again.'), nl,
	write('i. 		   -- to see what you are holding currently.'), nl, 
        write('halt.              -- to end the game and quit.'), nl,
        nl.


/* This rule prints out instructions and tells where you are. */

start :-
        instructions,
        look. 


/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

% describing bridge
describe(bridge) :- 
	write('You are at the bridge. To the north is a beach; '), nl,
	write('to the south is a cave. Your assignment is to find the '), nl,
	write('right gem and a carry it into the garden in order to buy your freedom. '), nl,
	write('You need make sure its the right gem cause you only get one chance and if you mess it up, well, lets just say its not going to end well for one of you.'), nl.

% describing beach
describe(beach) :- 
	write('You are at the beach. To the east is the garden; '), nl,
	write(' to the west is a house; to the south is the bridge. In the sand is what appears to a flashlight.'), nl.

% describing cave
describe(cave) :- 
	write('You made it to the cave. Congrats on not being found yet. '), nl,
	write('To the south is a school; to the north the bridge. '), nl,
	write('A green gem glistens in the darkness.'), nl.

% describing house
describe(house) :- 
	write('You are at the house. The beach is to the east. There appears to be a closet in the northern part of the house.'), nl,
	write('A yellow gem is also there.'), nl.

% describing closet when holding key to unlock door
describe(closet) :- 
	holding(key),
	write('You unlocked the door. There sits a blue gem.'), nl.

%describing garden if bring flashlight into it
describe(garden) :-
	holding(flashlight),
	write('Youre literally outside in the day time why do you need a flashlight.'), nl,
	write('Next time make better choices ey?'), nl,
	finish. 

% limited resource - only one chance to get correct gem
% describing garden when holding wrong gem 
describe(garden) :-
	holding(red_gem),
	write('Its not the right gem! You turn to go back to find another gem but the scary man found you first :(.'), nl,
	finish.

% describing garden when holding wrong gem 
describe(garden) :-
	holding(green_gem),
	write('Its not the right gem! You turn to go back to find another gem but the scary man found you first :(.'), nl,
	finish.

% describing garden when holding wrong gem 
describe(garden) :-
	holding(yellow_gem),
	write('Its not the right gem! You turn to go back to find another gem but the scary man found you first :(.'), nl,
	finish.

% describing garden when holding right gem 
describe(garden) :-
	holding(blue_gem),
	write('You presented the correct gem. Your freedom has been granted. '), nl,
	write('CONGRATULATIONS, this time you bested me.'), nl, 
	finish.

% describing garden normally
describe(garden) :- 
	write('You are at the garden. To the north is a store; to the west is the beach.'), nl,
	write('The scary mans badge is here.'), nl.

% describing store
describe(store) :- 
	write('You are at the store. To the south is the garden. '), nl,
	write('This store only has wood in it. Weird, but helpful.'), nl.

% describing school
describe(school) :- 
	write('You are at the school (ew). Its summmer and even though you were kidnapped and are trying to escape, being at school in the summertime is ew.'), nl,
	write('To the north is the cave; on the eastside (go wildcats) of the school is a door.'), nl.

% describing door when holding badge to unlock it 
describe(door) :- 
	holding(badge),
	write('You unlocked the door!'), nl.

% describing door
describe(door) :-
	write('Door is locked.'), nl.

% describing secret room
describe(secret) :- 
	write('You are at the secret room. Inside the room is the red gem and a key.'), nl.

