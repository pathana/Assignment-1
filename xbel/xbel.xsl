<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:template match="/">
        <xsl:param name="desc" select="yes"/>
        <html>
            <head>
                <title><xsl:value-of select="/xbel/title"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="/xbel/title"/></h1>
                <ul>
                    <xsl:apply-templates select="/xbel/folder"/>
                </ul>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="folder">
        <li>
            <xsl:value-of select="title"/>
                <ul>
                    <xsl:apply-templates select="folder|bookmark"/>
                </ul>
        </li>
    </xsl:template>
    
    <xsl:template match="bookmark">
        <li>
            <a href="{@href}">
                <xsl:apply-templates select="title"/>
            </a>
        </li>
    </xsl:template>
    
    <xsl:template match="text()">
        <div class="text">
            <xsl:value-of select="/xbel/folder/bookmark/desc"/>
        </div>
    </xsl:template>

</xsl:stylesheet>