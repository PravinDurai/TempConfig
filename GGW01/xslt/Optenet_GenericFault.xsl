<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:c="http://www.tibco.com/schemas/asg/context"
	xmlns:asg="http://www.tibco.com/asg/error"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:m="http://www.tibco.com/asg/mapping"
	xmlns:h="http://www.tibco.com/asg/protocols/http"
	xmlns:j="http://www.tibco.com/asg/protocols/jms"
	exclude-result-prefixes="xsl fn m h">
	<xsl:param name="asgErrorCode"/>
	<xsl:param name="asgErrorSource"/>
	<xsl:param name="asgErrorMessage"/>
	<xsl:param name="category"/>
	<xsl:param name="messageId"/>
	<xsl:param name="text"/>
	<xsl:param name="faultCode"/>
	<xsl:param name="faultString"/>
	<xsl:param name="faultActor"/>
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>
	<xsl:variable name="httpRequest">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
	</xsl:variable>
	<xsl:variable name="jmsRequest">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:jmsRequest']/j:request"/>
	</xsl:variable>
	<xsl:variable name="soapaction">
		<xsl:choose>
			<xsl:when test="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']">
				<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='soapaction']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:jmsRequest']/j:request/j:SoapAction"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="GenerateCustomTransaction_SoapAction">"GenerateCustomTransaction_WSDL"</xsl:variable>
	<xsl:variable name="ReplicateClient_SoapAction">"ReplicateClient_WSDL"</xsl:variable>
	<xsl:variable name="GetIconSize_SoapAction">"GetIconSize_WSDL"</xsl:variable>
	<xsl:variable name="NewClientByType_SoapAction">"NewClientByType_WSDL"</xsl:variable>
	<xsl:variable name="SetIconSize_SoapAction">"SetIconSize_WSDL"</xsl:variable>
	<xsl:variable name="ReadKey_SoapAction">"ReadKey_WSDL"</xsl:variable>
	<xsl:variable name="RemoveClient_SoapAction">"RemoveClient_WSDL"</xsl:variable>
	<xsl:variable name="GetReports_SoapAction">"GetReports"</xsl:variable>
	<xsl:variable name="AddServiceToClient_SoapAction">"AddServiceToClient_WSDL"</xsl:variable>
	<xsl:template match="/">
		<SOAP-ENV:Envelope xmlns:opt="http://www.optenet.com/OptenetService/">
			<SOAP-ENV:Body>
				<xsl:choose>
					<xsl:when test="$soapaction = $GenerateCustomTransaction_SoapAction">
						<opt:GenerateCustomTransaction_WSDLResponse>
							<opt:Return>EC=700 Internal WSDL error</opt:Return>
						</opt:GenerateCustomTransaction_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $ReplicateClient_SoapAction">
						<opt:ReplicateClient_WSDLResponse>
							<opt:Return>EC=700 Internal error in WebService</opt:Return>
						</opt:ReplicateClient_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $GetIconSize_SoapAction">
						<opt:GetIconSize_WSDLResponse>
							<opt:Return>EC=700 Internal WSDL error</opt:Return>
						</opt:GetIconSize_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $NewClientByType_SoapAction">
						<opt:NewClientByType_WSDLResponse>
							<opt:Return>13</opt:Return>
						</opt:NewClientByType_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $SetIconSize_SoapAction">
						<opt:SetIconSize_WSDLResponse>
							<opt:Return>13</opt:Return>
						</opt:SetIconSize_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $ReadKey_SoapAction">
						<opt:ReadKey_WSDLResponse>
							<opt:Return>EC=700 Internal WSDL error</opt:Return>
						</opt:ReadKey_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $RemoveClient_SoapAction">
						<opt:RemoveClient_WSDLResponse>
							<opt:Return>13</opt:Return>
						</opt:RemoveClient_WSDLResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $GetReports_SoapAction">
						<ns0:GetReportsResponse xmlns:ns0="tns" xmlns:ns1="s0">
							<ns0:GetReportsResult>
								<ns1:Report>
									<ns1:reportName/>
									<ns1:data/>
									<ns1:totals>0</ns1:totals>
									<ns1:responseStatus>EC=700 Internal error in WebService</ns1:responseStatus>
								</ns1:Report>
							</ns0:GetReportsResult>
						</ns0:GetReportsResponse>
					</xsl:when>
					<xsl:when test="$soapaction = $AddServiceToClient_SoapAction">
						<opt:AddServiceToClient_WSDLResponse>
							<opt:Return>13</opt:Return>
						</opt:AddServiceToClient_WSDLResponse>
					</xsl:when>
				</xsl:choose>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
