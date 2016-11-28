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
        * title-and-chapter-number - Title aligned in the left part and chapter number in the right
        * dita-ot-default - The default DITA-OT rendering
    -->
    <xsl:param name="pdf2.ug.chapter.header"/>
    
    <!-- 
        Select the layout of the chapter's minitoc
        
        The possible values are:
        * block - The blocks with chapter links and chapter descriptions will be layout in two separate blocks, 
          one after other.
        * dita-ot-default - The default DITA-OT rendering with a table layout with one row with two cells. 
          The first cell presents links to the chapter's topics and the second cell presents a short description of the chapter.
    -->
    <xsl:param name="pdf2.ug.chapter.minitoc.layout"/>
    
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
                                title-and-chapter-number - Title aligned in the left part and chapter number in the right 
                            -->
                            <fo:block xsl:use-attribute-sets="pdf2.ug__chapter__frontmatter__number__container">
                                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                            </fo:block>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </xsl:when>
                <xsl:when test="$type = 'appendix'">
                    <xsl:choose>
                        <!-- Default DITA-OT processing -->
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
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
                        <xsl:otherwise>
                            <!--  
                                title-and-appendix-number - Title aligned in the left part and appendix number in the right 
                            -->
                            <fo:block xsl:use-attribute-sets="pdf2.ug__chapter__frontmatter__number__container">
                                <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                            </fo:block>
                        </xsl:otherwise>
                    </xsl:choose>
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
    
    <!--  
        Bookmap Chapter processing  
    -->
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
    
    <!-- Process bookmap notices -->
    <xsl:template name="processTopicNotices">
        <xsl:variable name="atts" as="element()">
            <xsl:choose>
                <xsl:when test="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)/ancestor::*[contains(@class,' bookmap/backmatter ')]">
                    <dummy xsl:use-attribute-sets="page-sequence.backmatter.notice"/> 
                </xsl:when>
                <xsl:otherwise>
                    <dummy xsl:use-attribute-sets="page-sequence.notice"/> 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <fo:page-sequence master-reference="body-sequence">
            <xsl:copy-of select="$atts/@*"/>
            <xsl:call-template name="startPageNumbering"/>
            <xsl:call-template name="insertPrefaceStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:if test="empty(ancestor::*[contains(@class, ' topic/topic ')])">
                        <fo:marker marker-class-name="current-topic-number">
                            <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                            <xsl:for-each select="$topicref">
                                <xsl:apply-templates select="." mode="topicTitleNumber"/>
                            </xsl:for-each>
                        </fo:marker>
                        <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                    </xsl:if>
                    
                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>
                    
                    <!-- The default DITA-OT processing -->
                    <xsl:choose>
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                            <xsl:apply-templates select="." mode="insertChapterFirstpageStaticContent">
                                <xsl:with-param name="type" select="'notices'"/>
                            </xsl:apply-templates>
                        </xsl:when>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                            <fo:block xsl:use-attribute-sets="topic.title">
                                <xsl:call-template name="pullPrologIndexTerms"/>
                                <xsl:for-each select="*[contains(@class,' topic/title ')]">
                                    <xsl:apply-templates select="." mode="getTitle"/>
                                </xsl:for-each>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:block xsl:use-attribute-sets="pdf2.ug.topic.title pdf2.ug.chapter.name.and.number">
                                <xsl:call-template name="pullPrologIndexTerms"/>
                                <xsl:for-each select="*[contains(@class,' topic/title ')]">
                                    <xsl:apply-templates select="." mode="getTitle"/>
                                </xsl:for-each>
                            </fo:block>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:choose>
                        <xsl:when test="$noticesLayout='BASIC'">
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
    
    <xsl:template match="*" mode="createMiniToc">
        <xsl:choose>
            <xsl:when test="$pdf2.ug.chapter.minitoc.layout eq 'dita-ot-default'">
                <fo:table xsl:use-attribute-sets="__toc__mini__table">
                    <fo:table-column xsl:use-attribute-sets="__toc__mini__table__column_1"/>
                    <fo:table-column xsl:use-attribute-sets="__toc__mini__table__column_2"/>
                    <fo:table-body xsl:use-attribute-sets="__toc__mini__table__body">
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="__toc__mini">
                                    <xsl:if test="*[contains(@class, ' topic/topic ')]">
                                        <fo:block xsl:use-attribute-sets="__toc__mini__header">
                                            <xsl:call-template name="getVariable">
                                                <xsl:with-param name="id" select="'Mini Toc'"/>
                                            </xsl:call-template>
                                        </fo:block>
                                        <fo:list-block xsl:use-attribute-sets="__toc__mini__list">
                                            <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]" mode="in-this-chapter-list"/>
                                        </fo:list-block>
                                    </xsl:if>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="__toc__mini__summary">
                                <!--Really, it would be better to just apply-templates, but the attribute sets for shortdesc, body
                        and abstract might indent the text.  Here, the topic body is in a table cell, and should
                        not be indented, so each element is handled specially.-->
                                <fo:block>
                                    <xsl:apply-templates select="*[contains(@class,' topic/titlealts ')]"/>
                                    <xsl:if test="*[contains(@class,' topic/shortdesc ')
                                        or contains(@class, ' topic/abstract ')]/node()">
                                        <fo:block xsl:use-attribute-sets="p">
                                            <xsl:apply-templates select="*[contains(@class,' topic/shortdesc ')
                                                or contains(@class, ' topic/abstract ')]/node()"/>
                                        </fo:block>
                                    </xsl:if>
                                    <xsl:apply-templates select="*[contains(@class,' topic/body ')]/*"/>
                                    
                                    <xsl:if test="*[contains(@class,' topic/related-links ')]//
                                        *[contains(@class,' topic/link ')][not(@role) or @role!='child']">
                                        <xsl:apply-templates select="*[contains(@class,' topic/related-links ')]"/>
                                    </xsl:if>
                                    
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </xsl:when>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="pdf2.ug__toc__mini">
                    <xsl:if test="*[contains(@class, ' topic/topic ')]">
                        <fo:block xsl:use-attribute-sets="__toc__mini__header">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Mini Toc'"/>
                            </xsl:call-template>
                        </fo:block>
                        <fo:list-block xsl:use-attribute-sets="__toc__mini__list">
                            <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]" mode="in-this-chapter-list"/>
                        </fo:list-block>
                    </xsl:if>
                </fo:block>
                
                <fo:block xsl:use-attribute-sets="pdf2.ug__toc__mini__summary">
                    <xsl:apply-templates select="*[contains(@class,' topic/titlealts ')]"/>
                    <xsl:if test="*[contains(@class,' topic/shortdesc ')
                        or contains(@class, ' topic/abstract ')]/node()">
                        <fo:block xsl:use-attribute-sets="p">
                            <xsl:apply-templates select="*[contains(@class,' topic/shortdesc ')
                                or contains(@class, ' topic/abstract ')]/node()"/>
                        </fo:block>
                    </xsl:if>
                    <xsl:apply-templates select="*[contains(@class,' topic/body ')]/*"/>
                    
                    <xsl:if test="*[contains(@class,' topic/related-links ')]//
                        *[contains(@class,' topic/link ')][not(@role) or @role!='child']">
                        <xsl:apply-templates select="*[contains(@class,' topic/related-links ')]"/>
                    </xsl:if>
                    
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <!--  Bookmap Appendix processing  -->
    <xsl:template name="processTopicAppendix">
        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.appendix">
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
                                <xsl:with-param name="type" select="'appendix'"/>
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
                                                <xsl:with-param name="type" select="'appendix'"/>
                                            </xsl:apply-templates>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </fo:table-body>
                            </fo:table>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <xsl:choose>
                        <xsl:when test="$appendixLayout='BASIC'">
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
    
    <!-- Deprecated in 3.0: use mode="insertChapterFirstpageStaticContent" -->
    <xsl:template name="processFrontMatterTopic">
        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.frontmatter">
            <!-- Ideally would use existing template "insertFrontMatterStaticContents". Using "insertBodyStaticContents"
                  for compatibility with 2.3 and earlier; front matter version drops headers, page numbers. -->
            <xsl:call-template name="insertBodyStaticContents"/>
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
                    <xsl:choose>
                        <xsl:when test="$pdf2.ug.chapter.header eq 'dita-ot-default'">
                            <fo:block xsl:use-attribute-sets="topic.title">
                                <xsl:attribute name="id">
                                    <xsl:call-template name="generate-toc-id"/>
                                </xsl:attribute>
                                <xsl:call-template name="pullPrologIndexTerms"/>
                                <xsl:for-each select="child::*[contains(@class,' topic/title ')]">
                                    <xsl:apply-templates select="." mode="getTitle"/>
                                </xsl:for-each>
                            </fo:block>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:block xsl:use-attribute-sets="pdf2.ug.topic.title pdf2.ug.chapter.name.and.number">
                                <xsl:attribute name="id">
                                    <xsl:call-template name="generate-toc-id"/>
                                </xsl:attribute>
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
    
    <!-- 
        Reset page numbering at first chapter.
    -->
    <xsl:template name="startPageNumbering" as="attribute()*">
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
</xsl:stylesheet>