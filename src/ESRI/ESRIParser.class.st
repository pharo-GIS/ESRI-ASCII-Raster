Class {
	#name : #ESRIParser,
	#superclass : #Object,
	#instVars : [
		'lines',
		'raster',
		'builderMapping'
	],
	#category : #ESRI
}

{ #category : #private }
ESRIParser >> handleLine: aString [ 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first asLowercase asSymbol) 
		with: contents second asNumber. 
	
]

{ #category : #initialization }
ESRIParser >> initialize [
	super initialize.
	self initializeRaster.
	self initializeBuilderMapping
]

{ #category : #initialization }
ESRIParser >> initializeBuilderMapping [

	builderMapping := Dictionary new. 
	builderMapping at: #ncols put: #numberOfColumns:.
	builderMapping at: #nrows put: #numberOfRows:.
	builderMapping at: #xllcenter put: #xllcenter:.
	builderMapping at: #yllcenter put: #yllcenter:.
	builderMapping at: #xllcorner put: #xllcorner:.
	builderMapping at: #yllcorner put: #yllcorner:.
	builderMapping at: #cellsize put: #cellSize:.
	builderMapping at: #nodata_value put: #noData:.
	
]

{ #category : #initialization }
ESRIParser >> initializeRaster [
	raster := ESRIRaster new
]

{ #category : #'accessing-private' }
ESRIParser >> lines [
	^ lines
]

{ #category : #private }
ESRIParser >> parse: aString [ 
	| str | 
	self initializeRaster.
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ self handleLine: (str upTo: Character cr) ].

	
]

{ #category : #accessing }
ESRIParser >> raster [
	^ raster
]
