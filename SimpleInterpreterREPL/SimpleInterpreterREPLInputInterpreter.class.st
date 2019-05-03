Class {
	#name : #SimpleInterpreterREPLInputInterpreter,
	#superclass : #NeoConsoleInputInterpreterBehavior,
	#instVars : [
		'result',
		'arguments',
		'languageInterpreter'
	],
	#category : #'SimpleInterpreterREPL-Behavior'
}

{ #category : #'instance creation' }
SimpleInterpreterREPLInputInterpreter class >> new [
	^ super new languageInterpreter: ExampleCalculatorInterpreter new
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> argument [
	^ arguments first
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> arguments [
	^ arguments
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> commandClass [
	^ self
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> consolePrompt [
	^ self interpretedLanguage , '> '
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> execute [
	result := String
		streamContents: [ :out | 
			[ | evaluationResult |
			NeoConsole history add: self argument.
			evaluationResult := self languageInterpreter
				evaluate: self argument.
			NeoConsole lastResult: evaluationResult.
			out print: evaluationResult ]
				on: Error , SyntaxErrorNotification
				do: [ :exception | self logException: exception on: out ] ]
		limitedTo: self outputLimit.
	result size < self outputLimit
		ifFalse: [ result := result , ' ... (truncated) ...' ]
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> hasArguments [
	^ arguments notNil and: [ arguments notEmpty ]
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> interpretedLanguage [
	^ self languageInterpreter interpretedLanguage
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> isMultiLine [
	^ self isSingleLine not
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> isQuitCommand [
	^ false
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> isSingleLine [
	^ true
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> languageInterpreter [
	^ languageInterpreter
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> languageInterpreter: aLanguageInterpreter [
	languageInterpreter := aLanguageInterpreter
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> logException: exception on: out [
	out
		print: exception;
		cr.
	exception signalerContext printDetails: out.
	exception signalerContext sender debugStack: 8 on: out
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> on: input [
	arguments := Array with: input trimBoth
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> outputLimit [
	^ 16384
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> quitCommandClass [
	^ SimpleInterpreterREPLQuitCommand 
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> result [
	^ result
]

{ #category : #accessing }
SimpleInterpreterREPLInputInterpreter >> startUpText [
	^ 'Simple interpreter for: ' , self interpretedLanguage
]
