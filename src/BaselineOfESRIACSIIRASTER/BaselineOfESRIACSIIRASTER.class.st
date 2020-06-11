Class {
	#name : #BaselineOfESRIACSIIRASTER,
	#superclass : #BaselineOf,
	#category : #BaselineOfESRIACSIIRASTER
}

{ #category : #baselines }
BaselineOfESRIACSIIRASTER >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			package: #'ESRI']
		
]
