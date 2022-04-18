<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" exclude-result-prefixes="xsl c h">
	<xsl:strip-space elements="*"/>
	<xsl:output omit-xml-declaration="yes" indent="yes"/>

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

	<xsl:variable name="Destination">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:destination"/>
	</xsl:variable>
	<xsl:variable name="EventType">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:event"/>
	</xsl:variable>

	<xsl:variable name="RoutingKey">
		<xsl:choose>
			<xsl:when test="$Destination='ARP1' and ($EventType=('DeProvisioningAcknowledgement'))">
				<xsl:value-of select="$Destination"/>
			</xsl:when>
			<xsl:when test="$Destination='ARP2' and ($EventType=('DeProvisioningAcknowledgement'))">
				<xsl:value-of select="$Destination"/>
			</xsl:when>
			<xsl:otherwise>Undefined</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="/">
		<output>
			<routingKey>
				<xsl:value-of select="$RoutingKey"/>
			</routingKey>
		</output>
	</xsl:template>
</xsl:stylesheet>
