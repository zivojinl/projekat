Class {
	#name : #Taggable,
	#superclass : #Trait,
	#instVars : [
		'oznake'
	],
	#category : #'ToDo-App'
}

{ #category : #'as yet unclassified' }
Taggable >> odajOznaku: oznaka [ [
        oznake add: oznaka.
    ]
]

{ #category : #accessing }
Taggable >> oznake [
	^ oznake
]

{ #category : #accessing }
Taggable >> oznake: anObject [
	oznake := anObject
]

{ #category : #'as yet unclassified' }
Taggable >> ukloniOznaku: oznaka [ [
        oznake remove: oznaka ifAbsent: [].
    ]
]
