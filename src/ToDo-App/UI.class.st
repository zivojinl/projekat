Class {
	#name : #UI,
	#superclass : #Object,
	#instVars : [
		'stavkeLista',
		'addButton',
		'deleteButton',
		'stavkeListaMorph'
	],
	#category : #'ToDo-App'
}

{ #category : #initialization }
UI >> buildUI [
    | window |
    
    "Kreiraj novi prozor."
    window := SystemWindow new label: 'Task List'.
    window model: self.

    "Kreiraj listu zadataka za prikaz."
    stavkeListaMorph  := PluggableListMorph new.
     stavkeListaMorph
        list: stavkeLista tasks;  
        on: #displayStavku:on:;  
        selection: nil;  
        yourself.
        
    "Prikazi svaku stavku u listi koristeći displayStavku:on: metod."
    stavkeLista tasks do: [:task |
        self displayStavku: task on: stavkeListaMorph listMorph canvas.
    ].

    "Kreiraj dugme 'Dodaj Zadatak'."
    addButton := SimpleButtonMorph new label: 'Add Task'.
    addButton
        actionSelector: #dodajStavkuUI;
        target: self;
        color: Color blue;  
        position: stavkeListaMorph position + (0@stavkeListaMorph height + 10).

    "Kreiraj dugme 'Obriši Odabrane'."
    deleteButton := SimpleButtonMorph new label: 'Delete Selected'.
    deleteButton
        actionSelector: #obrisiOdabraneStavke;
        target: self;
        color: Color red;  
        position: addButton position + (addButton width + 10 @ 0).

    "Dodaj listu zadataka i dugmad u prozor."
    window addMorph: stavkeListaMorph frame: (0@0 extent: 1@1).
    window addMorph: addButton.
    window addMorph: deleteButton.

    
    window openInWorld.

]

{ #category : #'as yet unclassified' }
UI >> displayListuStavki [
    | window listMorph |
    
    
    window := SystemWindow new label: 'Lista zadataka'.
    window model: self.

    listMorph := PluggableListMorph new.
    listMorph
        list: stavkeLista  tasks;  "Pristupa listi stavki"
        on: #displayStavku: ;  ""
        selection: nil;  "Defaul selekcija."
        yourself.

    
    window addMorph: listMorph frame: (0@0 extent: 1@1).

   
    window openInWorld.
]

{ #category : #accessing }
UI >> displayStavku: stavka on: aCanvas [
    "Metod koji prikazuje svaku stavku iz liste sa svojim poljima."
    | xOffset yOffset lineHeight |
    xOffset := 10.
    yOffset := 0.
    lineHeight := 20.
    
    aCanvas
        frame: (0@0 extent: 1@lineHeight);
        text: 'Naslov: ', stavka naslov;
        textColor: Color black.
    yOffset := yOffset + lineHeight.

    aCanvas
        frame: (0@yOffset extent: 1@lineHeight);
        text: 'Opis: ', stavka opis;
        textColor: Color black.
    yOffset := yOffset + lineHeight.

    aCanvas
        frame: (0@yOffset extent: 1@lineHeight);
        text: 'Prioritet: ', stavka prioritet;
        textColor: Color black.
    yOffset := yOffset + lineHeight.

    aCanvas
        frame: (0@yOffset extent: 1@lineHeight);
        text: 'Rok: ', stavka rok greaseString;
        textColor: Color black.
    yOffset := yOffset + lineHeight.

    aCanvas
        frame: (0@yOffset extent: 1@lineHeight);
        text: 'Završeno: ', (stavka jeZavrseno ifTrue: ['Da'] ifFalse: ['Ne']);
        textColor: Color black.
]

{ #category : #adding }
UI >> dodajStavkuUI [
    | novaStavka |
    novaStavka := Stavka new. 
    stavkeLista  add: novaStavka.
    stavkeListaMorph  updateContents.


]

{ #category : #initialization }
UI >> initialize [
    "Inicijalizuj korisnički interfejs sa referencom na listu zadataka."
    stavkeLista  := StavkeLista new.
    self buildUI.

]

{ #category : #'as yet unclassified' }
UI >> obrisiOdabraneStavke [
    "Metoda za brisanje odabranih zadataka iz liste."
    | odabraniZadaci |
    odabraniZadaci := stavkeLista tasks select: [:zadatak | zadatak isSelected].
    odabraniZadaci do: [:zadatak | stavkeLista remove: zadatak].
    stavkeListaMorph updateContents.
]
