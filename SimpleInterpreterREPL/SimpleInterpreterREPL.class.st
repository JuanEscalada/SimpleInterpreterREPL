Class {
	#name : #SimpleInterpreterREPL,
	#superclass : #Object,
	#category : #'SimpleInterpreterREPL-Behavior'
}

{ #category : #'REPL Starters' }
SimpleInterpreterREPL class >> startStdioFor: aLanguageInterpreter [
	NeoConsole stdio
		inputInterpreter:
			(SimpleInterpreterREPLInputInterpreter new
				languageInterpreter: aLanguageInterpreter;
				yourself);
		start
]

{ #category : #'REPL Starters' }
SimpleInterpreterREPL class >> startTelnetServerFor: aLanguageInterpreter [
	"Defaults port to 4999"

	self startTelnetServerFor: aLanguageInterpreter on: 4999
]

{ #category : #'REPL Starters' }
SimpleInterpreterREPL class >> startTelnetServerFor: aLanguageInterpreter on: aPort [
	NeoConsole telnetServer
		inputInterpreter:
			(SimpleInterpreterREPLInputInterpreter new
				languageInterpreter: aLanguageInterpreter;
				yourself);
		port: aPort;
		start
]
