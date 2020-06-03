Class {
	#name : #ESRIParser,
	#superclass : #Object,
	#instVars : [
		'lines'
	],
	#category : #ESRI
}

{ #category : #private }
ESRIParser >> cutLines: aString [ 
	| str | 
	lines := OrderedCollection new. 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ lines add: (str upTo: Character cr) ].
	^ lines
	
]

{ #category : #'accessing-private' }
ESRIParser >> lines [
	^ lines
]
