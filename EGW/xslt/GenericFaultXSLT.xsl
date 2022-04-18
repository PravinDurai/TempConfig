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
	exclude-result-prefixes="xsl fn m h">
	<xsl:param name="asgErrorCode"/>
	<xsl:param name="asgErrorSource"/>
	<xsl:param name="asgErrorMessage"/>
	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable>
	<xsl:variable name="SoapAction">
		<xsl:value-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='soapaction']"/>
	</xsl:variable>
	<xsl:param name="GetOperationDetails" select="document('/opt/SP/tibco/env/EGW/cfgmgmt/asg/EGW/xslt/GetOperationDetails.xml')"/>
	<xsl:variable name="GetOperationName">
		<xsl:value-of select="$GetOperationDetails/Syntax/OperationDetails[SoapAction = $SoapAction]/OperationName"/>
	</xsl:variable>
	<xsl:template match="/">
		<SOAP-ENV:Envelope>
			<SOAP-ENV:Body>
				<SOAP-ENV:Fault>
					<faultcode>SOAP-ENV:Server</faultcode>
					<faultstring>This is an operation implementation generated fault</faultstring>
					<faultactor/>
					<detail>
						<ns1:ResultStatus xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus">
							<ns1:component>ResultStatus</ns1:component>
							<ns1:operation>
								<xsl:value-of select="$GetOperationName"/>
							</ns1:operation>
							<ns1:severity>E</ns1:severity>
							<xsl:choose>
								<xsl:when test="$asgErrorCode= '1001'">
									<ns1:code>101</ns1:code>
									<ns1:message>ProtocolTermination : Request payload parsing error</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '1002'">
									<ns1:code>101</ns1:code>
									<ns1:message>ProtocolTermination : Could not process request</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '1003'">
									<ns1:code>100</ns1:code>
									<ns1:message>ProtocolTermination : Invalid SOAPAction</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '1004'">
									<ns1:code>SVC0001</ns1:code>
									<ns1:message>Service misconfigured</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '1005'">
									<ns1:code>SVC0001</ns1:code>
									<ns1:message>Invalid request</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '1006'">
									<ns1:code>SVC0001</ns1:code>
									<ns1:message>Invalid response</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2001'">
									<ns1:code>210</ns1:code>
									<ns1:message>Façade Authorization: Partner not valid/ Partner not allowed to call this Operation</ns1:message>	
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2002'">
									<ns1:code>230</ns1:code>
									<ns1:message>Requestor throttle limit reached</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2003'">
									<ns1:code>100</ns1:code>
									<ns1:message>Facade : No valid Operation found for SOAPAction</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2004'">
									<ns1:code>104</ns1:code>
									<ns1:message>Facade : MSISDN doesn't have a valid format</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2005'">
									<ns1:code>POL0502</ns1:code>
									<ns1:message>Unsupported tracking application ID</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '2007'">
									<ns1:code>SVC0004</ns1:code>
									<ns1:message>Facade :  Mapping timeout</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '3001'">
									<ns1:code>230</ns1:code>
									<ns1:message>Service throttle limit reached</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '3002'">
									<ns1:code>210</ns1:code>
									<ns1:message>Service Handler : MSISDN doesn't have a valid address</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '3003'">
									<ns1:code>210</ns1:code>
									<ns1:message>Service Handler : Partner not authorized to use this address</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '3004'">
									<ns1:code>500</ns1:code>
									<ns1:message>Routing : Service not found</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '4001'">
									<ns1:code>401</ns1:code>
									<ns1:message>Router Handler : Timeout</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '4002'">
									<ns1:code>500</ns1:code>
									<ns1:message>Router  : Cannot find a service to execute for the request</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '5001'">
									<ns1:code>194</ns1:code>
									<ns1:message>JMS ServiceInvoker : JMSInvalidInputException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '5002'">
									<ns1:code>195</ns1:code>
									<ns1:message>JMS ServiceInvoker : JMSMessageCreateException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '5003'">
									<ns1:code>196</ns1:code>
									<ns1:message>JMS ServiceInvoker</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '5004'">
									<ns1:code>192</ns1:code>
									<ns1:message>JMS ServiceInvoker : JMSSendException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '5005'">
									<ns1:code>192</ns1:code>
									<ns1:message>ServiceInvoker : ServiceInvokerException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '6000'">
									<ns1:code>192</ns1:code>
									<ns1:message>ServiceInvoker : ServiceInvokerException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '6001'">
									<ns1:code>410</ns1:code>
									<ns1:message>HTTP ServiceInvoker : HTTPClientException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '6002'">
									<ns1:code>411</ns1:code>
									<ns1:message>HTTP ServiceInvoker : HTTPServerException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '6003'">
									<ns1:code>412</ns1:code>
									<ns1:message>HTTP ServiceInvoker : HTTPCommunicationException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '6004'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7000'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7001'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7002'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7003'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7004'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7005'">
									<ns1:code>192</ns1:code>
									<ns1:message>ServiceInvoker: Exception</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7006'">
									<ns1:code>401</ns1:code>
									<ns1:message>ServiceInvoker: ActivityTimeoutException</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= '7007'">
									<ns1:code>401</ns1:code>
									<ns1:message>PartnerOpertion Timeout Exception</ns1:message>
								</xsl:when>
								<xsl:when test="$asgErrorCode= 'T9001' or $asgErrorCode= 'T9003' or $asgErrorCode= 'T9004' or $asgErrorCode= 'T9005' or $asgErrorCode= 'T9006'">
									<ns1:code>223</ns1:code>
									<ns1:message>
										<xsl:value-of select="$asgErrorMessage"/>
									</ns1:message>
								</xsl:when>
								<xsl:otherwise>
									<ns1:code>198</ns1:code>
									<ns1:message>
										<xsl:value-of select="$asgErrorMessage"/>
									</ns1:message>
								</xsl:otherwise>
							</xsl:choose>
						</ns1:ResultStatus>
					</detail>
				</SOAP-ENV:Fault>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>


