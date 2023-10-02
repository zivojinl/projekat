Class {
	#name : #PonavljajucaStavka,
	#superclass : #Object,
	#instVars : [
		'frekvencija'
	],
	#category : #'ToDo-App'
}

{ #category : #initialization }
PonavljajucaStavka >> initialize [ [
        frekvencija := 'Dnevno'.
        super initialize.
    ]
]

{ #category : #'as yet unclassified' }
PonavljajucaStavka >> postaviFrekvenciju: aFrekvencija [ [
        frekvencija := aFrekvencija.
    ]
]
