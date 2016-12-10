# Customizing the chapter's first page

This topic describes a customization for DITA-OT PDF2 plugin to change the layout of the chapter's first page.

By default, the DITA-OT PDF2 plugin generates the chapter's first page with the next layout:
[[https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/chapter_first_page.PNG|alt=octocat]]

The first two lines presents a static label **Chapter** followed by the chapter's number. On the next line is displayed the chapter's title. After the chapter's title, the available space is divided in two columns. On the first column are presented the links to chapter's topics, this area is known as **MINITOC**. On the second column is presented the chapter's short description followed by the chapter's content.

We want to simplify the first part of the page to presents the chapter's title and its number on a single row followed by a thin line. Also, we want to change the presentation for **MINITOC** and chapter's summary, we want to present them in separate blocks, one after another like in the following picture:
[[https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/ug-chapter_first_page.PNG]]

To implement these requirements we need to override some XSLT templates that are responsible for the layout of the chapter's first page. All of these templates are defined in the `DITA-OT-2.4/plugins/org.dita.pdf2/xsl/fo/commons.xsl` file. Thus, I will create a similar XSLT stylesheet in the plugin's customization folder with path: `com.oxygenxml.pdf2.ug/Customization/fo/xsl/commons.xsl`. This is a convention that helps you to identify the original file from where the templates were copied if you want to change them or you find issues in the future.

You can find below the XSLT templates that should be overridden in order to accomplish this task: 
* `<xsl:template match="*" mode="insertChapterFirstpageStaticContent">`

    The default implementation of this template generated the static text Chapter and the chapter's number on separate rows.
This template will be changed to generate only the chapter's number.

* `<xsl:template name="processTopicChapter">`

    This is the template that process the entire chapter. We'll change the first part of the template, associated with chapter's title and number to generate a table with a row and two cell. The former cell will render the chapter's title and the second will be used for its number.
    [[https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/chapter_number_transform.png]]
    In the same way, we'll override other XSLT templates like **processTopicNotices**, **processTopicAppendix** or **processFrontMatterTopic** because they are used for top level topics like **notices**, **appendix** allowed in a DITA bookmap. These topics have a similar rendering like chapter.

* `<xsl:template match="\*" mode="createMiniToc">`

    This template is used to generate the **MINITOC** area. In the left part are presented links to chapter's topics and in the right part is presented the chapter's content. 

    We'll change this template to generate the both areas one after another like in the next picture:
    [[https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/pdf2-customization-wiki-topics/images/minitoc_transform.PNG]]

You can see all these changes on the GITHUB project associated with this customization: [com.oxygenxml.pdf2.ug/Customization/fo/xsl/commons.xsl](https://github.com/radu-pisoi/com.oxygenxml.pdf2.ug/blob/master/Customization/fo/xsl/commons.xsl).
