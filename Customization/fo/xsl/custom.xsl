<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" 
  xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
  xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder" version="2.0">
  <!-- Front cover -->
  <xsl:import href="front-matter.xsl"/>
  <xsl:import href="static-content.xsl"/>
  <xsl:import href="layout-masters.xsl"/>
  <xsl:import href="fo-dl-as-dl.xsl"/>
  <xsl:import href="commons.xsl"/>
  <xsl:import href="preface.xsl"/>
  
  <!-- 
    The current distribution to generate manual. 
    Can be 'editor', 'developer' or 'author'.
  -->
  <xsl:param name="oxy-ug-distribution" select="'editor'"/>
  
  
  <!-- This is the default, but you can set the margins individually below. -->
  <xsl:variable name="page-margins">15mm</xsl:variable>
 
  <!--
    Add a small space after and before the inline images.
  -->
  <xsl:template match="*[contains(@class, ' topic/image ')]">
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-startprop ')]"
      mode="outofline"/>
    <xsl:choose>
      <xsl:when test="empty(@href)"/>
      <xsl:when test="@placement = 'break'">
        <fo:block xsl:use-attribute-sets="image__block">
          <xsl:call-template name="commonattributes"/>
          <xsl:apply-templates select="." mode="placeImage">
            <xsl:with-param name="imageAlign" select="@align"/>
            <xsl:with-param name="href"
              select="
                if (@scope = 'external' or opentopic-func:isAbsolute(@href)) then
                  @href
                else
                  concat($input.dir.url, @href)"/>
            <xsl:with-param name="height" select="@height"/>
            <xsl:with-param name="width" select="@width"/>
          </xsl:apply-templates>
        </fo:block>
        <xsl:if test="$artLabel = 'yes'">
          <fo:block>
            <xsl:apply-templates select="." mode="image.artlabel"/>
          </fo:block>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <fo:inline xsl:use-attribute-sets="image__inline">
          <xsl:call-template name="commonattributes"/>
          <xsl:variable name="inlineImage">
            <xsl:apply-templates select="." mode="placeImage">
              <xsl:with-param name="imageAlign" select="@align"/>
              <xsl:with-param name="href"
                select="
                  if (@scope = 'external' or opentopic-func:isAbsolute(@href)) then
                    @href
                  else
                    concat($input.dir.url, @href)"/>
              <xsl:with-param name="height" select="@height"/>
              <xsl:with-param name="width" select="@width"/>
            </xsl:apply-templates>
          </xsl:variable>
          <xsl:apply-templates select="$inlineImage" mode="fix-inline-images-space"/>
        </fo:inline>
        <xsl:if test="$artLabel = 'yes'">
          <xsl:apply-templates select="." mode="image.artlabel"/>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="*[contains(@class, ' ditaot-d/ditaval-endprop ')]" mode="outofline"
    />
  </xsl:template>
  <xsl:template match="node() | @*" mode="fix-inline-images-space">
    <xsl:copy>
      <xsl:apply-templates select="node() | @*" mode="fix-inline-images-space"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="fo:external-graphic" mode="fix-inline-images-space">
    <xsl:copy>
      <!--<xsl:attribute name="space-start">1mm</xsl:attribute>-->
      <xsl:attribute name="space-end">1mm</xsl:attribute>
      <xsl:apply-templates select="@*" mode="fix-inline-images-space"/>
      <xsl:apply-templates select="node()" mode="fix-inline-images-space"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
