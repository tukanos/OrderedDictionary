*ordered-pharo-dictionary
unreferencedKeysIn: arg1
  ^ 'Scanning for references . . .'
    displayProgressFrom: 0
    to: arg1 size
    during: [ :arg2 | 
      | tmp2 |
      tmp2 := 0.
      arg1 keys
        select: [ :arg3 | 
          arg2 current: (tmp2 := tmp2 + 1).
          (self systemNavigation
            allReferencesTo: (arg1 associationAt: arg3)) isEmpty ] ]