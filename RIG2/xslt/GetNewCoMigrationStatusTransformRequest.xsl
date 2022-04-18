<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/GetNewCoMigrationStatus" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties">

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
					<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetNewCoMigrationStatusRequest/v:CTN"/>
				</Value>
			</BusinessKey>
			<RequestPayload>
				<SOAP-ENV:Envelope>
			<SOAP-ENV:Header>	
				<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header">
					<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header[1]">
						<xsl:copy-of select="head:source"/>
						<xsl:copy-of select="head:sourceTimestamp"/>
						<xsl:copy-of select="head:transactionId"/>
						<xsl:copy-of select="head:application"/>
						<xsl:copy-of select="head:messageId"/>
						<head:originator>
							<xsl:for-each select="$GetPartnerNameFile/Syntax/DetailsOfPartner">
								<xsl:if test="SerialNumber = $GetSerialNumber and CAIssuer = $GetCAISsuer">
									<xsl:value-of select="PartnerName"/>
								</xsl:if>
							</xsl:for-each>
						</head:originator>
						<xsl:copy-of select="head:version"/>
						<xsl:copy-of select="head:custom"/>
						<xsl:copy-of select="head:Logon"/>
						<xsl:copy-of select="head:Property"/>
					</xsl:for-each>
				</head:Header>
			</SOAP-ENV:Header> 
					<SOAP-ENV:Body>
						<v:GetNewCoMigrationStatusRequest>
							<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetNewCoMigrationStatusRequest/*"/>
						</v:GetNewCoMigrationStatusRequest>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</RequestPayload>
			<TargetOperation>GetNewCoMigrationStatus</TargetOperation>
		</details>
	</xsl:template>
</xsl:stylesheet>