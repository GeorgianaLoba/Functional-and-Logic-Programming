% a. Write a predicate to compute the union of two sets.
% b. Write a predicate to determine the set of all the pairs of elements in a list.
% Eg.:L = [a b c d] =>[[a b] [a c] [a d] [b c] [b d] [c d]].


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


%Function that concatenates 2 lists
% (A:list, B:list, R:list)
% (i, i, o)

concatenate([], B, B).
concatenate([H|T], B, [H|R]):- concatenate(T, B, R).

%Function that computes the union of 2 sets
%(A:list, B:list, R:list)
%(i, i, o)

setUnion(A,B,R):- setDiff(A, B, P), concatenate(P,B, R).


%b

%Function that computes recursively the subsets with N number of
%elements of the given set
%(L:list, E:element, R:element)
%(i, i, o)

pairsAux([], 0, []).
pairsAux([H|T], N, [H|R]):- N1 is N-1, pairsAux(T,N1, R).
pairsAux([_|T], N, R):- pairsAux(T, N, R).

%Function that computes all the pairs with the elements of the given set
%(L:list, R:list)
%(i, o)

pairs(L, R):- findall(K, pairsAux(L, 2, K), R).
