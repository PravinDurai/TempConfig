<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
	xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon"
	xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4" xmlns:v3="http://www.vodafone.com/vf/provisioningNotification/interface/v2_2_0">

	<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	
	

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when  test="exists($sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/v3:PostEventResponse)">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<v3:vfHeader  xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Header/v3:vfHeader/*"/>
						</v3:vfHeader>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v3:PostEventResponse>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/v3:PostEventResponse/*"/>
						</v3:PostEventResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise xmlns:v2="http://www.vodafone.com/vf/provisioningNotification/interface/v2_1_0">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<v2:vfHeader  xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Header/v2:vfHeader/*"/>
						</v2:vfHeader>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v2:PostEventResponse>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/v2:PostEventResponse/*"/>
						</v2:PostEventResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
