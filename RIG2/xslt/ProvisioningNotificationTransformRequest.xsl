<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:v2="http://www.vodafone.com/vf/provisioningNotification/interface/v2_1_0" xmlns:v3="http://www.vodafone.com/vf/provisioningNotification/interface/v2_2_0">	

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
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
		<xsl:choose>
			<xsl:when test="string-length($nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v3:PostEventRequest) &gt; 0">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>	
						<v3:vfHeader xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">
							<v0:traceIdentifier>
								<xsl:for-each select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/v3:vfHeader/v0:traceIdentifier">
									<xsl:copy-of select="v0:applicationID"/>
									<xsl:copy-of select="v0:serviceID"/>
									<xsl:copy-of select="v0:serviceInterfaceVersion"/>
									<xsl:copy-of select="v0:timestamp"/>
									<xsl:copy-of select="v0:referenceID"/>
									<xsl:copy-of select="v0:correlationID"/>
									<xsl:copy-of select="v0:identityID"/>
								</xsl:for-each>
							</v0:traceIdentifier>
						</v3:vfHeader>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v3:PostEventRequest xmlns:v3="http://www.vodafone.com/vf/provisioningNotification/interface/v2_2_0">        
							<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v3:PostEventRequest/*"/>		
						</v3:PostEventRequest>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise>
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>	
						<v2:vfHeader xmlns:v0="http://www.vodafone.com/vf/core_common/types/v0_4">
							<v0:traceIdentifier>
								<xsl:for-each select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/v2:vfHeader/v0:traceIdentifier">
									<xsl:copy-of select="v0:applicationID"/>
									<xsl:copy-of select="v0:serviceID"/>
									<xsl:copy-of select="v0:serviceInterfaceVersion"/>
									<xsl:copy-of select="v0:timestamp"/>
									<xsl:copy-of select="v0:referenceID"/>
									<xsl:copy-of select="v0:correlationID"/>
									<xsl:copy-of select="v0:identityID"/>
								</xsl:for-each>
							</v0:traceIdentifier>
						</v2:vfHeader>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v2:PostEventRequest xmlns:v2="http://www.vodafone.com/vf/provisioningNotification/interface/v2_1_0">        
							<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v2:PostEventRequest/*"/>		
						</v2:PostEventRequest>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>