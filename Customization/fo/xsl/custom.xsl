<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format" 
  xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
  xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder" version="2.0">
  <xsl:import href="static-content.xsl"/>
  <xsl:import href="layout-masters.xsl"/>
  <xsl:import href="toc.xsl"/>
  <xsl:import href="fo-dl-as-dl.xsl"/>
  <!-- This is the default, but you can set the margins individually below. -->
  <xsl:variable name="page-margins">15mm</xsl:variable>
  <!--
        Front cover customization.
        Oxygen logo and product name 
    -->
  <xsl:template name="createFrontCoverContents">
    <fo:block 
      space-before="85mm" 
      space-before.conditionality="retain" 
      font-size="26pt"            
      font-family="Helvetica, Arial Unicode MS, Tahoma, Batang">            
      <!-- Table with logo and product name. -->
      <fo:table>
        <fo:table-column column-number="1" column-width="50mm"/>
        <fo:table-column column-number="2" column-width="160mm"/>
        <fo:table-body>
          <fo:table-row>
            <fo:table-cell text-align="right" start-indent="20mm">
              <fo:block>                                
                <fo:external-graphic src="
                  url({concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/cover_logo.png')})"/>
              </fo:block>
            </fo:table-cell>
            <fo:table-cell padding="1mm" text-align="left" color="white">
              <fo:block-container start-indent="5mm" color="white">
                <!-- set the title -->
                <xsl:choose>
                  <xsl:when test="$map/*[contains(@class,' topic/title ')][1]">
                    <xsl:apply-templates select="$map/*[contains(@class,' topic/title ')][1]"/>
                  </xsl:when>
                  <xsl:when test="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]">
                    <xsl:apply-templates select="$map//*[contains(@class,' bookmap/mainbooktitle ')][1]"/>
                  </xsl:when>
                  <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                    <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                  </xsl:otherwise>
                </xsl:choose>
                
                <!-- set the subtitle -->
                <xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')]"/>
                
                <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                  <xsl:apply-templates select="$map//*[contains(@class,' bookmap/bookmeta ')]"/>
                </fo:block>                                
              </fo:block-container>
            </fo:table-cell>
          </fo:table-row>                    
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>
  
  <xsl:template name="startPageNumbering" as="attribute()*">
    <!--BS: uncomment if you need reset page numbering at first chapter-->
    <xsl:variable name="id" select="ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id"/>
    <xsl:variable name="mapTopic" select="key('map-id', $id)"/>
    <xsl:variable name="firstAncestorChapter"
      select="$mapTopic/ancestor-or-self::*[contains(@class, ' bookmap/chapter ')]"/>
    <xsl:if
      test="
        exists($firstAncestorChapter) and
        not($firstAncestorChapter/preceding::*[contains(@class, ' bookmap/chapter ')])">
      
      <xsl:attribute name="initial-page-number">1</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
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
