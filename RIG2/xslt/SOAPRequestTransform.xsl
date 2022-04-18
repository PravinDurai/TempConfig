<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:k="http://www.tibco.com/asg/protocols/jms" xmlns:map="http://www.tibco.com/asg/mapping" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:SOAP1.2="http://www.w3.org/2003/05/soap-envelope" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" exclude-result-prefixes="xsl map k c h mapperUtils" >
  <xsl:output method="xml" indent="yes"/>
     <xsl:variable name="cnRequestHref"><xsl:value-of select="/transformation/cnRequest/@href"/></xsl:variable>
    <xsl:variable name="cnRequest">
    <xsl:copy-of select="document($cnRequestHref)"/>
  </xsl:variable>
   <xsl:variable name="recdRequest"><xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/></xsl:variable>
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
   <map:mapping-result>
      <map:context>
       <c:context>
	  <c:entry key="asg:jmsRequest">
			<k:override-header name="Source">
			<xsl:value-of select="$GetPartnerName"/>
			</k:override-header>
    </c:entry>
        </c:context>
    </map:context>
    <map:payload-xml>
			<xsl:choose>
			<xsl:when test="string-length($cnRequest/SOAP1.2:Envelope/SOAP1.2:Body/*) &gt; 0">
				<SOAP1.2:Envelope>
					<SOAP1.2:Header>	
						<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header">
							<xsl:for-each select="$cnRequest/SOAP1.2:Envelope/SOAP1.2:Header/head:Header[1]">
								<xsl:copy-of select="head:source"/>
								<xsl:copy-of select="head:sourceTimestamp"/>
								<xsl:copy-of select="head:transactionId"/>
								<xsl:copy-of select="head:application"/>
								<xsl:copy-of select="head:messageId"/>
								<head:originator>
									<xsl:value-of select="$GetPartnerName"/>
								</head:originator>
								<xsl:copy-of select="head:version"/>
								<xsl:copy-of select="head:custom"/>
								<xsl:copy-of select="head:Logon"/>
								<xsl:copy-of select="head:Property"/>
							</xsl:for-each>
						</head:Header>
						<xsl:copy-of select="$cnRequest/SOAP1.2:Envelope/SOAP1.2:Header/wsse:Security"/>  
					</SOAP1.2:Header>
					<SOAP1.2:Body>
						<xsl:copy-of select="$cnRequest/SOAP1.2:Envelope/SOAP1.2:Body/*"/>
					</SOAP1.2:Body>
				</SOAP1.2:Envelope>
			</xsl:when>
			<xsl:otherwise>
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
									<xsl:value-of select="$GetPartnerName"/>
								</head:originator>
								<xsl:copy-of select="head:version"/>
								<xsl:copy-of select="head:custom"/>
								<xsl:copy-of select="head:Logon"/>
								<xsl:copy-of select="head:Property"/>
							</xsl:for-each>
						</head:Header>
						<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security"/>  
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/*"/>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</map:payload-xml>
</map:mapping-result>
</xsl:template>
</xsl:stylesheet>