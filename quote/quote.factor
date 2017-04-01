! Copyright (C) 2017 Raimon Grau
! See http://factorcode.org/license.txt for BSD license.

USING: kernel sequences command-line io namespaces assocs io.files
io.encodings.utf8 random io.styles wrap.strings ;

IN: quote

: all-quotes ( fname -- l ) utf8 file-lines ;

: at-random ( l -- elem ) 1 sample first ;

: quote-of-the-day ( fname -- )
    all-quotes at-random 40 wrap-string print ;

: quote-run ( -- ) command-line get first quote-of-the-day ;

MAIN: quote-run
