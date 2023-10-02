Class {
	#name : #UI,
	#superclass : #Object,
	#category : #'ToDo-App'
}

{ #category : #accessing }
UI >> captureUserInput [
	| naslov opis prioritet datum jeZavrseno noviZadatak |
	naslov := Transcript cr.
	opis := Transcript cr.
	Transcript show: 'Unesite prioritet zadatka (1-5): '.
	prioritet := Transcript cr asNumber.
	Transcript show: 'Unesite rok za zadatak (YYYY-MM-DD): '.
	datum := Transcript cr asDate.
	Transcript show: 'Da li je zadatka zavrsen (true/false): '.
	jeZavrseno := Transcript cr asBoolean.
	noviZadatak := Stavka new.
	noviZadatak
		naslov: naslov;
		opis: opis;
		prioritet: prioritet;
		rok: datum;
		jeZavrseno: jeZavrseno.
	^ noviZadatak
]

{ #category : #'as yet unclassified' }
UI >> displayListuStavki: listaStavki [
    Transcript clear.
    listaStavki stavke do: [:each | self displayStavku: each].
]

{ #category : #accessing }
UI >> displayStavku: stavka [
	Transcript
		show: 'Naslov: ' , stavka naslov;
		cr.
	Transcript
		show: 'Opis ' , stavka opis;
		cr.
	Transcript
		show: 'Prioritet ' , stavka prioritet asString;
		cr.
	Transcript
		show: 'Rok: ' , stavka rok asString;
		cr.
	Transcript
		show: 'Zavrseno ' , stavka jeZavrseno asString;
		cr
]

{ #category : #accessing }
UI >> getUserInput [
    Transcript show: '1. Add new task' withCR.
    Transcript show: '2. Mark task as complete' withCR.
    Transcript show: '3. Exit' withCR.
    ^ Transcript cr
]

{ #category : #'as yet unclassified' }
UI >> handleUserAction [
    | userInput newToDoItem toDoList |
    toDoList := StavkeLista  new.
    [ userInput := self getUserInput.
      userInput = '1' ] whileTrue: [
        newToDoItem := self captureUserInput.
        toDoList dodajStavku:  newToDoItem ].
    self displayListuStavki:  toDoList.
]
