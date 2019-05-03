Class {
	#name : #BaselineOfSimpleInterpreterREPL,
	#superclass : #BaselineOf,
	#category : #BaselineOfSimpleInterpreterREPL
}

{ #category : #baselines }
BaselineOfSimpleInterpreterREPL >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ self setUpDependencies: spec.
			spec package: 'SimpleInterpreterREPL' ]
]

{ #category : #baselines }
BaselineOfSimpleInterpreterREPL >> setUpDependencies: spec [
	spec
		baseline: 'NeoConsole'
		with: [ spec repository: 'github://JuanEscalada/NeoConsole:master/src' ]
]
