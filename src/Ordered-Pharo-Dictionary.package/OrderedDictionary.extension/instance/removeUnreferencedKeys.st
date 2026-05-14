*ordered-pharo-dictionary
removeUnreferencedKeys
  "Protocol: removing"
  (SystemVersion current major < 8)
    ifTrue: [ ^ self unreferencedKeys do: [ :each | self removeKey: each ] ]
    ifFalse: [ ^ Smalltalk image cleanOutUndeclared ]