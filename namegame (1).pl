:- dynamic letter/1.

% Start with the letters a, b, c
start :-
    retractall(letter(_)),
    assertz(letter(a)),
    assertz(letter(b)),
    assertz(letter(c)),
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

% 1: display
do(1) :- !, show_letters, menu.

% 2: add a letter (at the end)
do(2) :- !,
    write('Enter the letter: '), nl,
    read(L),
    assert(letter(L)),
    menu.

% 3: add at the top
do(3) :- !,
    write('Enter the letter: '), nl,
    read(L),
    asserta(letter(L)),
    menu.

% 4: add at the bottom
do(4) :- !,
    write('Enter the letter: '), nl,
    read(L),
    assertz(letter(L)),
    menu.

% 5: delete a letter
do(5) :- !,
    write('Enter the letter: '), nl,
    read(L),
    (   retract(letter(L))
    ->  write('Deleted.'), nl
    ;   write('That letter is not in your set.'), nl
    ),
    menu.

% 6: delete all letters
do(6) :- !,
    retractall(letter(_)),
    write('All letters deleted.'), nl,
    menu.

% 7: exit
do(7) :- !,
    write('Goodbye!'), nl.

do(_) :-
    write('Invalid choice, try again.'), nl,
    menu.

% Display with a fail loop
show_letters :-
    write('Your current set of letters:'), nl,
    letter(X),
    write(X), tab(1),
    fail.
show_letters :- nl.
