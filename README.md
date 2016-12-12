# DITA-OT PDF2 Customization Plugin for oXygen User Manual 

This project represents a **DITA-OT PFD2** customization plugin used to generate the user manual for oXygen XML Editor in the PDF format. It was tested with **DITA-OT 2.4** processor.

This project uses [Travis CI](https://travis-ci.org/) for continuous integration, so a PDF sample is generated whenever the customization was changed. You can view the result of this customization by opening the last generated PDFs:
* [oXygen XML Editor User Manual](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/gh-pages/oXygen-ug/editor/UserManual.pdf)
* [oXygen XML Author User Manual](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/gh-pages/oXygen-ug/author/UserManual.pdf)
* [oXygen XML Developer User Manual](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/gh-pages/oXygen-ug/developer/UserManual.pdf)

Project organization:

- **Customization** - This folder keeps the XSLT customization stylesheets, XML catalog and font configuration;
- **fonts** - Contains the resources for the **Roboto** font;
- **lib** - some additional libraries needed to load SVG images
- **plugin.xml** - plugin descriptor file
- **build.xml, integrator.xml** - plugin build files
- **fop.xconf** - the configuration file for Apache FOP 


To use this PDF2 customization plugin please follow the next steps:

1. Download **DITA-OT 2.4** 
2. Copy this customization plugin into the **DITA-OT/plugins** folder
3. Run the **DITA-OT integrator**
4. Invoke the PDF transformation using the **oxy-ug-pdf** transtype. A sample is:

dita.bat -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -f oxy-ug-pdf -output=D:/workspace/userguide-private/DITA/out-pdf --filter=D:/workspace/userguide-private/DITA/author.ditaval -Doxy-ug-distribution=author
