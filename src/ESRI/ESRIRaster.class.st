"
I represent an instance of a cell-based expressed as

```
NCOLS xxx
NROWS xxx
XLLCENTER xxx
YLLCENTER xxx
CELLSIZE xxx
NODATA_VALUE xxx
row 1
row 2
...
row n
```

Here are the possible header format line-based tokens
 
NCOLS
Number of cell columns 
Integer greater than 0.

NROWS
Number of cell rows
Integer greater than 0.

XLLCENTER or XLLCORNER
X-coordinate of the origin (by center or lower left corner of the cell)
Match with y-coordinate type.

YLLCENTER or YLLCORNER
Y-coordinate of the origin (by center or lower left corner of the cell)
Match with x-coordinate type.

CELLSIZE
Cell size Greater than 0.

NODATA_VALUE

### Known limits
We will have to handle YLLCENTER or YLLCORNER
but later
"
Class {
	#name : #ESRIRaster,
	#superclass : #Object,
	#instVars : [
		'numberOfColumns',
		'numberOfRows',
		'xllcenter',
		'yllcenter',
		'xllcorner',
		'yllcorner',
		'cellSize',
		'noData',
		'rows'
	],
	#category : #ESRI
}

{ #category : #adding }
ESRIRaster >> addRow: aRow [

	rows add: aRow
]

{ #category : #accessing }
ESRIRaster >> cellSize [
	^ cellSize
]

{ #category : #accessing }
ESRIRaster >> cellSize: anObject [
	cellSize := anObject
]

{ #category : #initialization }
ESRIRaster >> initialize [

	super initialize. 
	noData := -9999.
	numberOfColumns := 0.
	numberOfRows := 0. 
	xllcenter := 0. 
	yllcenter := 0. 
	xllcorner := 0. 
	yllcorner := 0. 
	cellSize := 0.
	rows := OrderedCollection new. 
]

{ #category : #accessing }
ESRIRaster >> noData [
	^ noData
]

{ #category : #accessing }
ESRIRaster >> noData: anObject [
	noData := anObject
]

{ #category : #accessing }
ESRIRaster >> numberOfColumns [
	^ numberOfColumns
]

{ #category : #accessing }
ESRIRaster >> numberOfColumns: anObject [
	numberOfColumns := anObject
]

{ #category : #accessing }
ESRIRaster >> numberOfRows [
	^ numberOfRows
]

{ #category : #accessing }
ESRIRaster >> numberOfRows: anObject [
	numberOfRows := anObject
]

{ #category : #accessing }
ESRIRaster >> rows [
	^ rows
]

{ #category : #accessing }
ESRIRaster >> rows: anObject [
	rows := anObject
]

{ #category : #accessing }
ESRIRaster >> xllcenter [
	^ xllcenter
]

{ #category : #accessing }
ESRIRaster >> xllcenter: anObject [
	xllcenter := anObject
]

{ #category : #accessing }
ESRIRaster >> xllcorner [
	^ xllcorner
]

{ #category : #accessing }
ESRIRaster >> xllcorner: anObject [
	xllcorner := anObject
]

{ #category : #accessing }
ESRIRaster >> yllcenter [
	^ yllcenter
]

{ #category : #accessing }
ESRIRaster >> yllcenter: anObject [
	yllcenter := anObject
]

{ #category : #accessing }
ESRIRaster >> yllcorner [
	^ yllcorner
]

{ #category : #accessing }
ESRIRaster >> yllcorner: anObject [
	yllcorner := anObject
]
