% CECS 342 
% Assignment 3
-module(studentsAndCandy).
-export([candy/4]).

%% A = number of candy student A
%% B =  number of candy student B
%% C = number of candy student C
%% N = number of turns
candy(A,B,C,N) ->
    if N =/= 0 ->
        % gets how much candy each student is giving away 
        GA = A div 2,
        GB = B div 2,
        GC = C div 2,
        % takes original amount of candy, subtracts what giving away and adds what getting from player C
        TA =  A - GA + GC,
        % if A has odd number, gets candy from teacher
        if TA rem 2 /= 0 ->
            NA = TA + 1;
        true ->
            NA = TA
        end,
        % takes original amount of candy, subtracts what giving away and adds what getting from player A
        TB = B - GB + GA,
        % if B has odd number, gets candy from teacher
        if TB rem 2 /= 0 ->
            NB = TB + 1;
        true ->
            NB = TB
        end,
        % takes original amount of candy, subtracts what giving away and adds what getting from player B
        TC = C - GC + GB,
        % if C has odd number, gets candy from teacher
        if TC rem 2 /= 0 ->
            NC = TC + 1;
        true ->
            NC = TC
        end,
        % reduces moves left
        M = N - 1,
        % writes out how many candy each player has
        io:fwrite("Student A's Candy Count: ~w~n", [NA]),
        io:fwrite("Student B's Candy Count: ~w~n", [NB]),
        io:fwrite("Student C's Candy Count: ~w~n", [NC]),
        % if all players have same amount of candy 
        if NA == NB ->
            if NB == NC ->
                % ends
                io:fwrite("Remaining Moves: ~w~n", [M]),
                io:fwrite("Everyone has the same amount of candy!!~n");
            % else, keep going
            true ->
                io:fwrite("Remaining Moves: ~w~n", [M]),
                candy(NA,NB,NC,M)
            end;
        % if players dont have same amount of candy and still have moves left, keep going 
        true ->
            io:fwrite("Remaining Moves: ~w~n", [M]),
            candy(NA,NB,NC,M)
        end;
    % no moves left 
    true ->
        io:fwrite("Game Over~n")
    end.


    
