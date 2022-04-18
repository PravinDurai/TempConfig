<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon"
xmlns:ns="http://www.vodafone.com/enablers/api/schema/location_2"
xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4" 
xmlns:v="http://www.vodafone.com/vf/debitCreditManagement/interface/v.1.1" 
xmlns:v1="http://www.vodafone.com/vf/debitCreditManagement/messages/v.1.1" 
xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" 
xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/">

	<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>


	<xsl:template match="/">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<ns:vfHeader  xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:vfHeader/*"/>
						</ns:vfHeader>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<ns:GetGeoLocationResponse>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/ns:GetGeoLocationResponse/*"/>
						</ns:GetGeoLocationResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
