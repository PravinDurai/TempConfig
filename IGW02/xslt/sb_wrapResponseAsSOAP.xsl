<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

<xsl:template match="/">
  <xsl:variable name="sbResponseHref">
    <xsl:value-of select="/transformation/sbResponse/@href"/>
  </xsl:variable>
  <xsl:choose xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
    <xsl:when test="count(document($sbResponseHref)/soap:Envelope/soap:Body)=1">
      <xsl:copy-of select="document($sbResponseHref)"/>
    </xsl:when>
    <xsl:otherwise>
      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<soapenv:Header>
	</soapenv:Header>
	<soapenv:Body>
	  <xsl:copy-of select="document($sbResponseHref)"/>
	</soapenv:Body>
      </soapenv:Envelope>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>
</xsl:stylesheet>