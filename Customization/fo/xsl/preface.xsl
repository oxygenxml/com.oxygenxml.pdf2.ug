<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    exclude-result-prefixes="opentopic"
    version="2.0">

     <xsl:template name="processTopicPreface">
         <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.preface">
             <xsl:call-template name="insertPrefaceStaticContents"/>
             <fo:flow flow-name="xsl-region-body">
                 <fo:block xsl:use-attribute-sets="topic">
                     <xsl:call-template name="commonattributes"/>
                     <xsl:if test="not(ancestor::*[contains(@class, ' topic/topic ')])">
                         <fo:marker marker-class-name="current-topic-number">
                             <xsl:number format="1"/>
                         </fo:marker>
                         <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                     </xsl:if>
                     <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
                     <xsl:if test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                         <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
                             <xsl:with-param name="type" select="'preface'"/>
                         </xsl:apply-templates>
                     </xsl:if>
                     <xsl:choose>
                         <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                             <fo:block xsl:use-attribute-sets="topic.title">
                                 <xsl:call-template name="pullPrologIndexTerms"/>
                                 <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                     <xsl:apply-templates select="." mode="getTitle"/>
                                 </xsl:for-each>
                             </fo:block>
                         </xsl:when>
                         <xsl:otherwise>
                             <fo:block xsl:use-attribute-sets="pdf2.ug.topic.title pdf2.ug.chapter.name.and.number">
                                 <xsl:call-template name="pullPrologIndexTerms"/>
                                 <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                     <xsl:apply-templates select="." mode="getTitle"/>
                                 </xsl:for-each>
                             </fo:block>
                         </xsl:otherwise>
                     </xsl:choose>
                     
                     <xsl:apply-templates select="*[not(contains(@class,' topic/title '))]"/>
                 </fo:block>
             </fo:flow>
         </fo:page-sequence>
    </xsl:template>

</xsl:stylesheet>