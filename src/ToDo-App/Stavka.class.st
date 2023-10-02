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
Stavka >> rok: anObject [
	rok := anObject
]
