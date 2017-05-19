# DITA-OT PDF Customization Plugin for oXygen User Manual 

This project represents a **DITA-OT PFD** customization plugin used to generate the user manual for oXygen XML Editor in the PDF format. It was tested with the **DITA-OT 2.4** processor.

This project uses [Travis CI](https://travis-ci.org/) for continuous integration, so a PDF sample is generated whenever the customization is modified. You can view the results of this customization by opening one of the following recently generated PDFs:
* [oXygen XML Editor User Manual](https://oxygenxml.github.io/com.oxygenxml.pdf2.ug/oXygen-ug/editor/UserManual.pdf)
* [oXygen XML Author User Manual](https://oxygenxml.github.io/com.oxygenxml.pdf2.ug/oXygen-ug/author/UserManual.pdf)
* [oXygen XML Developer User Manual](https://oxygenxml.github.io/com.oxygenxml.pdf2.ug/oXygen-ug/developer/UserManual.pdf)

All the customizations that are allowed by this plugin are described in detail in its [GitHub Wiki pages](https://github.com/oxygenxml/com.oxygenxml.pdf2.ug/wiki).

Project organization:

- **Customization** - This folder contains the XSLT customization stylesheets, XML catalog, and font configuration.
- **fonts** - This folder contains the resources for the **Roboto** font that we use for our customization.
- **lib** - This folder contains some additional libraries needed to load SVG images.
- **plugin.xml** - The plugin descriptor file.
- **build.xml, integrator.xml** - The plugin build files.
- **fop.xconf** - The configuration file for the Apache FOP.


To use this PDF customization plugin, follow these steps:

1. Download **DITA-OT 2.4** 
2. Download the ZIP archive associated with this project by using the ``Clone or download`` button.
3. Install the plugin by running the command ``dita-ot-dir/bin/dita --install=plug-in-zip``. See more details in the [Installing plug-ins](http://www.dita-ot.org/2.4/dev_ref/plugins-installing.html) topic from the DITA-OT documentation.
4. Invoke the PDF transformation using the **oxy-ug-pdf** transtype in a command, as in the following example:

dita.bat -i file:/D:/workspace/userguide-private/DITA/UserManual.ditamap -f oxy-ug-pdf -output=D:/workspace/userguide-private/DITA/out-pdf --filter=D:/workspace/userguide-private/DITA/author.ditaval -Doxy-ug-distribution=author

This project is licensed under the Apache License 2.0. For details, see the [LICENSE](https://github.com/oxygenxml/com.oxygenxml.pdf2.ug/blob/master/LICENSE) file at the top of this repository.
