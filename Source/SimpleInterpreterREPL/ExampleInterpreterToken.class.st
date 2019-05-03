Class {
	#name : #ExampleInterpreterToken,
	#superclass : #Object,
	#instVars : [
		'type',
		'value'
	],
	#category : #'SimpleInterpreterREPL-Example Interpreter'
}

{ #category : #'instance creation' }
ExampleInterpreterToken class >> for: aTokenType with: aValue [
	^ self new
		type: aTokenType;
		value: aValue;
		yourself
]

{ #category : #accessing }
ExampleInterpreterToken >> type [
	^ type
]

{ #category : #accessing }
ExampleInterpreterToken >> type: aTokenType [
	type := aTokenType
]

{ #category : #accessing }
ExampleInterpreterToken >> value [
	^ value
]

{ #category : #accessing }
ExampleInterpreterToken >> value: aValue [
	value := aValue
]
