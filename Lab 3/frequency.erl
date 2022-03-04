% CECS 342 
% Assignment 3
-module(frequency).
-export([one/1, two/2, three/1, four/1]).

% method one 
one(F) ->
    % opens files
    {ok, D} = file:open(F,read),
    % reads in file
    L1 = io:get_line(D, ''),
    % makes it all lowercase
    C = string:lowercase(L1),
    % removes nonalphanumeric chars and splits it into a list of words
    L = string:split(re:replace(C, "[^A-za-z]"," ",[global, {return, list}]), " ", all),
    A = lists:filter(fun(X) -> X /= [] end, L).
    %io:fwrite("~w~n",[A]).



%% method 2
two(W, T) ->
    % true if word is in list, false if word is not in list 
    Val = lists:keyfind(W,1,T),
    % if word not in list 
    if Val == false ->
        % if the list comparing to is empty, to allow for answer to be a list 
        if length(T) == 0 ->
            % add it to the list 
            A = [{W,1}];
        % if other words are in the list, just not the word looking for 
        true ->
            % add it to list with frequency 1
            B = [{W,1}],
            A = lists:append(T, B)
        end;
        % if word looking for is in list, update frequency 
        true ->
            % find the current frequency 
            Num = element(2,Val),
            % replace it with new frequency (1 more)
            A = lists:keyreplace(W,1,T,{W,Num+1})
        end,
    R = A.


% third method 
three(L) ->
    % create lists of words with their frequencies 
    A = help(L,1,[]).


%forth method 
four(F) ->
    % uses method one to open file and get list of words 
    L = one(F),
    % used method three to get all the frequencies of all the words on that list 
    H = three(L),
    % sorts words based on greatest to least frequency 
    S = lists:sort(fun({KeyA, ValA}, {KeyB, ValB}) -> {ValA, KeyA} >= {ValB, KeyB} end,H),
    % prints it out 
    io:fwrite("~p~n",[S]).


% function used for third method 
help(L,I,P) ->
    % goes length of list
    if I =< length(L) ->
        % gets ith word of the list  
        D = lists:nth(I, L),
        % gets frequency of word 
        T = two(D, P),
        %updates list 
        G = T,
        % updates iteration 
        R = I + 1,
        % goes until reaches end of list 
        help(L,R,G);
    true ->
        % returns complete list of words with frequencies 
        G = P
    end.



