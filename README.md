This project represents a DITA-OT PFD2 customization plugin used to generate the oXygen user manual in PDF format.

It was tested with DITA-OT 2.4.

Project organization:
* Customization - This folder keeps the entire customization;
* fonts - Contains the resources for Roboto font;
* lib - some additional used to load SVG images
* plugin.xml - DITA-OT plugin file
* build.xml, integrator.xml - DITA-OT build file
* fop.xconf - Apache FOP configuration file

To use this PDF customization plugin please follow the next steps:

1. Download a DITA-OT 2.4 version
2. Copy this customization plugin into the DITA-OT/plugins folder
3. Run the DITA-OT integrator

4. execute the next command
dita.bat -i d:/projects/oxygen-userguide-edit-link/DITA/UserManual.ditamap -f pdf2 -filter=d:/projects/oxygen-userguide-edit-link/DITA/editor.ditaval -output=d:/projects/oxygen-userguide-edit-link/output/pdf/editor -temp=d:/projects/oxygen-userguide-edit-link/temp/pdf/editor -Dpdf.formatter=fop -Dcustomization.dir=d:/projects/oxygen-userguide-edit-link/pdf_customization/editor -Dargs.fo.userconfig=d:/projects/oxygen-userguide-edit-link/pdf_customization/editor/fop.xconf -Dbasedir=d:/projects/oxygen-userguide-edit-link/DITA -Dclean.output=yes -Dclean.temp=yes  

dita.bat -i file:/D:/workspace/eXml/samples/dita/it-book/taskbook.ditamap -f oxy-ug-pdf -output=D:/workspace/eXml/samples/dita/it-book/out-pdf -Doxy-ug-distribution=author

dita.bat -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -f oxy-ug-pdf -output=D:/workspace/userguide-private/DITA/out-pdf --filter=D:/workspace/userguide-private/DITA/author.ditaval -Doxy-ug-distribution=author

