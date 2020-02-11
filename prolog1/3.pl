% a. Define a predicate to remove from a list all repetitive elements.
% Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
% b. Remove all occurrence of a maximum value from a list on integer
% numbers.


%a

%Function that checks if an elem is in a list.
%(L:list, E:element)
%(i, i)

contains([H|_], E):-H=:=E.
contains([_|T], E):-contains(T,E).

%Function that removes all occurences of a given element.
%(L:list, E:element, R:list)
%(i, i, o)

remOcc([],_,[]).
remOcc([H|T],E, R):- H=:=E,!, remOcc(T, E,R).
remOcc([H|T], E, [H|R]):- H=\=E,!,remOcc(T, E, R).

%Function that removes from a list all repetitive elements
%(L:list, R:list)
%(i, o)

removeRepetitive([], []).
removeRepetitive([H|T], R):- contains(T, H),!, remOcc(T,H,RR), removeRepetitive(RR, R).
removeRepetitive([H|T], [H|R]):- \+ contains(T, H), !, removeRepetitive(T, R).


%b

%Function that computes the maximum of a list
%(L:list, R:element)
%(i, o)

findMaximum([H],H).
findMaximum([H|T], H):-findMaximum(T, R), H>=R.
findMaximum([H|T], R):- findMaximum(T, R), H<R.

%Function that removes all occurences of a given element
%(L:list, E:element, R:list)
%(i, i, o)

remOcc([],_, []).
remOcc([H|T], M, R):- H=:=M,!,remOcc(T, M, R).
remOcc([H|T], M, [H|R]):- H=\=M,!, remOcc(T, M, R).

%Function that computes the maximum of a list and then removes all
%its occurences from that list
%(L:list, R:list)
%(i, o)

removeMaximum(L, R):- findMaximum(L, M), remOcc(L, M, R).
