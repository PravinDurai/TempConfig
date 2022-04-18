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
	<xsl:variable name="ErrorTypeCSM">
          <xsl:value-of select="concat('csm_',$asgErrorCode)"/>
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
	<xsl:template match="/">
		<xsl:variable name="varasgErrorCode" select="$asgErrorCode"/>
		<SOAP-ENV:Envelope>
			<SOAP-ENV:Body>
				<SOAP-ENV:Fault>
					<xsl:choose>
						<!-- CSM fault changes are started from here -->
						<xsl:when test="$GetErrorType = 'CSM'">
							<faultcode>SOAP-ENV:Server</faultcode>
							<faultstring>This is an operation implementation generated fault</faultstring>
							<detail>
								<ns:Fault xmlns:ns="http://group.vodafone.com/contract/vfo/fault/v1" xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
									<ns3:Timestamp xmlns:ns3="http://docs.oasis-open.org/wsrf/bf-2">
										<xsl:value-of select="current-dateTime()"/>
									</ns3:Timestamp>
									<ns3:ErrorCode dialect="CSM Error Code" xmlns:ns3 = "http://docs.oasis-open.org/wsrf/bf-2">
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/ErrorCode"/>
									</ns3:ErrorCode>
									<ns3:Description xmlns:ns3="http://docs.oasis-open.org/wsrf/bf-2">
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Description"/>
									</ns3:Description>
									<ns:Name>
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Name"/>
									</ns:Name>
									<ns:Severity>
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Severity"/>
									</ns:Severity>	
									<ns:Category>
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Category"/>
									</ns:Category>	
									<ns:Message>
										<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Message"/>
									</ns:Message>
									<ns:Failures>                        
										<ns:Failure>
											<ns:Code>
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/TILRIGCode"/>
											</ns:Code>
											<ns:Text>
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeCSM]/Message"/>
											</ns:Text>
										</ns:Failure>
									</ns:Failures>
								</ns:Fault>
							</detail>
						</xsl:when>
						<!-- CSM fault changes are ending in here -->
						<xsl:otherwise>
                          <xsl:choose>
  							<xsl:when test="$GetErrorType = 'new'">	               
                        	  <faultcode>
								<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeNew]/FaultCode"/>
							  </faultcode>
							  <faultstring>
								<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $ErrorTypeNew]/FaultString"/>
							  </faultstring>
                            </xsl:when>
							<xsl:otherwise>
                        	  <faultcode>
								<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/FaultCode"/>
							  </faultcode>
							  <faultstring>
								<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/FaultString"/>
							  </faultstring>
							</xsl:otherwise>
                          </xsl:choose>
							<faultactor>
								<xsl:value-of select="$faultActor"/>
							</faultactor>
							<detail>
								<xsl:choose>
									<xsl:when test="$GetErrorType = 'MondrianWithOpName'">
										<xsl:element name="ns:{$OperationException}" namespace="{$GetNameSpace}">
											<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorCode"/>
											</ns1:messageId>
											<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/Text"/>
											</ns1:text>
											<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorMessage"/>

											</ns1:variables>
										</xsl:element>
									</xsl:when>

									<xsl:when test="$GetErrorType = 'MondrianWithoutOpName'">
										<xsl:element name="ns1:{$Exceptions}" namespace="{$GetNameSpace}">
											<ns1:messageId xmlns:ns="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorCode"/>
											</ns1:messageId>
											<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/Text"/>
											</ns1:text>
											<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
												<xsl:value-of select="$ErrorDetailsFile/Syntax/Error[KeyIndicator = $asgErrorCode]/ErrorMessage"/>
											</ns1:variables>				
										</xsl:element>
									</xsl:when>
									<xsl:otherwise>
										<ns1:ResultStatus xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus">
											<ns1:component>ResultStatus</ns1:component>
											<ns1:operation>
												<xsl:value-of select="$GetOperationName"/>
											</ns1:operation>										
											<ns1:severity>E</ns1:severity>
											<xsl:for-each select="$ErrorDetailsFile/Syntax/Error">
												<xsl:choose>
													<xsl:when test="KeyIndicator = $ErrorTypeNew">
														<ns1:code>
															<xsl:value-of select="ErrorCode"/>
														</ns1:code>
														<ns1:message>
															<xsl:value-of select="ErrorMessage"/>
														</ns1:message>
													</xsl:when>
												</xsl:choose>
											</xsl:for-each>
										</ns1:ResultStatus>
									</xsl:otherwise>
								</xsl:choose>
							</detail>
						</xsl:otherwise>
					</xsl:choose>
				</SOAP-ENV:Fault>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>
