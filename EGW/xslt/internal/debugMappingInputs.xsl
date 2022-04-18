<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

<xsl:template match="/">
<nbRequest> 
  <xsl:variable name="nbRequestHref">
    <xsl:value-of select="/transformation/nbRequest/@href"/>
  </xsl:variable>
  <xsl:copy-of select="document($nbRequestHref)"/>
</nbRequest>   
<cnRequest> 
  <xsl:variable name="cnRequestHref">
    <xsl:value-of select="/transformation/cnRequest/@href"/>
  </xsl:variable>
  <xsl:copy-of select="document($cnRequestHref)"/>
</cnRequest>   
<cnResponse>
  <xsl:variable name="cnResponseHref">
    <xsl:value-of select="/transformation/cnResponse/@href"/>
  </xsl:variable>
  <xsl:copy-of select="document($cnResponseHref)"/>
</cnResponse>
<nbResponse>
  <xsl:variable name="nbResponseHref">
    <xsl:value-of select="/transformation/nbResponse/@href"/>
  </xsl:variable>
  <xsl:copy-of select="document($nbResponseHref)"/>
</nbResponse>
<context>
  <xsl:variable name="contextHref">
    <xsl:value-of select="/transformation/context/@href"/>
  </xsl:variable>
  <xsl:copy-of select="document($contextHref)"/>
</context>

</xsl:template>
</xsl:stylesheet>