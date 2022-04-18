<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:asg="http://www.tibco.com/asg/error"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:c="http://www.tibco.com/schemas/asg/context"
	xmlns:m="http://www.tibco.com/asg/mapping"
	xmlns:h="http://www.tibco.com/asg/protocols/http"
	exclude-result-prefixes="xsl fn m h">
<xsl:param name="asgErrorCode"/>
<xsl:param name="asgErrorMessage"/>	
<xsl:param name="messageId"/>
<xsl:param name="text"/>
<xsl:param name="faultCode"/>
<xsl:param name="faultString"/>
<xsl:param name="faultActor"/>	
<xsl:template match="/">
<xsl:variable name="varasgErrorCode" select="$asgErrorCode"/>
<xsl:choose>
<xsl:when test="$varasgErrorCode= '2001' or $varasgErrorCode= '2002' or $varasgErrorCode= '2005' or $varasgErrorCode= '3001' or $varasgErrorCode= '3003' or $varasgErrorCode= '8016' or $varasgErrorCode= '9002'">
   <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
      <SOAP-ENV:Fault>
        <faultcode><xsl:value-of select="$faultCode"/></faultcode>
        <faultstring><xsl:value-of select="$faultString"/></faultstring>
        <faultactor><xsl:value-of select="$faultActor"/></faultactor>
        <detail xmlns="">
			<ns:policyException xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns="http://www.vodafone.com/vf/provisioningNotification/interface/v2_2_0" xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/">
				<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$messageId"/></ns1:messageId>
				<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$text"/></ns1:text>
				<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$asgErrorMessage"/></ns1:variables>
			</ns:policyException>
		</detail>
      </SOAP-ENV:Fault>
    </SOAP-ENV:Body>
   </SOAP-ENV:Envelope>
</xsl:when>
<xsl:otherwise>
   <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
    <SOAP-ENV:Body>
      <SOAP-ENV:Fault>
        <faultcode><xsl:value-of select="$faultCode"/></faultcode>
        <faultstring><xsl:value-of select="$faultString"/></faultstring>
        <faultactor><xsl:value-of select="$faultActor"/></faultactor>
        <detail xmlns="">
			<ns:serviceException xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:ns="http://www.vodafone.com/vf/provisioningNotification/interface/v2_2_0" xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/">
				<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$messageId"/></ns1:messageId>
				<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$text"/></ns1:text>
				<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1"><xsl:value-of select="$asgErrorMessage"/></ns1:variables>
			</ns:serviceException>
		</detail>
      </SOAP-ENV:Fault>
    </SOAP-ENV:Body>
   </SOAP-ENV:Envelope>
</xsl:otherwise>
</xsl:choose>
</xsl:template>
</xsl:stylesheet>
