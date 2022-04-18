<xsl:stylesheet version="1.0"
		xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:xsd="http://www.w3.org/2001/XMLSchema"
		xmlns:v="http://www.vodafone.com/vf/subscriptionLifecycleManagement/interface/v.2.1" 
		xmlns:v1="http://www.vodafone.com/vf/subscriptionLifecycleManagement/messages/v.2.1" 
		xmlns:cus="http://xmlns.vodafone.co.uk/map/til/Common/CustomerSegment" 
		xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/"
		xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error"
		xmlns:set = "http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/GetAvailableCTNs"  xmlns:cs="http://xmlns.vodafone.co.uk/map/til/Common/CustomerSegment">

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
		<set:GetAvailableCTNsRequest>
			<set:dealerCode>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:dealerCode"/>
			</set:dealerCode>
			<set:numberLocation>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:numberLocation"/>
			</set:numberLocation>
			<set:numberGroup>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:numberGroup"/>
			</set:numberGroup>
			<set:fromCtn>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:fromCtn"/>
			</set:fromCtn>
			<set:numberPages>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:numberPages"/>
			</set:numberPages>
			<set:ctnPattern>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:ctnPattern"/>
			</set:ctnPattern>
			<cs:CustomerSegment>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/cs:CustomerSegment"/>
			</cs:CustomerSegment>
			<set:networkProvider>
				<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetAvailableCTNs/v1:networkProvider"/>
			</set:networkProvider>
		</set:GetAvailableCTNsRequest>
	</xsl:template>
</xsl:stylesheet>