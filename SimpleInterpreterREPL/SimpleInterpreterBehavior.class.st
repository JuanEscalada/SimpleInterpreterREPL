Class {
	#name : #SimpleInterpreterBehavior,
	#superclass : #Object,
	#category : #'SimpleInterpreterREPL-Behavior'
}

{ #category : #accessing }
SimpleInterpreterBehavior >> evaluate: anInput [
	self subclassResponsibility
]

{ #category : #accessing }
SimpleInterpreterBehavior >> interpretedLanguage [
	self subclassResponsibility
]
