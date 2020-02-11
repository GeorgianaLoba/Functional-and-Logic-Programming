% a. Write a predicate to determine the difference of two sets.
% b. Write a predicate to add value 1 after every even element from a
% list.


%a

%Function that checks if a list contains a given element
%(L:list, E:element)
%(i, i)

contains([H|_], E):- H=:=E.
contains([_|T], E):- contains(T, E).

% Function that computes the set difference
% (A-B = elems in A and not in B)
% (A:list, B:list, R:list)
% (i, i, o)

setDiff([], _, []).
setDiff([H|T], B, [H|R]):- \+ contains(B, H), !, setDiff(T, B, R).
setDiff([H|T], B, R):- contains(B, H),!, setDiff(T, B, R).


%b


addOnes([], []).
addOnes([H|T], [H|R]):- mod(H,2)=:=1,!, addOnes(T, R).
addOnes([H|T], [H,1|R]):- mod(H,2)=:=0,!, addOnes(T, R).




