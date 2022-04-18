<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	 xmlns:ns="http://group.vodafone.com/contract/vho/header/v1" 
	 xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
	 xmlns:h="http://www.tibco.com/asg/protocols/http"
	 xmlns:asg="http://www.tibco.com/asg/error"
	 xmlns:c="http://www.tibco.com/schemas/asg/context"
	 xmlns:err="http://www.tibco.com/schemas/asg/error"
	 xmlns:asg_map="http://www.tibco.com/asg/mapping"
	 xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:variable name="context">
 <xsl:for-each select="/transformation/nbRequest">
  <xsl:copy-of select="document(@href)"/>
 </xsl:for-each>
</xsl:variable>
<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
</xsl:variable>
<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
</xsl:variable>
<xsl:variable name="System">
	<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Source/ns:System"/>
</xsl:variable>
<xsl:template match="/">
<xsl:choose>
	<xsl:when test="$System = 'BROADBANDAPP'">
		<asg_map:mapping-result>
			<asg_map:payload-xml>
				<xsl:copy-of select="$nbRequest/*"/>
			</asg_map:payload-xml>
		</asg_map:mapping-result>
	</xsl:when>	
	<xsl:otherwise>
		<asg_map:mapping-result>
			<asg_map:error>
				<err:errorCode>210</err:errorCode>
				<err:errorMessage>The system client is not authorize to execute the operation.</err:errorMessage>
			</asg_map:error>
		</asg_map:mapping-result>	
	</xsl:otherwise>
</xsl:choose> 
</xsl:template>
</xsl:stylesheet>