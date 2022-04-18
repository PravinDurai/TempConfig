<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:sen="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/ServiceExposure/SendSMS"
xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:v1="http://www.vodafone.com/vf/discountCodeManagement/messages/v.1.1"
xmlns:v="http://www.vodafone.com/vf/discountCodeManagement/interface/v.1.1">

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/cnRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>	
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>

	<xsl:template match="/">
		<sen:SendSMSRequest xmlns:sen="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/ServiceExposure/SendSMS">
				<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/sen:SendSMSRequest/*"/>
		</sen:SendSMSRequest>
	</xsl:template>
</xsl:stylesheet>