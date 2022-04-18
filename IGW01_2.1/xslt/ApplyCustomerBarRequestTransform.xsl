<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:req="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/RequestHeader" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:get="http://xmlns.vodafone.co.uk/map/til/Billing/CustomerBillProduction/GetBillList" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:set="http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/ApplyCustomerBar" xmlns:v="http://www.vodafone.com/vf/subscriptionBarring/interface/v.1.2"
xmlns:v1="http://www.vodafone.com/vf/subscriptionBarring/messages/v.1.2">


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

	<xsl:param name="GetPartnerNameFile" select="document('/opt/tibco/env/RIG2/conf/PartnerName.xml')"/>
	<xsl:variable name="GetSerialNumber">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='serialnumber']"/>
	</xsl:variable>
	<xsl:variable name="GetCAISsuer">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='caissuer']"/>
	</xsl:variable>


	<xsl:template match="/">
		<set:ApplyCustomerBarRequest xmlns="http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/ApplyCustomerBar">
			<set:CTN>
				<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:CTN"/>
			</set:CTN>
			<set:barName>
				<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:barName"/>
			</set:barName>
			<xsl:if test="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:authorityLevel">
				<set:authorityLevel>
					<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:authorityLevel"/>
				</set:authorityLevel>
			</xsl:if>
			<xsl:if test="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:userName">
				<set:userName>
					<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:userName"/>
				</set:userName>
			</xsl:if>
			<set:systemId>
				<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:systemId"/>
			</set:systemId>
			<xsl:if test="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:setPOA">
				<set:setPOA>
					<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:setPOA"/>
				</set:setPOA>
			</xsl:if>
			<xsl:if test="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:SPID">
				<set:SPID>
					<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Body/v:ApplyCustomerBar/v1:SPID"/>
				</set:SPID>
			</xsl:if>
		</set:ApplyCustomerBarRequest>
	</xsl:template>
</xsl:stylesheet>