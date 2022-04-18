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
	<xsl:variable name="ErrorTypeLes">
		<xsl:value-of select="concat('les_',$asgErrorCode)"/>
	</xsl:variable>
	<xsl:variable name="ErrorTypeNew">
		<xsl:value-of select="concat('new_',$asgErrorCode)"/>
	</xsl:variable>
	<xsl:variable name="Exceptions">
		<xsl:value-of select="substring-before($category,'(')"/>
	</xsl:variable>
	<xsl:param name="ErrorDetailsFile" select="document('/opt/tibco/env/RIG2/conf/ErrorDetails.xml')"/>
	<xsl:param name="GetErrorTemplateFile" select="document('/opt/tibco/env/RIG2/conf/GetErrorTemplate.xml')"/>
	<xsl:variable name="GetErrorType">
		<xsl:value-of select="$GetErrorTemplateFile/Syntax/TemplateReturn[SoapAction = $soapaction]/ErrorType"/>
	</xsl:variable>
	<xsl:variable name="GetOperationName">
		<xsl:value-of select="$GetErrorTemplateFile/Syntax/TemplateReturn[SoapAction = $soapaction]/OperationName"/>	
	</xsl:variable>		
	<xsl:variable name="OperationException">
		<xsl:value-of select="concat($GetOperationName,$Exceptions)"/>
	</xsl:variable>
	<xsl:variable name="GetNameSpace">
		<xsl:value-of select="$GetErrorTemplateFile/Syntax/TemplateReturn[SoapAction = $soapaction]/NameSpace"/>
	</xsl:variable>

	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="contains($nbRequest, 'SOAP-ENV:')">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>
								<xsl:value-of select="$faultCode"/>
							</faultcode>
							<faultstring>
								<xsl:value-of select="$faultString"/>
							</faultstring>
							<faultactor>
								<xsl:value-of select="$faultActor"/>
							</faultactor>
							<detail>
								<xsl:element name="ns:{$OperationException}" namespace="{$GetNameSpace}">
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorCode"/>
									</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$text"/>
									</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorMessage"/>

									</ns1:variables>
								</xsl:element>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>							
					<xsl:when test="$Exceptions = 'PolicyException'">
						<ns0:usage-auth-ratePolicyFault xmlns:ns0 = "http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1" xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
							<ns1:faultCode>
								<xsl:value-of select="$faultCode"/>
							</ns1:faultCode>
							<ns1:faultString>
								<xsl:value-of select="$faultString"/>
							</ns1:faultString>
							<ns1:faultActor>
								<xsl:value-of select="$faultActor"/>
							</ns1:faultActor>
							<ns1:detail>
								<ns1:messageId>
									<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorCode"/>
								</ns1:messageId>
								<ns1:text>
									<xsl:value-of select="$text"/>
								</ns1:text>
								<ns1:variables>
									<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorMessage"/>
								</ns1:variables>
							</ns1:detail>
						</ns0:usage-auth-ratePolicyFault>
					</xsl:when>
					<xsl:otherwise>
						<ns0:usage-auth-rateServiceFault xmlns:ns0 = "http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1" xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
							<ns1:faultCode>
								<xsl:value-of select="$faultCode"/>
							</ns1:faultCode>
							<ns1:faultString>
								<xsl:value-of select="$faultString"/>
							</ns1:faultString>
							<ns1:faultActor>
								<xsl:value-of select="$faultActor"/>
							</ns1:faultActor>
							<ns1:detail>
								<ns1:messageId>
									<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorCode"/>
								</ns1:messageId>
								<ns1:text>
									<xsl:value-of select="$text"/>
								</ns1:text>
								<ns1:variables>
									<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorMessage"/>
								</ns1:variables>
							</ns1:detail>
						</ns0:usage-auth-rateServiceFault>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
