% Recursividad con listas

posee(juan,[vidrio, computadora]).
posee(victoria,[lentes]).
posee(tomas,[botella, papel, termo, mate]).

fecha(termo,2022).
fecha(mate,2023).
fecha(papel,2021).
fecha(botella,2020).

fecha(vidrio,2020).
fecha(computadora,2023).

fecha(lentes,1990).

head([X|_],X).

ultimo([X],X). % si hay solo un elemento en la lista, ese mismo es el ultimo

ultimo([_|Lista],Ultimo) :-
    ultimo(Lista,Ultimo).

cosasOrdenadas(Persona) :-
    posee(Persona, Cosas),
    estanOrdenadasPorFechas(Cosas).

estanOrdenadasPorFechas([]). % CASO BASE, si la lista esta vacia
estanOrdenadasPorFechas([_]). % CASO que la lista tenga un solo elemento
estanOrdenadasPorFechas([Primero|XS]) :-
    fecha(Primero,F), % agarro la fecha del primero
    head(XS,Segundo), % agarro al 2do elemento de la lista
    fecha(Segundo,FechaDelSegundo), % agarro la fecha del segundo
    F =< FechaDelSegundo,
    estanOrdenadasPorFechas(XS). % RECURSIVO (pero ahora lo analizo a partir del 2do elemento)

% Recursividad sin listas

tiene(juan,vidrio,3).
tiene(juan,computadora,1).
tiene(nahuel,computadora,5).
tiene(nahuel,computadora,15).
tiene(nahuel,lentes,3).
tiene(victoria,lentes,8).
tiene(mica,lentes,89).

tiene(lentes,vidrio,2).
tiene(vidrio,arena,45).
tiene(computadora,cpu,1).
tiene(cpu,cobre,1).
tiene(cpu,oro,1).
tiene(computadora,pantalla,1).
tiene(pantalla,vidrio,20).

contiene(Algo,Elemento) :-
    tiene(Algo,Elemento,_).

contiene(Algo,Elemento) :-
    tiene(Algo,Intermedio,_),
    contiene(Intermedio,Elemento).

% Elemplos de listas

pasa(medrano,[151,109,160]).

colectivoFacu(Linea) :-       % la linea es de un colectivo de la facu, si la linea pasa por medrano
    pasa(medrano,ListaLineas),
    member(Linea, ListaLineas).
    
esUnaPersona(juan).
esUnaPersona(nahuel).
esUnaPersona(mica).
esUnaPersona(victoria).

cantidadCosasQueTiene(Alguien,C,Cantidad) :-
    esUnaPersona(Alguien),
    tiene(_,C,_),
    findall(C,tiene(Alguien,C,_),L),
    length(L, Cantidad).
    
