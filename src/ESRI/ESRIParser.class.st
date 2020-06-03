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
ESRIParser >> cutLines: aString [ 
	| str | 
	lines := OrderedCollection new. 
	str := aString readStream.
	[ str atEnd ] whileFalse: 
		[ lines add: (str upTo: Character cr) ].
	^ lines
	
]

{ #category : #private }
ESRIParser >> handeline: aString [ 
	
	| contents |
	contents := (aString splitOn: Character space).
	raster 
		perform: (builderMapping at: contents first asLowercase asSymbol) 
		with: contents second asNumber. 
	
]

{ #category : #initialization }
ESRIParser >> initialize [ 
	super initialize. 
	raster := ESRIRaster new.
	self initializeBuilderMapping
]

{ #category : #initialization }
ESRIParser >> initializeBuilderMapping [

	builderMapping := Dictionary new. 
	builderMapping at: #ncols put: #numberOfColumns:.
	builderMapping at: #nrows put: #numberOfRows:.
	builderMapping at: #xllcenter put: #xllcenter:.
	builderMapping at: #yllcenter put: #xllcenter:.
	builderMapping at: #xllcorner put: #xllcorner:.
	builderMapping at: #yllcorner put: #xllcorner:.
	builderMapping at: #cellsize put: #cellSize:.
	builderMapping at: #nodata_value put: #noData:.
	
]

{ #category : #'accessing-private' }
ESRIParser >> lines [
	^ lines
]

{ #category : #accessing }
ESRIParser >> raster [
	^ raster
]
