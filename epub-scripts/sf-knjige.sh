#!/bin/bash

echo "processing `pwd`";
for f in `find . -mindepth 1 -type f -iname 'p*html'`;
do
	echo $f;
	# remove the tables which are just used to frame everything in a 97% width
	sed -E -i'' "s#(</?table[^>]*>|</?t[rd][^>]*?>)##gi" $f;
	pandoc -o md/$f.md $f
done;


