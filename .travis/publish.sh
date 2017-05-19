#!/bin/bash

echo "Publish $TRAVIS_BRANCH !"

java -version

echo "====================================="
echo "download DITA-OT 2.4"
echo "====================================="
wget https://github.com/dita-ot/dita-ot/releases/download/2.4/dita-ot-2.4.zip

echo "====================================="
echo "extract DITA-OT"
echo "====================================="
unzip dita-ot-2.4.zip >/dev/null

echo "===================================================="
echo "Copy PDF customization plugin to DITA-OT/plugins"
echo "===================================================="
mkdir dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug
cp -R Customization dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/Customization
cp -R fonts dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/fonts
cp -R lib dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/lib
cp build.xml dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/build.xml
cp fop.xconf dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/fop.xconf
cp integrator.xml dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/integrator.xml
cp plugin.xml dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/plugin.xml
cp pdf2ExtensionParameters.xml dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug/pdf2ExtensionParameters.xml

ls -la dita-ot-2.4/plugins/com.oxygenxml.pdf2.ug

echo "====================================="
echo "integrate plugins"
echo "====================================="
sh dita-ot-2.4/bin/dita --install

echo "======================================="
echo "Checkout oXygen User Manual"
echo "======================================="
git clone https://github.com/oxygenxml/userguide.git oXygen-ug
ls -la oXygen-ug/DITA/

echo "====================================="
echo "Transform the oXygen user manual to PDF, editor distribution"
echo "====================================="

export ANT_OPTS=-Xmx1524m
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/editor.ditaval -output=publishing/oXygen-ug/editor -Doxy-ug-distribution=editor

echo "====================================="
echo "Transform the oXygen user manual to PDF, author distribution"
echo "====================================="
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/author.ditaval -output=publishing/oXygen-ug/author -Doxy-ug-distribution=author

echo "====================================="
echo "Transform the oXygen user manual to PDF, developer distribution"
echo "====================================="
sh dita-ot-2.4/bin/dita -i oXygen-ug/DITA/UserManual.ditamap -f oxy-ug-pdf --filter=oXygen-ug/DITA/ditaval/developer.ditaval -output=publishing/oXygen-ug/developer -Doxy-ug-distribution=developer

cp gh-pages/index.html publishing/index.html
echo "====================================="
echo "List output file"
echo "====================================="
ls -la publishing
ls -la publishing/oXygen-ug/editor
