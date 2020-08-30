Class {
	#name : #BaselineOfESRIASCIIRaster,
	#superclass : #BaselineOf,
	#category : #BaselineOfESRIACSIIRASTER
}

{ #category : #baselines }
BaselineOfESRIASCIIRaster >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'ESRI']
		
]
