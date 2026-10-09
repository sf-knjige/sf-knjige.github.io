# README for the scripts directory

## Purpose

Convert the html representation into usable epub files with minimal effort. 

## Requirements 

- [saxon](https://www.saxonica.com/) (I use saxon9he.jar here, but you have to provide this with an (absolute) path in build.xml) is used for extracting very minimal metadata and convert it to a YAML header for 
- [pandoc](https://pandoc.org/) for the actual conversion of the not-so XML well formed html to markdown as an intermediary format and further into epub3.
- optionally use [epubcheck](https://www.w3.org/publishing/epubcheck/docs/installation/) to validate the output

Before attempting the conversion, go through the shell scripts located here, and use with caution at your own risk… 

## Room for improvement 

Is there. For now, no SPARQLing wikidata for more extensive metadata or any fixing of the books' appearance (such as CSS, actually using the images from here, or other added sugar).
