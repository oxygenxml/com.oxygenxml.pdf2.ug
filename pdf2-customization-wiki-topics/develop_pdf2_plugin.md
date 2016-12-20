## DITA OT and DITA OT PDF2 plugin overview

## DITA-OT

**DITA-OT** is an open-source publishing engine for XML content authored in DITA. It takes a set of **DITA** files as input and transform them in various outputs like:
* HTML5 or XHTML
* PDF
* Eclipse Help
* Java Help

**DITA-OT** has an extensible plug-in mechanism that allows you to add your own transformations and customize the default output.

## DITA-OT PDF2 plugin

The **DITA-OT** processor comes bundle with several plugins including the **DITA-OT PDF2** plugin. Like **DITA-OT**, the DITA-OT PDF2 plugin is implemented in Java, Ant and XSLT.

The DITA to PDF transformation is a multiple step transformation as you can see in the next diagram:
![](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/pdf2_plugin_overview.png)

* **DITA-OT pre-processing steps**

    The pre-processing steps typically runs at the beginning of every DITA-OT 
  transformation. At the end, they produce a ``_merged.xml`` merged file 
  that includes all referenced topics. You can read more about the pre-processing steps in the [DITA-OT documentation](http://www.dita-ot.org/2.4/dev_ref/DITA-OTPreprocess.html).

* **PDF2 plugin processing steps**

    These steps are converting the ``_merged.xml`` file to the ``topic.fo`` XSL-FO file. 
    These steps are part of the PDF2 plugin and all of they are described in the 
    [DITA-OT documentation](http://www.dita-ot.org/2.4/dev_ref/PdfDefault.html).
     
    The most important step is ``transform.topic2fo.main`` implemented with an XSLT transformation.
    It takes as input the ``stage1.xml`` (an improved version of merged file that contain 
    DITA elements with additional information for TOC or index) file and produces the ``stage2.fo``. 
    This step is important because the majority of PDF customizations are XSLT 
    extensions of this transformation.

* **XSL-FO to PDF step**
    
    This step outputs the final PDF file by processing the ``topic.fo`` XSL-FO file. 
    There are three XSL-FO processor that you can use in this step:
    * [Apache FOP](https://xmlgraphics.apache.org/fop/) - it is used in our customization
    * [Antenna House](https://www.antennahouse.com/antenna1/)
    * [RenderX XEP] (http://www.renderx.com/tools/xep.html)

## Related Information:
### DITA and DITA-OT
* [DITA 1.3 specification](https://www.oxygenxml.com/dita/1.3/specs/)
* [DITA-OT 2.4 documentation](http://www.dita-ot.org/2.4/)
* [DITA-OT Customizing PDF output](http://www.dita-ot.org/2.4/dev_ref/pdf-customization.html)

### XSLT and XSL-FO
* [XSL-FO specification](https://www.w3.org/TR/xsl/)
* [XSLT 2.0 specification](https://www.w3.org/TR/xslt20/)
* [XSL, XSL-FO FAQ](http://www.dpawson.co.uk/xsl/sect3/)