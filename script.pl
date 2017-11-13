:- initialization(main).

main :- 
consult('/Users/Harrison/Desktop/tree.pl'),
consult('/Users/Harrison/Desktop/queries.pl').

query :-

	writeln("People that have nthcousinkremoved(2, 1, Y, X):"),
	findall(Person, nthcousinkremoved(2, 1, Person,_), People),
	forall(member(P, People), writeln(P)),

	writeln(" "),
	writeln("Every member's 1st child (includes duplicates for each parent of a child):"),
	findall(Parent, kthchild(1, _, Parent), Parents),
	forall(member(P, Parents), writeln(P)).