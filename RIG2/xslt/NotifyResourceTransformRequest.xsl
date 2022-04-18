<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification"
 xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" exclude-result-prefixes="xsl c h">
	<xsl:strip-space elements="*"/>
	<xsl:output omit-xml-declaration="yes" indent="yes"/>

	<xsl:param name="routingKey"/>

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="Destination">
		<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:destination"/>
	</xsl:variable>
	<xsl:variable name="EventType">
		<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:event"/>
	</xsl:variable>

	<xsl:variable name="RoutingKey">
		<xsl:choose>
			<xsl:when test="$Destination='BAMBOO' and ($EventType=('NotifyResource','NotifyResourceServiceBars','NotifyResourceServices'))">
				<xsl:value-of select="$Destination"/>
			</xsl:when>
			<xsl:otherwise>Undefined</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>  
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:choose xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
			<xsl:when test="$RoutingKey='Undefined'">
				<asg_map:mapping-result>
					<asg_map:error>
						<err:errorCode>R9020</err:errorCode>
						<err:errorMessage>Routing not defined</err:errorMessage>
					</asg_map:error>
				</asg_map:mapping-result>	
			</xsl:when>
			<xsl:otherwise xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
				<asg_map:mapping-result>
					<asg_map:payload-xml>	
						<SOAP-ENV:Envelope>
							<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/*"/>
						</SOAP-ENV:Envelope>
					</asg_map:payload-xml>	
				</asg_map:mapping-result>  
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>