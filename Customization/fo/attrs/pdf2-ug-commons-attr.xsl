<!--
    Custom attribute sets used only by the 'com.oxygenxml.pdf2.ug' plugin.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:rx="http://www.renderx.com/XSL/Extensions"
    version="2.0">

    <!-- 
        Attribute set for chapter name and number container. 
        It is displayed as first graphical element in a chapter.
    -->
    <xsl:attribute-set name="pdf2.ug.chapter.name.and.number">
        <xsl:attribute name="border-after-width">3pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">16.8pt</xsl:attribute>
        
        <xsl:attribute name="border-after-style">solid</xsl:attribute>
        <xsl:attribute name="border-after-width">1pt</xsl:attribute>
        <xsl:attribute name="border-after-color" select="$custom_blue_color"/>
    </xsl:attribute-set>
    
    <!-- 
        FO attributes for chapter name.
    -->
    <xsl:attribute-set name="pdf2.ug.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-column">always</xsl:attribute>
        <xsl:attribute name="color" select="$custom_blue_color"/>
    </xsl:attribute-set>
    
    <!-- 
        FO attributes for chapter name.
    -->
    <xsl:attribute-set name="pdf2.ug.common.border__bottom" use-attribute-sets="common.border__bottom">
        <xsl:attribute name="border-after-color" select="$custom_blue_color"/>
    </xsl:attribute-set>

</xsl:stylesheet>
