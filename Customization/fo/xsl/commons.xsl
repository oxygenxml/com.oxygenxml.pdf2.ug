<?xml version="1.0" encoding="UTF-8"?>
<!--
    Override templates defined in the stylesheet:
    dita-ot-2.4/plugins/org.dita.pdf2/xsl/fo/commons.xsl
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- 
        Select the layout of the top level DITA map components like as
        chapter, appendix, notices. 
        
        The possible values are:
        * title-and-chapter - Title aligned in the left part and chapter number in the right
        * dita-ot-default - The default DITA-OT rendering
    -->
    <xsl:param name="pdf2.ug.chapter.header"/>
    
    <!-- 
        This template is used to layout the header components of the publication 
        top level parts like: chapter, appendix, appendices, preface notices.
    -->
    <xsl:template match="*" mode="insertChapterFirstpageStaticContent">
        <xsl:param name="type" as="xs:string"/>
        
        <fo:block>
            <xsl:attribute name="id">
                <xsl:call-template name="generate-toc-id"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="$type = 'chapter'">
                    <xsl:choose>
                        <!-- Default DITA-OT rendering -->
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                            <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                                <xsl:call-template name="getVariable">
                                    <xsl:with-param name="id" select="'Chapter with number'"/>
                                    <xsl:with-param name="params">
                                        <number>
                                            <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                            </fo:block>
                                        </number>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <!--  
                                title-and-chapter - Title aligned in the left part and chapter number in the right 
                            -->
                            <fo:block xsl:use-attribute-sets="pdf2.ug__chapter__frontmatter__number__container">
                                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                            </fo:block>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:when>
                <xsl:when test="$type = 'appendix'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Appendix with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'appendices'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Appendix with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:text>&#xA0;</xsl:text>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'part'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Part with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'preface'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Preface title'"/>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'notices'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Notices title'"/>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
            </xsl:choose>
        </fo:block>
    </xsl:template>
    
    <!--  Bookmap Chapter processing  -->
    <xsl:template name="processTopicChapter">
        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.body">
            <xsl:call-template name="startPageNumbering"/>
            <xsl:call-template name="insertBodyStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:variable name="level" as="xs:integer">
                        <xsl:apply-templates select="." mode="get-topic-level"/>
                    </xsl:variable>
                    <xsl:if test="$level eq 1">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                            <xsl:for-each select="$topicref">
                                <xsl:apply-templates select="." mode="topicTitleNumber"/>
                            </xsl:for-each>
                        </fo:marker>
                        <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                    </xsl:if>
                    
                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
                    <xsl:choose>
                        <!-- The default DITA-OT processing -->
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                            
                            <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
                                <xsl:with-param name="type" select="'chapter'"/>
                            </xsl:apply-templates>
                            
                            <fo:block xsl:use-attribute-sets="topic.title">
                                <xsl:call-template name="pullPrologIndexTerms"/>
                                <xsl:for-each select="*[contains(@class,' topic/title ')]">
                                    <xsl:apply-templates select="." mode="getTitle"/>
                                </xsl:for-each>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:table inline-progression-dimension="100%" 
                                table-layout="fixed" xsl:use-attribute-sets="pdf2.ug.chapter.name.and.number"
                                >
                                <fo:table-column column-label="1" column-width="90%"/>
                                <fo:table-column column-label="2" column-width="10%"/>
                                <fo:table-body>
                                    <fo:table-row>
                                        <fo:table-cell display-align="center" text-align="left">
                                            <fo:block xsl:use-attribute-sets="pdf2.ug.topic.title">
                                                <xsl:call-template name="pullPrologIndexTerms"/>
                                                <xsl:for-each select="*[contains(@class,' topic/title ')]">
                                                    <xsl:apply-templates select="." mode="getTitle"/>
                                                </xsl:for-each>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell display-align="center" text-align="right">
                                            <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
                                                <xsl:with-param name="type" select="'chapter'"/>
                                            </xsl:apply-templates>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="$chapterLayout='BASIC'">
                            <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                contains(@class, ' topic/prolog '))]"/>
                            <!--xsl:apply-templates select="." mode="buildRelationships"/-->
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:apply-templates select="*[contains(@class,' topic/topic ')]"/>
                    <xsl:call-template name="pullPrologIndexTerms.end-range"/>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>
</xsl:stylesheet>