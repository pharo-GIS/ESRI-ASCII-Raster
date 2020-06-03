Class {
	#name : #ESRIParserTest,
	#superclass : #TestCase,
	#category : #ESRI
}

{ #category : #tests }
ESRIParserTest >> testCutLines [

	| parser |
	parser := ESRIParser new.
	parser cutLines: 'NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx'. 
	self assert: parser lines first equals: 'NCOLS xxx'.
	self assert: parser lines size equals: 4.
]
