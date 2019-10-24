menu(hungry,1,1,1).
menu(notSoHungry,1,1,0).
menu(notSoHungry,0,1,1).
menu(diet,1,0,0).
menu(diet,0,1,0).
menu(diet,0,0,1).

items(starter, cornTikki, 30).
items(starter, tomatoSoup, 20).
items(starter, chilliPaneer, 40).
items(starter, crispyChicken, 40).
items(starter, papdiChat, 20).
items(starter, coldDrink, 20).

items(main, kadhaiPannerWithButterPlainNaan, 50).
items(main, vegKormaWithButterPlainNaan, 40).
items(main, murghLababdarWithButterPlainNaan, 50).
items(main,vegDumBiryaniWithDalTadka, 50).
items(main, steamRiceWithDalTadka, 40).

items(dessert, iceCream, 20).
items(dessert, malaiSandwich, 30).
items(dessert, rasmalai, 10).

find_items(hungry,1,1,1) :- items(starter,A,_),items(main,M,_),items(dessert,X,_),write('Items:'),nl,write(A),nl,write(M),nl,write(X).

find_items(notSoHungry,1,1,0) :- items(starter,A,X),items(main,M,Y),X+Y<81,write('Items:'),nl,write(A),nl,write(M).
find_items(notSoHungry,0,1,1) :- items(main,A,X),items(dessert,M,Y),X+Y<81,write('Items:'),nl,write(A),nl,write(M).

find_items(diet,1,0,0) :- items(starter,X,Y),write('Items:'),nl,Y<41,write(X).
find_items(diet,1,0,0) :- items(starter,A,B),items(starter,X,Y),B+Y<41,A\=X,write('Items:'),nl,write(A),nl,write(X).

find_items(diet,0,1,0) :- items(main,X,Y),Y<41,write('Items:'),nl,write(X).

find_items(diet,0,0,1) :- items(dessert,X,Y),Y<41,write(X).
find_items(diet,0,0,1) :- items(dessert,A,B),items(dessert,X,Y),B+Y<41,A\=X,write('Items:'),nl,write(A),nl,write(X).
