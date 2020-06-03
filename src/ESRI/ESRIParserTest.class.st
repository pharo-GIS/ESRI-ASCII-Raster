Class {
	#name : #ESRIParserTest,
	#superclass : #TestCase,
	#category : #ESRI
}

{ #category : #'tests - data' }
ESRIParserTest >> testDataOneRow [

	| parser |
	parser := ESRIParser new.
	parser raster numberOfColumns: 4. 
	parser handleData: #('-9999' '-9999' '5' '2').
	self assert: parser raster rows first equals: #(-9999 -9999 5 2)
]

{ #category : #'tests - data' }
ESRIParserTest >> testFull [

	| parser |
	parser := ESRIParser new.
	parser parse: 'ncols 4
nrows 6
xllcorner 0.0
yllcorner 0.0
cellsize 50.0
NODATA_value -9999
-9999 -9999 5 2
-9999 20 100 36
3 8 35 10
32 42 50 6
88 75 27 9
13 5 1 -9999'.
	self assert: parser raster numberOfRows equals: 6.
	self assert: parser raster rows size equals: 6.
	self assert: parser raster rows last equals: #(13 5 1 -9999)
	
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
