<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="/xbel/title"/></title>
            </head>
            <body>
                <h2><xsl:value-of select="/xbel/title"/></h2>
                <ul>
                    <xsl:apply-templates select="/xbel/folder"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="folder">
        <li>
            <xsl:value-of select="title"/>
            <xsl:if test="exists(folder)">
                <xsl:apply-templates select="folder"/>
            </xsl:if>
        </li>
    </xsl:template>
    
    <xsl:template match="bookmark">
        
    </xsl:template>
    

</xsl:stylesheet>