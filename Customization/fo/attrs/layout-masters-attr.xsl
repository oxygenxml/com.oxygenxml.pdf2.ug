<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
    version="1.0">
    
    <!-- 
        Front cover customization.
        
        Sets a background image for the front cover page.
    -->
    <xsl:attribute-set name="region-body__frontmatter.odd">        
        <xsl:attribute name="background-image">
            <xsl:choose>
                <xsl:when test="$oxy-ug-distribution eq 'author'">url(<xsl:value-of select="concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/author_cover_background.svg')"/>)</xsl:when>
                <xsl:when test="$oxy-ug-distribution eq 'developer'">url(<xsl:value-of select="concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/developer_cover_background.svg')"/>)</xsl:when>
                <xsl:otherwise>url(<xsl:value-of select="concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/editor_cover_background.svg')"/>)</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        
        <xsl:attribute name="fox:background-image-width"><xsl:value-of select="$page-width"/></xsl:attribute>
        <xsl:attribute name="fox:background-image-height"><xsl:value-of select="$page-height"/></xsl:attribute>
        
        <xsl:attribute name="background-repeat">no-repeat</xsl:attribute>
        <xsl:attribute name="background-position-vertical">top</xsl:attribute>
        <xsl:attribute name="background-position-horizontal">left</xsl:attribute>
        
        <xsl:attribute name="margin-top">0mm</xsl:attribute>
        <xsl:attribute name="margin-bottom">0mm</xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">0mm</xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">0mm</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>