# DITA-OT PDF2 Customization Plugin for oXygen User Guide 

This project represents a DITA-OT PFD2 customization plugin used 
to generate the oXygen user manual in the PDF format. 
It was tested with **DITA-OT 2.4**.

Project organization:

- **Customization** - This folder keeps the XSLT customization stylesheets, XML catalog and font font configuration;
- **fonts** - Contains the resources for the **Roboto** font;
- **lib** - some additional libraries needed to load SVG images
- **plugin.xml** - plugin descriptor file
- **build.xml, integrator.xml** - plugin build files
- **fop.xconf** - the configuration file for Apache FOP 

See more details about DITA-PT PDF2 plugin here http://www.dita-ot.org/2.4/dev_ref/pdf-customization.html.

You can use this PDF2 customization plugin please following the next steps:

1. Download a DITA-OT 2.4 version
2. Copy this customization plugin into the DITA-OT/plugins folder
3. Run the DITA-OT integrator

4. execute the next command
dita.bat -i d:/projects/oxygen-userguide-edit-link/DITA/UserManual.ditamap -f pdf2 -filter=d:/projects/oxygen-userguide-edit-link/DITA/editor.ditaval -output=d:/projects/oxygen-userguide-edit-link/output/pdf/editor -temp=d:/projects/oxygen-userguide-edit-link/temp/pdf/editor -Dpdf.formatter=fop -Dcustomization.dir=d:/projects/oxygen-userguide-edit-link/pdf_customization/editor -Dargs.fo.userconfig=d:/projects/oxygen-userguide-edit-link/pdf_customization/editor/fop.xconf -Dbasedir=d:/projects/oxygen-userguide-edit-link/DITA -Dclean.output=yes -Dclean.temp=yes  

dita.bat -i file:/D:/workspace/eXml/samples/dita/it-book/taskbook.ditamap -f oxy-ug-pdf -output=D:/workspace/eXml/samples/dita/it-book/out-pdf -Doxy-ug-distribution=author

dita.bat -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -f oxy-ug-pdf -output=D:/workspace/userguide-private/DITA/out-pdf --filter=D:/workspace/userguide-private/DITA/author.ditaval -Doxy-ug-distribution=author
