#!/bin/bash
#./dl_saxon.sh

for dir in `find ../knjige  -mindepth 1 -maxdepth 1 -type d`;
do 
	echo $dir;
	cd $dir; 
	#./pad-zero.sh; # pad the html files to p0001.html etc for correct markdown order
	#mkdir md; 
	cp ../../build.xml . && echo 'copied buildscript to' $dir; # copy ant build.xml into the current folder (runs XSL on fixed index0.html files to fetch metadata)
	#./sf-knjige.sh; # inner loop over files in separate script, creates `md` folder per directory with markdown files

	sed -E -i'' -e "s#scrolling=auto##gi" -E -e 's#</?meta[^>]*?>##gi' -E -e 's#</?frame[^>]*?>##gi' index0.html; # fix the index0.html files to be XML well-formed
	ant; # run the XSL transformation from build.xml
	pandoc -o ${PWD##*/}.epub ./md/*.md;
	# rm -rf md;
	rm build.xml

	cd ..; 
done; 

# maybe reset your local repo
# git reset --keep HEAD
