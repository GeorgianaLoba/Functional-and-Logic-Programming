% a. Write a predicate to remove all occurrences of a certain atom from
% a list
% b.Define a predicate to produce a list of pairs (atom n) from
% an initial list of atoms. In this initial list atom has n
% occurrences. Eg.:numberatom([1, 2, 1, 2, 1, 3, 1], X) => X =[[1, 4],
% [2, 2], [3, 1]]

%a

%Function that removes all occurences of an element from a list.
%(L:list, E:element, R:list)
%(i, i, o)

remOcc([],_,[]).
remOcc([H|T], E, R):- H=:=E,!, remOcc(T, E, R).
remOcc([H|T], E, [H|R]):- H=\=E,!, remOcc(T, E, R).


%b

% Function that counts the number of occurences of an element from a
% list.
% (L:list, E:element, R:element)
% (i, i, o)

nrOcc([],_,0).
nrOcc([H|T],E, R):- H=:=E,!, nrOcc(T, E, RR), R is RR+1.
nrOcc([H|T],E, R):- H=\=E, !, nrOcc(T, E, R).


%Function that creates a list of lists [element, nrOccElem]
%(L:list, R:list)
%(i, o)

makePairs([], []).
makePairs([H|T],[[H, P]|R]):- nrOcc([H|T], H, P), remOcc(T, H, RR), makePairs(RR, R).
