<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:req="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/RequestHeader" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:get="http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionPolicyManagement/GetBillingArrangementDetails" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">
	
	
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

	<xsl:variable name="GetSerialNumber">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='serialnumber']"/>
	</xsl:variable>
	<xsl:variable name="GetCAISsuer">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='caissuer']"/>
	</xsl:variable>
	
	
	<xsl:template match="/">
		<get:GetBillingArrangementDetailsRequest xmlns="http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionPolicyManagement/GetBillingArrangementDetails">
			<xsl:copy-of select="$cnRequest/soapenv:Envelope/soapenv:Body/get:GetBillingArrangementDetailsRequest/*"/>
		</get:GetBillingArrangementDetailsRequest>
	</xsl:template>
</xsl:stylesheet>