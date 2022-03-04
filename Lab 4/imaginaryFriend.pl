% CECS 342 Sec 5
% Assignment 4

%rules
%imaginary friend
friend(grizzly_bear).
friend(moose).
friend(seal).
friend(zebra).

%who
kid(joanne).
kid(lou).
kid(ralph).
kid(winnie).

%story
ride(circus).
ride(rock_band).
ride(spaceship).
ride(train).

%main part to solve logic puzzle
solve :-
    %who
    friend(JoanneFriend), friend(LouFriend), friend(RalphFriend), friend(WinnieFriend),
    all_different([JoanneFriend, LouFriend, RalphFriend, WinnieFriend]),
    
    %story 
    ride(JoanneRide), ride(LouRide), ride(RalphRide), ride(WinnieRide),
    all_different([JoanneRide, LouRide, RalphRide, WinnieRide]),

    %differnet options can be 
    Triples = [ [joanne, JoanneFriend, JoanneRide],
                [lou, LouFriend, LouRide],
                [ralph, RalphFriend, RalphRide],
                [winnie, WinnieFriend, WinnieRide] ],

     %logic puzzles from guide 
    % 1. The seal (who isnt the creation of either Joanne or Lou) neither
	% rode to the moon in a spaceship or took a trip arount the world 
	% on a magic train 
       \+ member([joanne, seal, _], Triples),
       \+ member([lou, seal, _], Triples),
       \+ member([_, seal, spaceship], Triples),
       \+ member([_, seal, train], Triples),

    % 2. Joannes imaginary friend (who isnt the grizzly bear) went to the circus.
        \+ member([joanne, grizzly_bear, _], Triples),
        member([joanne, _, circus], Triples),
	
    % 3. Winnies imaginary friend is a zebra.
        member([winnie, zebra, _], Triples),
  
    % 4. The grizzly bear didnt board the spaceship to the moon.
        \+ member([_, grizzly_bear, spaceship], Triples),

    % write out who wrote about what imaginary friend doing what 
    tell(joanne, JoanneFriend, JoanneRide),
    tell(lou, LouFriend, LouRide),
    tell(ralph, RalphFriend, RalphRide),
    tell(winnie, WinnieFriend, WinnieRide).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

%final writing out of solution 
tell(X, Y, Z) :-
    write(' '), write(X), write(' wrote a story about their imaginary friend, the '), write(Y),
    write(', who had a '), write(Z), write(' adventure.'), nl.