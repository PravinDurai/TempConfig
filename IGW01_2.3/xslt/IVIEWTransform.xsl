<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	 xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
	 xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
	 xmlns:h="http://www.tibco.com/asg/protocols/http"
	 xmlns:asg="http://www.tibco.com/asg/error"
	 xmlns:c="http://www.tibco.com/schemas/asg/context"
	 xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:variable name="context">
 <xsl:for-each select="/transformation/nbRequest">
  <xsl:copy-of select="document(@href)"/>
 </xsl:for-each>
</xsl:variable>
<xsl:template match="/">
<SOAP-ENV:Envelope>
<SOAP-ENV:Header>	
        <ns:Header>
                <xsl:for-each select="$context/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header[1]">
                        <ns:source>IVIEW</ns:source>
                        <xsl:copy-of select="ns:sourceTimestamp"/>
                        <xsl:copy-of select="ns:transactionId"/>
                        <xsl:copy-of select="ns:application"/>
                        <xsl:copy-of select="ns:messageId"/>
                        <xsl:copy-of select="ns:version"/>
                        <xsl:copy-of select="ns:custom"/>
                        <xsl:copy-of select="ns:Logon"/>
                        <xsl:copy-of select="ns:Property"/>
                </xsl:for-each>
  	</ns:Header>
	<xsl:copy-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security"/>  
</SOAP-ENV:Header>
<SOAP-ENV:Body>
    <xsl:copy-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/*"/>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
</xsl:template>
</xsl:stylesheet>