Class {
	#name : #ESRIParserTest,
	#superclass : #TestCase,
	#category : #ESRI
}

{ #category : #'tests - data' }
ESRIParserTest >> testDataOneCell [

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	self assert: parser raster rows first equals: #(-9999 -9999 5 2)
]

{ #category : #'tests -  header' }
ESRIParserTest >> testHandleCellSize [

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'CELLSIZE 30'.
	self assert: parser raster cellSize equals: 30
]

{ #category : #'tests -  header' }
ESRIParserTest >> testHandleNCols [

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'NCOLS 2'.
	self assert: parser raster numberOfColumns equals: 2
]

{ #category : #'tests -  header' }
ESRIParserTest >> testHandleNRows [

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'nrows 2'.
	self assert: parser raster numberOfRows equals: 2
]

{ #category : #'tests -  header' }
ESRIParserTest >> testHandlexllcorner [

	| parser |
	parser := ESRIParser new.
	parser handleLine: 'xllcorner 378923'.
	self assert: parser raster xllcorner equals: 378923
]

{ #category : #'tests -  header' }
ESRIParserTest >> testParse [

	| parser |
	parser := ESRIParser new.
	parser parse: 'NCOLS 20
NROWS 30
XLLCORNER 2
YLLCORNER 3'. 
	self assert: parser raster numberOfColumns equals: 20.
	self assert: parser raster numberOfRows equals: 30.
	self assert: parser raster xllcorner equals: 2.
	self assert: parser raster yllcorner equals: 3.
]
