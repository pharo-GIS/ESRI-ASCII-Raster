# ESRI-ASCII-Raster
To parse... [ESRI ASCII raster](http://help.arcgis.com/en/arcgisdesktop/10.0/help/index.html#/ESRI_ASCII_raster_format/009t0000000z000000/)

This is simple implementation that parses and produces a RASTER object containing maps.

The ESRI ASCII raster format can be used to transfer information to or from other cell-based or raster systems. When an existing raster is output to an ESRI ASCII-format raster, the file will begin with header information that defines the properties of the raster such as the cell size, the number of rows and columns, and the coordinates of the origin of the raster. The header information is followed by cell value information specified in space-delimited row-major order, with each row separated by a carriage return.
To convert an ASCII file to a raster, the data must be in this same format. The parameters in the header part of the file must match correctly with the structure of the data values.
The basic structure of the ESRI ASCII raster has the header information at the beginning of the file followed by the cell value data:
The basic structure of the ESRI ASCII raster has the header information at the beginning of the file followed by the cell value data. The spatial location of the raster is specified by the location of the lower left cell, and either by:
The center of the lower left cell

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
The lower left corner of the lower left cell
```
NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx
CELLSIZE xxx
NODATA_VALUE xxx
row 1
row 2
...
row n
```

Here is an tiny example

```
ncols 4
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
13 5 1 -9999
```
