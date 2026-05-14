*ordered-pharo-dictionary
unreferencedKeys
  "Protocol: private"
  (SystemVersion current major < 12)
    ifTrue: [ ^ Dictionary unreferencedKeysIn: self ]
    ifFalse: [ ^ Dictinary new unreferencedKeys ]