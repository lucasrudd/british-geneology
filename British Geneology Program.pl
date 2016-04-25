% Author: Lucas Rudd
% Date: 4/21/2016

%Database
married('Victoria','Albert').
married('Alexandra of Denmark','Edward VII').
married('Mary of Teck','George V').
married('Elizabeth Bowes-Lyon','George VI').
married('Elizabeth II','Philip Duke of Edinburgh').


parent('Edward VII','Albert').
parent('George V','Edward VII').
parent('Edward VIII','George V').
parent('George VI','George V').
parent('Elizabeth II','George VI').

%Facts
parent(X,Y)       :- married(Y,Z), parent(X,Z).
child(X,Y)        :- parent(Y,X).
sibling(X,Y)      :- parent(X,Z),  parent(Y,Z), not(X = Y).

%Recursive facts
ancestor(X,Y)     :- parent(X,Y).
ancestor(X,Y)     :- parent(X,Z), ancestor(Z,Y).
decendant(X,Y)    :- child(X,Y).
decendant(X,Y)    :- child(X,Z), decendant(Z,Y).


%Main
my_write(W,X,Y,Z) :- write(W,X),write(W,Y),writeln(W,Z).

divider(X,Y)      :- writeln(X,''),writeln(X,Y),writeln(X,'').

program :-
    open('output.txt',write, Stream),
    divider(Stream, 'Ancestors'),
    forall(ancestor(Child,Parent), my_write(Stream, Parent, ' is the ancestor of: ', Child)),
    divider(Stream,'Decendants'),
    forall(decendant(Parent,Child), my_write(Stream, Child, ' is the decendant of: ', Parent)),
    divider(Stream,'Spouse'),
    forall(married(Wife,Husband), my_write(Stream, Wife, ' is the wife of: ', Husband)),
    divider(Stream, 'Siblings'),
    forall(sibling(Sibling1,Sibling2), my_write(Stream, Sibling1, ' is the sibling of: ', Sibling2)),
    close(Stream).