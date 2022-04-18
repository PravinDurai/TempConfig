<xsl:stylesheet version="1.0" 
xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" 
xmlns:ns="http://www.vodafone.com/enablers/api/schema/location_2"
xmlns:v0="http://www.vodafone.com/enablers/api/types/core_common_1"
xmlns:v="http://www.vodafone.com/vf/locationInformation/interface/v.1.1" 
xmlns:v1="http://www.vodafone.com/vf/locationInformation/messages/v.1.1" 
xmlns:set = "http://www.vodafone.com/vf/gig/TerminalLocationFacadeService/interface/v0_1"  
xmlns:err="http://www.tibco.com/schemas/asg/error" 
xmlns:c="http://www.tibco.com/schemas/asg/context" 
xmlns:h="http://www.tibco.com/asg/protocols/http" 
xmlns:asg="http://www.tibco.com/asg/error" 
xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" 
xmlns:ns3="http://www.vodafone.com/gig/gig_common/types/v.0.2/">

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>	
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>

	<xsl:template match="/">
		<SOAP-ENV:Envelope>
			<SOAP-ENV:Header>	
				<ns:vfHeader>
					<v0:traceIdentifier xmlns:v0="http://www.vodafone.com/enablers/api/types/core_common_1">
						<xsl:for-each select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:vfHeader/v0:traceIdentifier">
							<xsl:copy-of select="v0:applicationId"/>
							<xsl:copy-of select="v0:timestamp"/>
							<xsl:copy-of select="v0:referenceId"/>
							<xsl:copy-of select="v0:correlationId"/>
						</xsl:for-each>
					</v0:traceIdentifier>
				</ns:vfHeader>
			</SOAP-ENV:Header>
			<SOAP-ENV:Body xmlns:ns="http://www.vodafone.com/enablers/api/interface/location_2_0">
				<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/*"/>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
