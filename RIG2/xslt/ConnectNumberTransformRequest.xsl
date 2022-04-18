<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/manageCustomerAccount/interface/v.1.1" 
xmlns:v1="http://www.vodafone.com/vf/manageCustomerAccount/messages/v.1.1"   xmlns:set = "http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/ConnectNumber"   xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties">

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
	<xsl:variable name="requestId">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-id"/>
	</xsl:variable>
	<xsl:variable name="GetPartnerName">
		<xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
	</xsl:variable>

	<xsl:template match="/">
		<details>
			<PartnerName><xsl:value-of select="$GetPartnerName"/></PartnerName>
			<BusinessKey>
				<Name>MSISDN</Name>
				<Value>
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:CTN"/>
				</Value>
			</BusinessKey>
			<RequestPayload>
				<set:ConnectNumberRequest>
					<set:pricePlan><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:pricePlan"/></set:pricePlan>
      	        <xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:topUpType">
					<set:topUpType><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:topUpType"/></set:topUpType>
				</xsl:if>
					<set:CTN><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:CTN"/></set:CTN>
					<set:SIM><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:SIM"/></set:SIM>
                <xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:callBarringCode">
					<set:callBarringCode><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:callBarringCode"/></set:callBarringCode>
				</xsl:if>					
                <xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:noVoicemail">
					<set:noVoicemail><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:noVoicemail"/></set:noVoicemail>
				</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:GPRSPricePlan">
					<set:GPRSPricePlan><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:GPRSPricePlan"/></set:GPRSPricePlan>
				</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:APN">
					<set:APN><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:ConnectNumber/v1:APN"/></set:APN>
				</xsl:if>
					</set:ConnectNumberRequest>
			</RequestPayload>
			<TargetOperation>ConnectNumber</TargetOperation>
		</details>
	</xsl:template>
</xsl:stylesheet>