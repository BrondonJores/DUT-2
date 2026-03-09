<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/" name="bibliotheque">
        <xsl:element name="h1">
            <xsl:value-of select="Bibliotheque"></xsl:value-of>
        
            <xsl:element name="Livre">
                <xsl:element name="titre">
                    <xsl:value-of select="N ou M"></xsl:value-of>
                </xsl:element>
                <xsl:element name="auteur">
                    <xsl:value-of select="Agatha Chritie"></xsl:value-of>
                </xsl:element>
                <xsl:element name="ref">
                    <xsl:value-of select="Policier-C-15"></xsl:value-of>
                </xsl:element>
            </xsl:element>

            <xsl:element name="Livre">
                <xsl:element name="titre">
                    <xsl:value-of select="Le chien des Baskerville"></xsl:value-of>
                </xsl:element>
                <xsl:element name="auteur">
                    <xsl:value-of select="Sir Arthur Conan Doyle"></xsl:value-of>
                </xsl:element>
                <xsl:element name="ref">
                    <xsl:value-of select="Policier-D-3"></xsl:value-of>
                </xsl:element>
            </xsl:element>

            
        </xsl:element>
    </xsl:template>
    <xsl:output
        method="html" version="html4.01"
        encoding="ISO-8859-1" doctype-public="-//W3C// DTD HTML 4.01//FR"
        doctype-system="http://www.w3.org/TR/html4/strict.dtd"   
    />
</xsl:stylesheet>