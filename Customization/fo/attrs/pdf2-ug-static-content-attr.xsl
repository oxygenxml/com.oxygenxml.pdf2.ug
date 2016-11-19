<!--
    Custom attribute sets used only by the 'com.oxygenxml.pdf2.ug' plugin.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  version="2.0">
  
  <!-- 
    Chapter number attributes.
  -->
  <xsl:attribute-set name="pdf2.ug__chapter__frontmatter__number__container" 
    use-attribute-sets="__chapter__frontmatter__number__container">
    <xsl:attribute name="font-size">60pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="color" select="$custom_blue_color"/>
  </xsl:attribute-set>
  
</xsl:stylesheet>