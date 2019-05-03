Class {
	#name : #SimpleInterpreterREPLQuitCommand,
	#superclass : #Object,
	#category : #'SimpleInterpreterREPL-Behavior'
}

{ #category : #testing }
SimpleInterpreterREPLQuitCommand >> execute [
	^ nil
]

{ #category : #testing }
SimpleInterpreterREPLQuitCommand >> isQuitCommand [
	^ true
]

{ #category : #testing }
SimpleInterpreterREPLQuitCommand >> result [
	^ 'Bye!!'
]
