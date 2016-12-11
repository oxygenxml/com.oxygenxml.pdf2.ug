# Custom fonts

Changing the fonts is one of the most common customization issue 
when configuring the PDF output. The majority of companies use a set of fonts in 
their documents, and they want to use they for PDF too.

In our case, we'll use the [Google Roboto](https://fonts.google.com/specimen/Roboto) font. 
The resources associated with this font are located in the fonts directory.

## Configuring the Apache FOP to use the Roboto font

The Appache FOP processor allows you to specify a directory for fonts. 
Moreover, you can configure it to scan recursively this fonts directory. 

This is possible through the Apache FOP configuration file, in the *fonts* section:

```
<fonts>
    <!-- register all the fonts found in a directory -->
    <directory>C:\MyFonts1</directory>

    <!-- register all the fonts found in a directory and all of its sub directories (use with care) -->
    <directory recursive="true">C:\MyFonts2</directory>

    <!-- automatically detect operating system installed fonts -->
    <auto-detect/>
</fonts>

```
See more details in the [Bulk Font Configuration](https://xmlgraphics.apache.org/fop/2.1/fonts.html#bulk) 
section from the Apache FOP documentation.

In our customization, the Apache FOP configuration file is named **fop.xconf** and 
it is located in the project root directory.

## Customize the PDF2 plugin to use the Roboto font

The PDF2 plugin uses a font mapping mechanism which basically means that you don't refer 
physical fonts in your XSL-FO file. Instead, in the XSL-FO file you will be use logical fonts, 
or aliases, and they will be replaced with references to the physical fonts by looking 
in the font-mappings.xmlfont-mappings.xml file which is located in the ``Customization/fo/`` folder.

Shortly, this process has the following steps:

1. The XSLT stylesheets used to generate the XSL-FO output contain code like this:
    ```
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
    ```
    The font-family is defined to be ``sans-serif``, but ``sans-serif`` is just an alias. 
    It is not a physical font name. 
2. Therefore, another stage in the PDF generation takes this ``sans-serif`` alias and looks in the ``font-mappings.xml``.

   If it finds a mapping like this:
        ```
        <aliases>
              <alias name="sans-serif">Sans</alias>
         </aliases>
        ``` 
        
3. Then, it looks to see if the ``Sans`` has a logical-font definition and if so, 
    it will use the physical-font specified there:
    ````
    <logical-font name="Sans">
      <physical-font char-set="default">
        <font-face>Roboto, Helvetica, Arial Unicode MS, Tahoma, Batang, SimSun</font-face>
      </physical-font>
    ............
    </logical-font>
    ````
    You see that the first referenced font is ``Roboto``, so it will be preferred for rendering characters. 
    If there is any character that cannot be rendered with Roboto, then the next referenced font will be used (Helvetica in our case)
    and so on.
     

**Important**:
If no alias mapping is found for a font-family specified in the XSLT stylesheets, the processing defaults to Helvetica.

Related information:
[Font configuration in PDF2](http://www.elovirta.com/2016/02/18/font-configuration-in-pdf2.html)