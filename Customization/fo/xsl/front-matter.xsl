<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder" version="2.0">
    
    <!--
        Front cover customization.
        A table with oXygen logo and product name 
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
                                <xsl:variable name="coverImageName">
                                    <xsl:choose>
                                        <xsl:when test="$oxy-ug-distribution eq 'author'">author_cover_logo.png</xsl:when>
                                        <xsl:when test="$oxy-ug-distribution eq 'developer'">developer_cover_logo.png</xsl:when>
                                        <xsl:otherwise>editor_cover_logo.png</xsl:otherwise>
                                    </xsl:choose>                  
                                </xsl:variable>                
                                <fo:external-graphic src="
                                    url({concat($artworkPrefix, '/Customization/OpenTopic/common/artwork/', $coverImageName)})"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell padding="1mm" text-align="left" color="white">
                            <fo:block-container start-indent="5mm" color="white">
                                <fo:block>
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
                                </fo:block>
                            </fo:block-container>
                        </fo:table-cell>
                    </fo:table-row>                    
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>