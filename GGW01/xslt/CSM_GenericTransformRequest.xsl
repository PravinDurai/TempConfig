<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:k="http://www.tibco.com/asg/protocols/jms" xmlns:map="http://www.tibco.com/asg/mapping" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties" xmlns:h="http://www.tibco.com/asg/protocols/http" exclude-result-prefixes="xsl map k c h mapperUtils" xmlns:v1="http://group.vodafone.com/contract/vho/header/v1" >
<xsl:output method="xml" indent="yes"/>
  <xsl:variable name="cnRequestHref">
    <xsl:value-of select="/transformation/cnRequest/@href"/>
  </xsl:variable>
  <xsl:variable name="cnRequest">
    <xsl:copy-of select="document($cnRequestHref)"/>
  </xsl:variable>
	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable> 
                 <xsl:variable name="contextHref">
					<xsl:value-of select="/transformation/context/@href"/>
                </xsl:variable>
                <xsl:variable name="httpRequest">
                    <xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
                </xsl:variable>
                <xsl:variable name="requestId">
                    <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-id"/>
                </xsl:variable>
                    <xsl:variable name="GetPartnerName">
                <xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
       </xsl:variable>
  	<xsl:template match="/">
		<soapenv:Envelope>
			<soapenv:Header>	
				<v1:Destination>
					<xsl:copy-of select="$cnRequest/soapenv:Envelope/soapenv:Header/v1:Destination/*"/>
				</v1:Destination>
				<v1:Correlation>
					<xsl:copy-of select="$cnRequest/soapenv:Envelope/soapenv:Header/v1:Correlation/*"/>
				</v1:Correlation>
				<v1:Source>
					<v1:Operator>
						<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Header/v1:Source/v1:Operator"/>
					</v1:Operator>
					<v1:Division>
						<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Header/v1:Source/v1:Division"/>
					</v1:Division>
					<v1:System><xsl:value-of select="$GetPartnerName"/></v1:System>
					<v1:Timestamp>
						<xsl:value-of select="$cnRequest/soapenv:Envelope/soapenv:Header/v1:Source/v1:Timestamp"/>
					</v1:Timestamp>
				</v1:Source>			
			</soapenv:Header>
			<soapenv:Body>
				<xsl:copy-of select="$cnRequest/soapenv:Envelope/soapenv:Body/*"/>		
			</soapenv:Body>
		</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>