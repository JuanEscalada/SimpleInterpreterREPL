Class {
	#name : #ExampleCalculatorInterpreter,
	#superclass : #SimpleInterpreterBehavior,
	#instVars : [
		'currentToken',
		'input',
		'position'
	],
	#category : #'SimpleInterpreterREPL-Example Interpreter'
}

{ #category : #accessing }
ExampleCalculatorInterpreter >> eat: tokenType [
	currentToken type = tokenType
		ifTrue: [ currentToken := self getNextToken ]
		ifFalse: [ self raiseError ]
]

{ #category : #accessing }
ExampleCalculatorInterpreter >> evaluate: anInput [
	| left	"op" right |
	self initializePositionAndInputFor: anInput.
	currentToken := self getNextToken.
	left := currentToken.
	self eat: 'int'.
	"op := currentToken."
	self eat: 'plus'.
	right := currentToken.
	self eat: 'int'.
	^ left value + right value
]

{ #category : #accessing }
ExampleCalculatorInterpreter >> getNextToken [
	| currentChar |
	position > input size
		ifTrue: [ ^ ExampleInterpreterToken for: 'EOF' with: nil ].
	currentChar := input at: position ifAbsent: [ self raiseError ].
	currentChar isDigit
		ifTrue: [ | token |
			token := ExampleInterpreterToken
				for: 'int'
				with: currentChar digitValue.
			position := position + 1.
			^ token ].
	currentChar = $+
		ifTrue: [ | token |
			token := ExampleInterpreterToken for: 'plus' with: currentChar.
			position := position + 1.
			^ token ].
	self raiseError
]

{ #category : #accessing }
ExampleCalculatorInterpreter >> initializePositionAndInputFor: anInput [
	input := anInput.
	position := 1
]

{ #category : #accessing }
ExampleCalculatorInterpreter >> interpretedLanguage [
	^ 'calculator'
]

{ #category : #accessing }
ExampleCalculatorInterpreter >> raiseError [
	ExampleInterpreterError signal
]
