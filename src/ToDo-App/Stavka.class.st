Class {
	#name : #Stavka,
	#superclass : #Object,
	#instVars : [
		'naslov',
		'opis',
		'prioritet',
		'rok',
		'jeZavrseno'
	],
	#category : #'ToDo-App'
}

{ #category : #initialization }
Stavka >> initialize [
    naslov := 'Bez naslova'.
    opis := ''.
    prioritet := 1.
    rok := Date today.
    jeZavrseno  := false.
]

{ #category : #accessing }
Stavka >> jeZavrseno [
	^ jeZavrseno
]

{ #category : #accessing }
Stavka >> jeZavrseno: anObject [
	jeZavrseno := anObject
]

{ #category : #accessing }
Stavka >> naslov [
	^ naslov
]

{ #category : #accessing }
Stavka >> naslov: anObject [
	naslov := anObject
]

{ #category : #accessing }
Stavka >> opis [
	^ opis
]

{ #category : #accessing }
Stavka >> opis: anObject [
	opis := anObject
]

{ #category : #accessing }
Stavka >> prioritet [
	^ prioritet
]

{ #category : #accessing }
Stavka >> prioritet: anObject [
	prioritet := anObject
]

{ #category : #accessing }
Stavka >> rok [
	^ rok
]

{ #category : #accessing }
Stavka >> rok: datum [
    "Ovo je setter metoda za 'rok'. Proverava da li je 'datum' validan datum pre nego što ga dodeli 'rok'."
    datum ifNotNil: [
        (datum isKindOf: Date) ifTrue: [
            rok := datum. "Dodeli 'datum' promenljivoj 'rok' ako je validan datum."
        ] ifFalse: [
            "Obradi slučaj kada 'datum' nije validan datum."
            rok := Date today + 7 days. "Postavi podrazumevani datum (npr. 7 dana od danas)."
        ].
    ] ifNil: [
        "Obradi slučaj kada je 'datum' nil "
        rok := Date today + 7 days. "Postavi podrazumevani datum (npr. 7 dana od danas)."
    ].

   
]
