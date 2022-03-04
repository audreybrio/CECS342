% CECS 342 Sec 5
% Assignment 4

%rules
%who
name(ms_barrada).
name(ms_gort).
name(mr_klatu).
name(mr_nikto).

%when
day(tuesday).
day(wednesday).
day(thursday).
day(friday).

%saw what
spot(balloon).
spot(clothesline).
spot(frisbee).
spot(water_tower).

%main part to solve logic puzzles
solve :-
    %who
    name(MsBarrada), name(MsGort), name(MrKlatu), name(MrNikto),
    all_different([MsBarrada, MsGort, MrKlatu, MrNikto]),
    
    %saw what 
    spot(BarradaSpot), spot(GortSpot), spot(KlatuSpot), spot(NiktoSpot),
    all_different([BarradaSpot, GortSpot, KlatuSpot, NiktoSpot]),

   % different options 
    Triples = [ [MsBarrada, tuesday, BarradaSpot],
                [MsGort, wednesday, GortSpot],
                [MrKlatu, thursday, KlatuSpot],
                [MrNikto, friday, NiktoSpot] ],

	% logic puzzles from guide
    % 1. Mr. Klatu made his sighting at some point earlier in the week than the one
	% who saw the balloon, but at some point later in the week than the one 
	% who spotted the frisbee (who isnt Ms. Gort). 

        earlier([mr_klatu, _, _],[_,_,balloon], Triples),
        earlier([_, _, frisbee], [mr_klatu,_,_], Triples),
       \+ member([mr_klatu, _, balloon], Triples),
       \+ member([mr_klatu, _, frisbee], Triples),
       \+ member([ms_gort, _, frisbee], Triples),
	\+ member([mr_klatu, friday, _], Triples),
	\+ member([mr_klatu, tuesday,_], Triples),

    % 2. Friday's sighting was made by either Ms. Barrada or the one who saw
	% a clothesline (or both).

    ( (member([ms_barrada, friday, _], Triples)) ;
       
      (member([_, friday, clothesline], Triples));

       (member([ms_barrada, friday, clothesline], Triples)) ),
	
    % 3. Mr. Nikto did not make his sighting on tuesday 
        \+ member([mr_nikto, tuesday, _], Triples),
  
    % 4. Mr. Klatu isnt the one whose object turned out to be a water tower
        \+ member([mr_klatu, _, water_tower], Triples),

    % write out who saw what when 
    tell(MsBarrada, tuesday, BarradaSpot),
    tell(MsGort, wednesday, GortSpot),
    tell(MrKlatu, thursday, KlatuSpot),
    tell(MrNikto, friday, NiktoSpot).

% Succeeds if all elements of the argument list are bound and different.
% Fails if any elements are unbound or equal to some other element.
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).

% first input is before second input
% succeeds if first elemenet happens earlier than second
% fails if it doesnts or elements are unbound
earlier(X, _, [X | _]).
earlier(_, Y, [Y | _]) :- !, fail.
earlier(X, Y, [_ | T]) :- earlier(X, Y, T). 

%writing out solution 
tell(X, Y, Z) :-
    write('On '), write(Y), write(', '), write(X),
    write(' actually spotted a '), write(Z), write('.'), nl.