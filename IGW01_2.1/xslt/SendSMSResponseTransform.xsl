<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	 xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
	 xmlns:h="http://www.tibco.com/asg/protocols/http"
	 xmlns:asg="http://www.tibco.com/asg/error"
	 xmlns:c="http://www.tibco.com/schemas/asg/context"
	 xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable> 
	<xsl:template match="/">
		<SOAP-ENV:Envelope>
			<SOAP-ENV:Body>
			<ns0:SendSMSResponse xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/ServiceExposure/SendSMS">
				<xsl:copy-of select="$sbResponse/ns0:SendSMSResponse/*"/>
				</ns0:SendSMSResponse>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>