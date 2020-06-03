"
The ESRI ASCII raster format can be used to transfer information to or from other cell-based or raster systems. When an existing raster is output to an ESRI ASCII-format raster, the file will begin with header information that defines the properties of the raster such as the cell size, the number of rows and columns, and the coordinates of the origin of the raster. The header information is followed by cell value information specified in space-delimited row-major order, with each row separated by a carriage return.

Well the wikipedia page is much nicer: 
(https://en.wikipedia.org/wiki/Esri_grid)[https://en.wikipedia.org/wiki/Esri_grid]

## Header 

The basic structure of the ESRI ASCII raster has the header information at the beginning of the file followed by the cell value data. The spatial location of the raster is specified by the location of the lower left cell, and either by:

The center of the lower left cell
> NCOLS xxx
> NROWS xxx
> XLLCENTER xxx
> YLLCENTER xxx
> CELLSIZE xxx
> NODATA_VALUE xxx
> row 1
> row 2
> ...
> row n

The lower left corner of the lower left cell
> NCOLS xxx
> NROWS xxx
> XLLCORNER xxx
> YLLCORNER xxx
> CELLSIZE xxx
> NODATA_VALUE xxx
> row 1
> row 2
> ...
> row n
Row 1 of the data is at the top of the raster, row 2 is just under row 1, and so on.


## Data format
The data component of the ESRI ASCII raster follows the header information.
Cell values should be delimited by spaces.
No carriage returns are necessary at the end of each row in the raster. The number of columns in the header determines when a new row begins.
Row 1 of the data is at the top of the raster, row 2 is just under row 1, and so on.

```
ncols         4
nrows         6
xllcorner     0.0
yllcorner     0.0
cellsize      50.0
NODATA_value  -9999
-9999 -9999 5 2
-9999 20 100 36
3 8 35 10
32 42 50 6
88 75 27 9
13 5 1 -9999
```
"
Class {
	#name : #ESRIParser,
	#superclass : #Object,
	#instVars : [
		'raster',
		'builderMapping'
	],
	#category : #ESRI
}

{ #category : #private }
ESRIParser >> handleData: anArray [
	
	| row |
	row := Array new: raster numberOfColumns.
	"doing it this way I cut extra values that would overflow the columns numbers.
	I could have just iterated on the argument and change its contents too."
	1 to: raster numberOfColumns do: [ :e | row at: e put: (anArray at: e) asNumber].
	raster addRow: row.
]

{ #category : #private }
ESRIParser >> handleHeader: anArray [
	"anArray = #(string numberizedString)"
	raster
		perform: (builderMapping at: anArray first asLowercase asSymbol)
		with: anArray second asNumber
]

{ #category : #private }
ESRIParser >> handleLine: aString [
	| contents isHeader |
	contents := aString splitOn: Character space.
	isHeader := contents size = 2 and: [ contents first isNumber not ].
	isHeader
		ifTrue:
			[ self handleHeader: contents ]
		ifFalse: 
			[ self handleData: contents ]
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
