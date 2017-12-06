Red []

; http://www.rebol.org/view-script.r?script=wraptext.r
wrap-text: func [
    para
    /margin size "Char count after which the wrap occurs."
    /local count
][
    count: 1
    if not margin [size: 50] ; default size
    trim/lines para
    forall para [
        if all [count >= size find/match para " "][
            change para newline
            count: 0
        ]
        count: count + 1
    ]
    head para
]

get-quote: func [ file ][
  a: read/lines file
  random/seed to integer! now/precise
  random/secure/only a
]

print wrap-text/margin get-quote %quotes.txt 40