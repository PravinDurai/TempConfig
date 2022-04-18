<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/subscriptionLifecycleManagement/interface/v.2.1" xmlns:v1="http://www.vodafone.com/vf/subscriptionLifecycleManagement/messages/v.2.1"  xmlns:set = "http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/GetSubscriptionInformation"   xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

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
		<set:GetSubscriptionInformationRequest>
			<xsl:if test="exists($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:msisdn)">
				<set:msisdn>
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:msisdn"/>
				</set:msisdn>
			</xsl:if>	
			<xsl:if test="exists($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:SIMSerialNumber)">
				<set:SIMSerialNumber>
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:SIMSerialNumber"/>
				</set:SIMSerialNumber>
			</xsl:if>	                
			<xsl:if test="exists($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:numberOfDays)">
				<set:numberOfDays>
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:numberOfDays"/>
				</set:numberOfDays>
			</xsl:if>	
			<set:dataCategory>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:dataCategory"/>
			</set:dataCategory>
		</set:GetSubscriptionInformationRequest>
	</xsl:template>
</xsl:stylesheet>