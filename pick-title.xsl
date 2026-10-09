<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs tei"
xmlns="http://www.w3.org/1999/xhtml" 
xmlns:functx="http://www.functx.com"
xmlns:mrp="https://mrp.acdh.oeaw.ac.at/ns/epub"
xmlns:tei="http://www.tei-c.org/ns/1.0" version="2.0">

<xsl:output method="text" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

<xsl:strip-space elements="*"/>

<xsl:template match="*:TITLE|*:title">
<xsl:variable name="md" select="tokenize(.,', ')"/>
<xsl:result-document href="./00-title.md">
---
lang: sr
title: "<xsl:value-of select="."/>"
author: "<xsl:value-of select="$md[1]"/>"
---
</xsl:result-document>
</xsl:template>

</xsl:stylesheet>