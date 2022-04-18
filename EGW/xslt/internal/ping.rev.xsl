<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    >

<xsl:output
    omit-xml-declaration="no"
    indent="yes"
    method="xml"
    />

<xsl:template match="/">
 <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
 </xsl:text>
 <html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   <title>Ping response</title>
  </head>
  <body>
    <p>ASG is alive</p>
  </body>
 </html>
</xsl:template>

</xsl:stylesheet>
