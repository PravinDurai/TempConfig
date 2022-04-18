<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/locationInformation/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/locationInformation/messages/v.1.1" xmlns:set = "http://www.vodafone.com/vf/gig/TerminalLocationFacadeService/interface/v0_1"  xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:ns3="http://www.vodafone.com/gig/gig_common/types/v.0.2/">

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
			<SOAP-ENV:Header/>
			<SOAP-ENV:Body>
				<set:getCustIdHeader> 
					<customerId>
						<Type>MSISDN</Type>
						<Identifier>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:msisdn"/>
						</Identifier>
					</customerId>										
				</set:getCustIdHeader>
				<set:getLocationRequest>        
					<traceIdentifier>
						<ns3:applicationID>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:applicationID"/>
						</ns3:applicationID>
						<ns3:serviceID>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:serviceID"/>
						</ns3:serviceID>
						<ns3:serviceInterfaceVersion>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
						</ns3:serviceInterfaceVersion>
						<ns3:timestamp>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:timestamp"/>
						</ns3:timestamp>
						<ns3:referenceID>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:referenceID"/>
						</ns3:referenceID>
						<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:correlationID">
							<ns3:correlationID>
								<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:correlationID"/>
							</ns3:correlationID>
						</xsl:if>
						<ns3:identityID>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:identityID"/>
						</ns3:identityID>
					</traceIdentifier>
					<requestedAccuracy>
						<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:requestedAccuracy"/>
					</requestedAccuracy>
					<set:acceptableAccuracy>
						<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:acceptableAccuracy"/>
					</set:acceptableAccuracy>
					<responseTime>
						<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:responseTime"/>
					</responseTime>
					<maximumAge>
						<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:maximumAge"/>
					</maximumAge>
					<tolerance>
						<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:tolerance"/>
					</tolerance>
					<cellInfo>
						<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:cellInfo"/>
					</cellInfo>
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:MNC">
						<MNC><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:MNC"/></MNC>
					</xsl:if>
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:MCC">
						<MCC><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:MCC"/></MCC>
					</xsl:if>
				</set:getLocationRequest>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
