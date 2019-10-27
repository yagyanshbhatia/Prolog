% facts stating the menu status with thier encodings
menu(hungry,1,1,1).
menu(notSoHungry,1,1,0).
menu(notSoHungry,0,1,1).
menu(diet,1,0,0).
menu(diet,0,1,0).
menu(diet,0,0,1).

% menu - starters
items(starter, cornTikki, 30).
items(starter, tomatoSoup, 20).
items(starter, chilliPaneer, 40).
items(starter, crispyChicken, 40).
items(starter, papdiChat, 20).
items(starter, coldDrink, 20).

% menu - main dish
items(main, kadhaiPannerWithButterPlainNaan, 50).
items(main, vegKormaWithButterPlainNaan, 40).
items(main, murghLababdarWithButterPlainNaan, 50).
items(main,vegDumBiryaniWithDalTadka, 50).
items(main, steamRiceWithDalTadka, 40).

% menu - dessert
items(dessert, iceCream, 20).
items(dessert, malaiSandwich, 30).
items(dessert, rasmalai, 10).

% rule to find all possible menu items incase the person is hungry
% nested loop among items from starter, main & dessert
find_items(hungry,1,1,1) :- items(starter,A,_),items(main,M,_),items(dessert,X,_),write('Items:'),nl,write(A),nl,write(M),nl,write(X).

% rule to find all possible menu items incase the person is notSoHungry
% nested loop among items from (starter & main) or (main & dessert) with their calorie sum less than 81
find_items(notSoHungry,1,1,0) :- items(starter,A,X),items(main,M,Y),X+Y<81,write('Items:'),nl,write(A),nl,write(M).
find_items(notSoHungry,0,1,1) :- items(main,A,X),items(dessert,M,Y),X+Y<81,write('Items:'),nl,write(A),nl,write(M).

% rule to find all possible menu items incase the person is on diet
% call get_items
find_items(diet,1,0,0) :- get_items(diet,1,0,0,40,[]).
find_items(diet,0,1,0) :- get_items(diet,0,1,0,40,[]).
find_items(diet,0,0,1) :- get_items(diet,0,0,1,40,[]).

% recursively returns all possible item combinations with calorie sum less than Z
get_items(diet,1,0,0,Cal,Z) :- items(starter,X,Y), Y=<Cal, not(member(X,Z)), append([X],Z,A), writeln(A), New is Cal-Y, get_items(diet,1,0,0,New,A).
get_items(diet,0,1,0,Cal,Z) :- items(main,X,Y), Y=<Cal, not(member(X,Z)), append([X],Z,A), writeln(A), New is Cal-Y, get_items(diet,0,1,0,New,A).
get_items(diet,0,0,1,Cal,Z) :- items(dessert,X,Y), Y=<Cal, not(member(X,Z)), append([X],Z,A), writeln(A), New is Cal-Y, get_items(diet,0,0,1,New,A).