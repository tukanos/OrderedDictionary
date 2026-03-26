tests - formatting
testDisplayableRepresentation
	"Verifying correct displayable represenation"
	| dict selfOutput |

	dict := (OrderedDictionary new at: 'x' put: 1; at: 'y' put: 2; yourself).
	selfOutput := dict printString.
	self assert: selfOutput equals: 'anOrderedDictionary( ''x''->1, ''y''->2)'
