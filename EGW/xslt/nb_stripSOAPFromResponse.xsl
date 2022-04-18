<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

<xsl:template match="/">
  <xsl:variable name="cnResponseHref">
    <xsl:value-of select="/transformation/cnResponse/@href"/>
  </xsl:variable>
  <xsl:choose xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <xsl:when test="count(document($cnResponseHref)/soap:Envelope/soap:Body)=1">
      <xsl:copy-of select="document($cnResponseHref)/soap:Envelope/soap:Body/*"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="document($cnResponseHref)"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>