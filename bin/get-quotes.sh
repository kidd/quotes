#!/bin/sh

curl https://raw.githubusercontent.com/kulinp/quote-of-the-day/master/app/src/main/assets/txt/randomquote.txt >quotes.txt
curl http://worrydream.com/quotes/ \
    | pup 'div.entry json{}' \
    |jq -r '.[]| [.children[1].children[0].children[0].text , .children[0].children[1].text ] | join(" -- ") | gsub("\\n" ; "")' \
        >>quotes.txt
curl http://skeeto.s3.amazonaws.com/share/showerthoughts \
    | sed -e 's/^%$/%%%/' \
    | tr '\r\n' '  '\
    | sed -s "s/ %%% /\n/g" \
          >>quotes.txt
