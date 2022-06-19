#!/bin/bash

curl -s 'https://ja.wikipedia.org/wiki/%E6%97%A5%E5%90%91%E5%9D%8246' |
sed -n '/<span class="mw-headline" id="メンバー">/, /<span class="mw-headline" id="構成の推移"/p' |
grep -E -B4 -A1 '<td>.+型' |
sed -E -e 's/<[^>]+>//g' -e '/--/d' |
awk '{if(NR%6) ORS="\t"; else ORS="\n"; print}' |
awk -F '\t' -v 'OFS=\t' '{sub(/[0-9]+/,"",$4); print $1,$2,substr($3,1,10),$4,$5,$6}'
