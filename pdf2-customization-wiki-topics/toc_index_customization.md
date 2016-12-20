# TOC and Index part

For the **TOC** and **Index** part we have proposed a small customization. We want to change the color for the **TOC**'s main chapters and for the grouping letter in the Index section.

Both customizations are quite easy to implement by specifying the ``color`` XSL-FO property in some attributes sets already defined in the **DITA-OT PDF2** plugin. 

The customization for **TOC** is implemented in the [com.oxygenxml.pdf2.ug/blob/master/Customization/fo/attrs/toc-attr.xsl](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/Customization/fo/attrs/toc-attr.xsl) stylesheet. For the **Index** part, please see the [com.oxygenxml.pdf2.ug/blob/master/Customization/fo/attrs/index-attr.xsl](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/Customization/fo/attrs/index-attr.xsl) stylesheet.

![](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/toc_index_customization.png)
