%a Write a predicate to substitute an element from a list with another
%element in the list
%b Write a predicate to create te sublist(lm,...,ln) from the list
%(l1...lk)

%a

%subst(l1...ln, e1, e2) = l1=e1, e2+subst(l2...ln, e1, e2)
%                         l1!=e1, l1+subst(l2...ln, e1, e2)
%                         [], when n=0 (n is the length of the list)

%(list, number, number, list)
%(i, i, i, o)

subst([],_,_,[]).
subst([H|T], E1, E2, [E2|R]):- H=:=E1, subst(T, E1, E2, R).
subst([H|T], E1, E2, [H|R]):- H=\=E1, subst(T, E1, E2, R).


%b

%sublist(l1...ln, m, n, c)= c>=m, c<=n, l1+sublist(l2...ln, m, n, c++)
%                           c<m or c>n, sublist(l2...ln, m, n, c++)
%                           [], when n=0 (n is the length of the list)


%(list, number, number, number, list)
%(i, i, i, i, o)

sublist([], _, _, _,[]).
sublist([H|T], M, N, C, [H|R]):- C>=M, C<N+1, !, CC is C+1, sublist(T, M, N, CC,R).
sublist([_|T], M, N, C, R):- CC is C+1, sublist(T, M, N, CC, R).


%(i, i, i, o)

main(L, M, N, R):- sublist(L, M, N, 1, R).


