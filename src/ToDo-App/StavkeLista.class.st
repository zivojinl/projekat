Class {
	#name : #StavkeLista,
	#superclass : #Object,
	#instVars : [
		'stavke'
	],
	#category : #'ToDo-App'
}

{ #category : #'as yet unclassified' }
StavkeLista >> azurirajStavku: stavka saNaslovom: naslov opisom: opis prioritetom: prioritet datumomZavrsetka: datum zavrsen: zavrseno [
    | postojecaStavka |
    postojecaStavka := self pronadjiStavkuPoNaslovu:  stavka naslov.
    postojecaStavka ifNotNil: [
        postojecaStavka
            naslov:  naslov;
            opis: opis;
            prioritet: prioritet;
            rok: datum;
            jeZavrseno:  zavrseno].
]

{ #category : #'as yet unclassified' }
StavkeLista >> dobaviNezavrseneStavke [
    ^ stavke select: [:svaka| svaka jeZavrseno not].
]

{ #category : #'as yet unclassified' }
StavkeLista >> dobaviStavkePremaPrioritetu: cilj [
    ^ stavke select: [:svaka | svaka prioritet  = cilj].
]

{ #category : #'as yet unclassified' }
StavkeLista >> dobaviStavkePremaRoku: cilj [
        ^ stavke select: [:svaka | svaka rok = cilj].

]

{ #category : #'as yet unclassified' }
StavkeLista >> dobaviZavrseneStavke [
	^stavke select: [:svaka|svaka jeZavrseno].
]

{ #category : #'as yet unclassified' }
StavkeLista >> dodajStavku: novaStavka [
    stavke add: novaStavka.
]

{ #category : #initialization }
StavkeLista >> initialize [
    stavke := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
StavkeLista >> pronadjiStavkuPoNaslovu: cilj [
    ^ stavke detect: [:svaka | svaka naslov  = cilj] ifNone: [nil].
]

{ #category : #'as yet unclassified' }
StavkeLista >> ukloniStavku: stavkaZaUklanjanje [
    stavke remove: stavkaZaUklanjanje.
]
