<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus"  xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
<xsl:variable name="sbResponse">
      <xsl:if test="/transformation/sbResponse/@size>0">
         <xsl:copy-of select="document(/transformation/sbResponse/@href)"/>
      </xsl:if>
   </xsl:variable>
    <xsl:variable name="cnRequestHref"><xsl:value-of select="/transformation/cnRequest/@href"/></xsl:variable>
       <xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:for-each select="$sbResponse">
		<soapenv:Envelope>
      <soapenv:Header>
	   <head:Header>
                
                        <head:source>TIL</head:source>
						<head:sourceTimestamp><xsl:value-of select="current-dateTime()"/></head:sourceTimestamp>
						<head:transactionId><xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Header/head:Header/head:transactionId"/></head:transactionId>                
        </head:Header>	  
	  </soapenv:Header>
      <soapenv:Body>
			<xsl:copy>
				<xsl:apply-templates select="@* | node()"/>
			</xsl:copy>
</soapenv:Body>
    </soapenv:Envelope> 
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>  
        </xsl:copy>
    </xsl:template>
<xsl:template match="ns1:code/text()"><xsl:value-of select="substring-after(substring-after(.,'-'),'-')"/></xsl:template>
</xsl:stylesheet>