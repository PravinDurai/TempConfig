<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/terminalLocation/interface/v.1.4" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:v2="http://www.vodafone.com/vf/terminalStatus/interface/v2_2">

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
		<details>
			<PartnerName>
				<xsl:for-each select="$GetPartnerNameFile/Syntax/DetailsOfPartner">
					<xsl:if test="SerialNumber = $GetSerialNumber and CAIssuer = $GetCAISsuer">
						<xsl:value-of select="PartnerName"/>
					</xsl:if>
				</xsl:for-each>
			</PartnerName>
			<BusinessKey>
				<xsl:choose>
					<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLocation/subscriberMSISDN/text()[starts-with(.,'tel')]">
						<Name>MSISDN</Name>
						<Value>
							<xsl:value-of select="substring-after($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLocation/subscriberMSISDN, 'tel:')"/>
						</Value>
					</xsl:when>
					<xsl:otherwise>
						<Name>MSISDN</Name>
						<Value>
							<xsl:value-of select="substring-after($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLocation/customerId, 'tel:')"/>
						</Value>
					</xsl:otherwise>
				</xsl:choose> 
			</BusinessKey>
			<RequestPayload>
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>	
						<v:vfHeader xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">	
							<v0:traceIdentifier>
								<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/v:vfHeader/v0:traceIdentifier">
									<xsl:copy-of select="v0:applicationID"/>
									<xsl:copy-of select="v0:serviceID"/>
									<xsl:copy-of select="v0:serviceInterfaceVersion"/>
									<xsl:copy-of select="v0:timestamp"/>
									<xsl:copy-of select="v0:referenceID"/>
									<xsl:copy-of select="v0:correlationID"/>
									<xsl:copy-of select="v0:identityID"/>	
								</xsl:for-each>
							</v0:traceIdentifier>
						</v:vfHeader>
					</SOAP-ENV:Header>	
					<SOAP-ENV:Body>
						<v:GetLocation>
							<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLocation/*"/>
						</v:GetLocation>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</RequestPayload>
			<TargetOperation>GetLocation</TargetOperation>
		</details>
	</xsl:template>
</xsl:stylesheet>