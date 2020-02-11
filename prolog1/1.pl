%a. Write a predicate to determine the lowest common multiple of a list
%formed from integer numbers.
%b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th,
%... element in a list.


%a

%greatest common divisor of 2 elems
%(A:Element, B:element, R:element)
%(i, i, o)

gcd(A,B,A):-B=:=0,!.
gcd(A,B,R):-B=\=0,!,S is mod(A, B), gcd(B,S,R).


%lowest common multiple of 2 elems
%(A:Element, B: Element, R: Element)
%(i,i,o)


lcm(A,B,R):- RR is A*B, gcd(A, B, S), R is RR/S.

%lowest common multiple of a list
%(L:list, R:element)
%(i, o)

lcmList([H1,H2],R):-lcm(H1, H2, R).
lcmList([H|T],R):- lcmList(T, S), lcm(H, S, R).


%b

% Function that adds a given value on specific positions in a list (V is
% the value, P the position and K is the current index in the list)
%(L:list, V:element, P:element, K:element, R:list)
%(i,i,i,i,o)

addSpecificAux([], _, _,_, []).
addSpecificAux([H|T], V, P, K, [H, V|R]):- P=:=K,PP is P*2, KK is K+1,
    addSpecificAux(T, V, PP, KK, R).
addSpecificAux([H|T], V, P, K, [H|R]):- P=\=K, KK is K+1,
    addSpecificAux(T,V, P, KK, R).


%(i,i,o)
addSpecific(L, V, R):- addSpecificAux(L, V, 1,1, R).
