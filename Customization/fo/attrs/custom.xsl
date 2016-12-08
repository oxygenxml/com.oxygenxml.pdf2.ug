<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions" version="1.0">

    <xsl:import href="layout-masters-attr.xsl"/>
    <xsl:import href="toc-attr.xsl"/>
    <xsl:import href="index-attr.xsl"/>

    <xsl:import href="static-content-attr.xsl"/>
    <xsl:import href="commons-attr.xsl"/>

    <!-- Custom blue color used in chapter's first page, TOC, appendix -->
    <xsl:variable name="custom_blue_color">rgb(56,111,218)</xsl:variable>

    <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
    <xsl:variable name="page-width">215.9mm</xsl:variable>
    <xsl:variable name="page-height">279.4mm</xsl:variable>

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

    <!-- Book Title -->
    <xsl:attribute-set name="__frontmatter__mainbooktitle">
        <xsl:attribute name="space-before">1mm</xsl:attribute>
        <xsl:attribute name="font-size">30pt</xsl:attribute>
    </xsl:attribute-set>

    <!-- Book Subtitle, increase font size -->
    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">24pt</xsl:attribute>
    </xsl:attribute-set>

    <!--
        Set the 'force-page-count' attribute to auto. 
        We don't want to impose that chapters to start on odd page
    -->
    <xsl:attribute-set name="__force__page__count">
        <xsl:attribute name="force-page-count">auto</xsl:attribute>
    </xsl:attribute-set>
</xsl:stylesheet>
