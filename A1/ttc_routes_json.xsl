<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="2.0">
   
    <xsl:output method="text" />
    <xsl:param name="term"></xsl:param>
    <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
	<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

    <xsl:template match="/body">
     {"items":[
      <xsl:apply-templates select="route[contains(translate(@title, $smallcase, $uppercase), translate($term, $smallcase, $uppercase))]"/> 
      ]}	
    </xsl:template>
	
   <xsl:template match="route">
   		{"tag": "<xsl:value-of select='@tag'/>", "title": "<xsl:value-of select='@title'/>"}<xsl:if test="following-sibling::route[contains(translate(@title, $smallcase, $uppercase), translate($term, $smallcase, $uppercase))]">, </xsl:if>
   </xsl:template>
	    
</xsl:stylesheet>
