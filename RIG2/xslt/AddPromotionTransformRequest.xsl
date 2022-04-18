<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/promotionManagement/interface/v.1.1" 
xmlns:v1="http://www.vodafone.com/vf/promotionManagement/messages/v.1.1"   xmlns:set = "http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/AddPromotion"   xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:intr="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Interaction" xmlns:ch="http://xmlns.vodafone.co.uk/map/til/Common/Channel" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties">

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
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:msisdn"/>
				</Value>
			</BusinessKey>
			<RequestPayload>
				<set:AddPromotionRequest>
					<set:msisdn>
						<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:msisdn"/>
					</set:msisdn>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:channel">
						<set:channel>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:channel"/>
						</set:channel>
					</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:sendSMS">
						<set:sendSMS>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:sendSMS"/>
						</set:sendSMS>
					</xsl:if>
					<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/v1:promotion">
						<set:promotion>
							<set:promotionId>
								<xsl:value-of select="v1:promotionId"/>
							</set:promotionId>
							<xsl:for-each select="v1:promotionFeature">
								<set:promotionFeature>
									<set:attributeName>
										<xsl:value-of select="v1:attributeName"/>
									</set:attributeName>
									<set:attributeValue>
										<xsl:value-of select="v1:attributeValue"/>
									</set:attributeValue>
								</set:promotionFeature>
							</xsl:for-each>
						</set:promotion>
					</xsl:for-each>
					<intr:Interaction>
						<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPromotion/intr:Interaction/*"/>
					</intr:Interaction>
				</set:AddPromotionRequest>
			</RequestPayload>
			<TargetOperation>AddPromotion</TargetOperation>
		</details>
	</xsl:template>
</xsl:stylesheet>