<?xml version='1.0'?>

<!-- 
Copyright © 2004-2006 by Idiom Technologies, Inc. All rights reserved. 
IDIOM is a registered trademark of Idiom Technologies, Inc. and WORLDSERVER
and WORLDSTART are trademarks of Idiom Technologies, Inc. All other 
trademarks are the property of their respective owners. 

IDIOM TECHNOLOGIES, INC. IS DELIVERING THE SOFTWARE "AS IS," WITH 
ABSOLUTELY NO WARRANTIES WHATSOEVER, WHETHER EXPRESS OR IMPLIED,  AND IDIOM
TECHNOLOGIES, INC. DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE AND WARRANTY OF NON-INFRINGEMENT. IDIOM TECHNOLOGIES, INC. SHALL NOT
BE LIABLE FOR INDIRECT, INCIDENTAL, SPECIAL, COVER, PUNITIVE, EXEMPLARY,
RELIANCE, OR CONSEQUENTIAL DAMAGES (INCLUDING BUT NOT LIMITED TO LOSS OF 
ANTICIPATED PROFIT), ARISING FROM ANY CAUSE UNDER OR RELATED TO  OR ARISING 
OUT OF THE USE OF OR INABILITY TO USE THE SOFTWARE, EVEN IF IDIOM
TECHNOLOGIES, INC. HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. 

Idiom Technologies, Inc. and its licensors shall not be liable for any
damages suffered by any person as a result of using and/or modifying the
Software or its derivatives. In no event shall Idiom Technologies, Inc.'s
liability for any damages hereunder exceed the amounts received by Idiom
Technologies, Inc. as a result of this transaction.

These terms and conditions supersede the terms and conditions in any
licensing agreement to the extent that such terms and conditions conflict
with those set forth herein.

This file is part of the DITA Open Toolkit project hosted on Sourceforge.net. 
See the accompanying license.txt file for applicable licenses.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    version="2.0">

    <xsl:attribute-set name="__toc__topic__content">
        <xsl:attribute name="color">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="$level = 1"><xsl:value-of select="$custom_blue_color"/></xsl:when>
                <xsl:otherwise>inherit</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__header" use-attribute-sets="common.title">
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__chapter__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__appendix__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>        
    </xsl:attribute-set>
        
    <xsl:attribute-set name="__toc__part__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__preface__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__notices__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Added for back compatibility since __toc__content was renamed into __toc__topic__content-->
    <xsl:attribute-set name="__toc__content" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>        
    </xsl:attribute-set>
    
    <xsl:attribute-set name="__toc__topic__content__booklist" use-attribute-sets="__toc__topic__content">
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="color"><xsl:value-of select="$custom_blue_color"/></xsl:attribute>        
    </xsl:attribute-set>

</xsl:stylesheet>