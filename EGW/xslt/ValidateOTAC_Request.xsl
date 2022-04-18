<!--
	Purpose:   This is Generic Request XSLT 
        Version:   0.1
-->

<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:json="http://www.tibco.com/asg/functions/json" xmlns:codecs="http://www.tibco.com/asg/functions/codecs"> 
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/cnRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>

	<xsl:variable name="httpRequest">
		<xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
	</xsl:variable>

	<xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>
	<xsl:variable name="jsonRequest">
		<xsl:copy-of select="json:parse($httpRequest/h:request/h:body)"/>
	</xsl:variable>
	
	<xsl:variable name="QueryString">
                <xsl:value-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-uri"/>
	</xsl:variable> 
	<xsl:template match="/">
		<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:val="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/ContactChannelManagement/CustomerContactRoutingAndAuthentication/ValidateOTAC">
   <soapenv:Header>
      <head:Header>
		 <head:source>TOBI</head:source>
		 <head:sourceTimestamp><xsl:value-of select="current-dateTime()"/></head:sourceTimestamp>
		 <head:transactionId></head:transactionId>    
		 <head:originator>TOBI</head:originator>
      </head:Header>
   </soapenv:Header>
   <soapenv:Body>
      <val:ValidateOTACRequest>
			<val:StateInformation>
               <val:SessionID><xsl:value-of select="substring-before(substring-after($QueryString, 'otac/'), '/validate')"/></val:SessionID>
			</val:StateInformation>
			<val:SecurityInfo>
			   <val:OTAC><xsl:value-of select="json:parse($httpRequest/h:request/h:body)//*[@key = 'OTAC']"/></val:OTAC>
			</val:SecurityInfo>
      </val:ValidateOTACRequest>
   </soapenv:Body>
</soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>