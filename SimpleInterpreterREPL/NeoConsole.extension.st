Extension { #name : #NeoConsole }

{ #category : #'*SimpleInterpreterREPL' }
NeoConsole class >> stdio [
	^ NeoConsoleStdio new
]

{ #category : #'*SimpleInterpreterREPL' }
NeoConsole class >> telnetServer [
	^ NeoConsoleTelnetServer new
]
