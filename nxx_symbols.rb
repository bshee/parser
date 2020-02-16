KEYWORDS = "
if
then
else
elif
endif
while
loop
endloop
print
return
exit
".split

ONE_CHARACTER_SYMBOLS = "
=
( )
< >
/ * + -
! &
.  ;
".split

TWO_CHARACTER_SYMBOLS = "
==
<=
>=
<>
!=
++
**
--
+=
-=
||
".split

IDENTIFIER_STARTCHARS = (("a".."z").to_a + ("A".."Z").to_a).join("")

digits = ("0".."9").to_a.join("")

IDENTIFIER_CHARS = IDENTIFIER_STARTCHARS + digits + "_"

NUMBER_STARTCHARS = digits
NUMBER_CHARS = digits + "."

STRING_STARTCHARS = "'" + '"'

WHITESPACE_CHARS  = " \t\n"

# Token types
STRING = "String"
IDENTIFIER = "Identifier"
NUMBER = "Number"
WHITESPACE = "Whitespace"
COMMENT = "Comment"
EOF = "Eof"
