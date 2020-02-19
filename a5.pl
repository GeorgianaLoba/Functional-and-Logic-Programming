%For a list of integer number, write a function to generate the list
%of all subsets with at least N elements, each subset having sum of
%elements divisible with 3.
% e.g.: L=[2,3,4], N=1 =>[[3],[2,4],[2,3,4]] (not necessarily in this
% order)

%Function that computes the sum of the elems of a list
%(i, o)
sumElems([], 0).
sumElems([H|T], SS):- sumElems(T,S), SS is S+H.

%Function that generates all subsets of a list
%(i, o)
subsets([],[]).
subsets([H|T],[H|R]):-subsets(T,R).
subsets([_|T], R):-subsets(T,R).

%Function that computes the number of elems of a list
%(i, o)
nrElems([], 0).
nrElems([_|T],P):-nrElems(T,PP), P is PP +1.

% Function that filters a list of lists based on the number of elements
% (checking for subsets with at least N elems)
% (i,i,o)
filterSubsets([],_,[]).
filterSubsets([H|T], N, [H|R]):-nrElems(H, Z), Z>=N,!, filterSubsets(T,N,R).
filterSubsets([_|T],N,R):-filterSubsets(T,N,R).

%Function that filters a list of list over a property
%(i,o)
filterAgain([],[]).
filterAgain([H|T],[H|R]):-sumElems(H,S), mod(S,3)=:=0, !, filterAgain(T,R).
filterAgain([_|T],R):-filterAgain(T,R).

main(L, N,R):- findall(H, subsets(L,H), Z), filterSubsets(Z, N, ZZ), filterAgain(ZZ, R).
