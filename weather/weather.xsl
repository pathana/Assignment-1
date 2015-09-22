<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title>Weather</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="text()"/>
    <xsl:template match="current_observation">
        <h1>
            <xsl:value-of select="location"/>
        </h1>
        <div class="icon" style="float:left;padding-right:10px;">
            <img>
            <xsl:attribute name="src">
            <xsl:value-of select="icon_url_base"/>
            <xsl:value-of select="icon_url_name"/>
            </xsl:attribute>
            </img>
            <br></br>
            <xsl:value-of select="weather"/>
        </div>
        <h1 class="temp" style="font-size:2.5em;">
            <xsl:value-of select="temp_f"/>
            <xsl:text>°F</xsl:text>
        </h1>
        <p class="wind">
            <strong>Wind</strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="wind_dir"/>
            <xsl:text> at </xsl:text>
            <xsl:value-of select="wind_mph"/>
            <xsl:text> MPH</xsl:text>
        </p>
        <p class="humidity">
            <strong>Humidity</strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="relative_humidity"/>
            <xsl:text>%</xsl:text>
        </p>
        <p class="pressure">
            <strong>Pressure</strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="pressure_in"/>
            <xsl:text>"</xsl:text>
        </p>
        <p class="dew">
            <strong>Dew Point</strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="dewpoint_f"/>
            <xsl:text>°F</xsl:text>
        </p>
        <p class="visibility">
            <strong>Visibility</strong>
            <xsl:text> </xsl:text>
            <xsl:value-of select="visibility_mi"/>
            <xsl:text> mi</xsl:text>
        </p>
        <h5 class="update">
            <xsl:value-of select="observation_time"/>
        </h5>
        <h4 class="observation">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="two_day_history_url"/>
                </xsl:attribute>
                <xsl:text>Recent Observation History</xsl:text>
            </xsl:element>
        </h4>
        <h5 class="observation">
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="credit_URL"/>
                </xsl:attribute>
                <xsl:text>NOAA's National Weather Service</xsl:text>
            </xsl:element>
        </h5>
    </xsl:template>
</xsl:stylesheet>