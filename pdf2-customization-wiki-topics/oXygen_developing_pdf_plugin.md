# Developing a PDF2 plugin with oXygen

This topic contains some tips you might find useful when you develop an PDF2 
customization plugin.

## Display the PDF transformation output console

The PDF transformation console is hidden by default because the majority of
users are not interested by the information displayed here. 
But, in case when you want to analyse or understand the how the PDF2 plugin works this 
console contains very useful information. You can display this console 
by going to the **Preferences / DITA** option page and select  
**Always** for **Show Console** Output option.

## Detect and set the XSLT master files for PDF2 plugin

The majority of PDF2 customization are made by extending XSLT transformation associated with
the 
[transform.topic2fo.main](http://www.dita-ot.org/2.4/dev_ref/PdfDefault.html) step. This means 
that you will write a set of XSLT files whose templates will overwrite templates from 
default XSLT transformation.

When you are editing these extension stylesheets it is important to keep them valid. 
Also it might be useful that content completion to present you all the gloval variables 
or parameters that you can use.

To achieve this, it is important to tell to oXygen XML Editor which are the main stylesheets
of the PDF2 plugin. This can be done by using the Master Files support, 
select the **org.dita.pdf2** folder from Project view and use the **Detect Master Files** 
contextual action. After the detection is done, the application will present you the possible 
master files leaving you the final decision. It is imporant to not 
select the stylesgeets with \_template.xsl prefix because they are not valid. 
They are XSLT templates files used by the DITA-OT integrator tool.

## Add the XML catalog from PDF2 customization in oXygen Preferences

The XML Catalog from PDF2 customization is used to redirect the 
URLs by the PDF2 plugin to the resources included in your customization. 
You can see from below entries how the 'cfg:fo/attrs/custom.xsl' URI is redirected 
to the 'fo/attrs/custom.xsl' stylesheet from your customization. 

```
<!-- Custom attributes entry -->
<uri name="cfg:fo/attrs/custom.xsl" uri="fo/attrs/custom.xsl"/>

<!-- Custom XSL code entry.-->
<uri name="cfg:fo/xsl/custom.xsl" uri="fo/xsl/custom.xsl"/>
```

Please see more details about this mechanism in 
the [PDF plug-in structure](http://www.dita-ot.org/2.4/dev_ref/pdf-plugin-structure.html) 
topic from the DITA-OT documentation.

You can add this XML Catalog file in oXygen by going to 'XML / XML Catalog' options page.
