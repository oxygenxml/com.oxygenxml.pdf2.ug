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

    <!--
        Body static content footer: first, odd, and last
    -->    
    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:block 
                text-align="right"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em"
                >                                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>
                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:block 
                text-align-last="justify"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em">
                <fo:inline>
                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>

                <fo:leader leader-pattern="space"/>
                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>
                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:block 
                text-align-last="justify"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em">
                <fo:inline>
                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                </fo:inline>
                
                <fo:leader leader-pattern="space"/>
                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:block 
                text-align-last="justify"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em"
                >                                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>
                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <!--
        Body static content header: first, odd, and last
    -->    
    <xsl:template name="insertBodyFirstHeader"/>        
    <xsl:template name="insertBodyEvenHeader"/>        
    <xsl:template name="insertBodyOddHeader"/>
    
    <!--
        TOC header
    -->
    <xsl:template name="insertTocOddHeader"/>    
    <xsl:template name="insertTocEvenHeader"/>
    
    <!--
        TOC footer
    -->
    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer"><fo:block 
            text-align="right"
            start-indent="15mm"
            end-indent="15mm"
            margin-bottom="5mm"                
            font-size="1.2em"
            >                                
            <fo:inline>
                <fo:page-number/>
            </fo:inline>
            
        </fo:block></fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertTocEvenFooter">
        <fo:static-content flow-name="even-toc-footer"><fo:block 
            text-align="right"
            start-indent="15mm"
            end-indent="15mm"
            margin-bottom="5mm"                
            font-size="1.2em"
            >                                
            <fo:inline>
                <fo:page-number/>
            </fo:inline>
            
        </fo:block>
        </fo:static-content>
    </xsl:template>
    
    
    <xsl:template name="insertIndexOddHeader"/>
    <xsl:template name="insertIndexEvenHeader"/>
    
    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <fo:block 
                text-align="right"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em"
                >                                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>
                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
    <xsl:template name="insertIndexEvenFooter">
        <fo:static-content flow-name="even-index-footer">
            <fo:block 
                text-align="right"
                start-indent="15mm"
                end-indent="15mm"
                margin-bottom="5mm"                
                font-size="1.2em"
                >                                
                <fo:inline>
                    <fo:page-number/>
                </fo:inline>
                
            </fo:block>
        </fo:static-content>
    </xsl:template>
    
</xsl:stylesheet>