<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="*" mode="insertChapterFirstpageStaticContent">
        <xsl:param name="type" as="xs:string"/>
        <fo:block>
            <xsl:attribute name="id">
                <xsl:call-template name="generate-toc-id"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="$type = 'chapter'">
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
</xsl:stylesheet>