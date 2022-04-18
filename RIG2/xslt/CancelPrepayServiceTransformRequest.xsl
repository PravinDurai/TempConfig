<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/prepayServiceManagement/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/prepayServiceManagement/messages/v.1.1"   xmlns:set = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/CancelPrepayService"   xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:srvc="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Service" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties">

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
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CancelPrepayService/v1:msisdn"/>
				</Value>
			</BusinessKey>
			<RequestPayload>
				<set:CancelPrepayServiceRequest>
					<set:msisdn>
						<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CancelPrepayService/v1:msisdn"/>
					</set:msisdn>
                   <xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CancelPrepayService/v1:Service">
					<srvc:Service>
						<srvc:serviceID><xsl:value-of select="v1:serviceID"/></srvc:serviceID>
						<srvc:serviceName><xsl:value-of select="v1:serviceName"/></srvc:serviceName>
						<xsl:for-each select="v1:ServiceFeature">
							<srvc:ServiceFeature>
								<srvc:attributeName><xsl:value-of select="v1:attributeName"/></srvc:attributeName>
								<srvc:attributeValue><xsl:value-of select="v1:attributeValue"/></srvc:attributeValue>
								<srvc:attributeType><xsl:value-of select="v1:attributeType"/></srvc:attributeType>
							</srvc:ServiceFeature>
						</xsl:for-each>
					</srvc:Service>
                   </xsl:for-each>
				</set:CancelPrepayServiceRequest>
			</RequestPayload>
			<TargetOperation>CancelPrepayService</TargetOperation>
		</details>
	</xsl:template>
</xsl:stylesheet>