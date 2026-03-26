formatting
printNonRecursiveRepresentationOn: aStream recursionSet: anIdentitySet
  "Put a displayable representation of the receiver on the given stream
   while avoiding recursion from object reference loops."

  | count sz myCls |

  myCls := self class .
  aStream nextPutAll: myCls name describeClassName .
  (myCls whichClassIncludesSelector: #associationsDo:) == AbstractDictionary
    ifTrue:[ ^ self "can't safely execute associationsDo: " ].

  aStream nextPutAll: '( ' .
  count := 1 .
  sz := self size .
  self associationsDo: [:anAssoc |
    aStream position > 700 ifTrue:[
      "prevent infinite recursion when printing cyclic structures, and
      limit the size of result when printing large collections."
      aStream nextPutAll: '...)' .
      ^ self
      ] .
    anAssoc printOn: aStream recursionSet: anIdentitySet.
    count < sz ifTrue:[ aStream nextPutAll: ', ' ].
    count := count + 1.
    ].
  aStream nextPut: $).
