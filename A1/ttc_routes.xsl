<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

    <xsl:template match="/body">
        <html>
        <body>
            <ul>
                <xsl:apply-templates select="route"/>
            </ul>
        </body>
        </html>
    </xsl:template>

    <xsl:template match="route">
        <li>
            <pre>
                <label>ID:              </label> <xsl:value-of select="@tag" />
                <br/>
                <label>Display Name:    </label> <xsl:value-of select="@title"/>
            </pre>
        </li>
    </xsl:template>

</xsl:stylesheet>