<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
    version="1.0">
    
    <xsl:import href="toc-attr.xsl"/>
    <xsl:import href="index-attr.xsl"/>
    
    <xsl:variable name="custom_blue_color">rgb(56,111,218)</xsl:variable>
  
  <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
  <xsl:variable name="page-width">215.9mm</xsl:variable>
  <xsl:variable name="page-height">279.4mm</xsl:variable>
    
   <xsl:attribute-set name="__body__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-right">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__even__header">
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-left">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-right">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__even__header">
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-left">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__odd__header">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-right">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__index__even__header">
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="margin-left">40pt</xsl:attribute>
        <xsl:attribute name="margin-top">35pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
    </xsl:attribute-set>

    <xsl:attribute-set name="__chapter__frontmatter__number__container">
        <!-- OXYGEN PATCH START EXM-18943 -->
        <xsl:attribute name="font-size">30pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-18943 -->
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="pre" use-attribute-sets="base-font common.block">
        <xsl:attribute name="white-space-treatment">preserve</xsl:attribute>
        <xsl:attribute name="white-space-collapse">false</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
        <!--<xsl:attribute name="background-color">#f0f0f0</xsl:attribute>-->
        <xsl:attribute name="font-family">monospace</xsl:attribute>
        <!-- OXYGEN PATCH START EXM-24438 -->
        <xsl:attribute name="font-size">7pt</xsl:attribute>
        <!-- OXYGEN PATCH END EXM-24438 -->
        <xsl:attribute name="line-height">106%</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Added for customize the front cover -->
    <xsl:attribute-set name="region-body__frontmatter.odd">        
        <!--<xsl:attribute name="background-color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>-->
        <xsl:attribute name="background-image">url(<xsl:value-of select="concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/cover_background.svg')"/>)</xsl:attribute>

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
    
    <!-- Book Title -->
    <xsl:attribute-set name="__frontmatter__mainbooktitle">
        <xsl:attribute name="space-before">1mm</xsl:attribute>        
        <xsl:attribute name="font-size">30pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Book Subtitle -->
    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">24pt</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
        <xsl:attribute name="font-family">roboto-light</xsl:attribute>
    </xsl:attribute-set>
    
    <!--
        Set the 'force-page-count' attribute to auto. We don't want to impose that chapters to start on odd page
    -->
    <xsl:attribute-set name="__force__page__count">
        <xsl:attribute name="force-page-count">auto</xsl:attribute>
           <!--<xsl:attribute name="force-page-count">
            <xsl:choose>
                <xsl:when test="/*[contains(@class, ' bookmap/bookmap ')]">
                    <xsl:value-of select="'even'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'auto'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>-->
    </xsl:attribute-set>
</xsl:stylesheet>