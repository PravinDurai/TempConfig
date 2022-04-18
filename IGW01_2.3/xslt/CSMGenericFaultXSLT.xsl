<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fn="http://www.tibco.com/asg/functions/json"
  xmlns:json="http://www.tibco.com/asg/content-types/json" 
  xmlns:m="http://www.tibco.com/asg/mapping"
  xmlns:h="http://www.tibco.com/asg/protocols/http"
  xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
  xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:asg="http://www.tibco.com/asg/error"
  exclude-result-prefixes="m xsl fn json h asg c codecs">

	<xsl:output method="xml" indent="yes" encoding="utf-8"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="asgErrorCode"/>

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/context">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>

		<xsl:variable name="BackendError">
			<xsl:if test="string-length($context/c:context/c:entry[@key='asg:sbHttpResponse']/h:response/h:body[@isBinary='false'])>0">
				<xsl:value-of select="codecs:base64ToText($context/c:context/c:entry[@key='asg:sbHttpResponse']/h:response/h:body[@isBinary='false'])"/>
			</xsl:if> 
		</xsl:variable>

	<xsl:variable name="errorCode">
		<xsl:value-of select="$context/c:context/c:entry[@key='asg:sbHttpResponse']/h:response/h:status-code"/>
	</xsl:variable>

	<xsl:template match="*">
		<m:mapping-result>
				<xsl:choose>
					<xsl:when test="contains($BackendError,'VodafoneFault')">
						<m:payload-text>
							<xsl:value-of select="$BackendError"/>
						</m:payload-text>
					</xsl:when>
					<xsl:otherwise>
					 <m:payload-xml>
						<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
					   <SOAP-ENV:Header>
						  <ServiceDocumentaion>
							 <tns2:ServiceDocumentation xmlns:tns2="http://group.vodafone.com/contract/vho/header/v1">
								<tns2:ContractVersion></tns2:ContractVersion>
							 </tns2:ServiceDocumentation>
						  </ServiceDocumentaion>
					   </SOAP-ENV:Header>
					   <SOAP-ENV:Body>
						   <xsl:choose>
							 <xsl:when test="$asgErrorCode= '1003'">
							  <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been a failure with Vodafone Integration Gateway due to an validation issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">A request validation exception was thrown</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Invalid Input Data</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Minor</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Data</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">101</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been a failure with Vodafone Integration Gateway due to an validation issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>
							 <xsl:when test="$asgErrorCode= '2001'">
							  <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been a failure with the Vodafone Integration Gateway due to security issue, please contact your regular Vodafone Support team to report this issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">Generic Security Error</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Security Error</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Major</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Internal</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">200</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been a failure with the Vodafone Integration Gateway due to security issue, please contact your regular Vodafone Support team to report this issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>
							 <xsl:when test="$asgErrorCode= '2002' or $asgErrorCode= '3001'">
							  <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been a failure with Vodafone Integration Gateway due to an throttling issue.Please contact your regular Vodafone Support team to report this issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">Throttle limit exceeded</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Throttle Limit Exception</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Minor</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">External</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">230</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been a failure with Vodafone Integration Gateway due to an throttling issue.Please contact your regular Vodafone Support team to report this issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>
							 <xsl:when test="$asgErrorCode= '6004' or $asgErrorCode= '7004' or $asgErrorCode= '7006'">
							  <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been an issue when attempting to contact Vodafone's Mediation System, as it failed to respond in time, please contact your regular Vodafone Support team to report this issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">The back-end system reply was not received after a defined amount of time</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Backend System Interface Timeout</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Minor</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">System</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">401</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been an issue when attempting to contact Vodafone's Mediation System, as it failed to respond in time, please contact your regular Vodafone Support team to report this issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>
							 <xsl:when test="$asgErrorCode= '5001' or $asgErrorCode= '5002' or $asgErrorCode= '5002' or $asgErrorCode= '5003' or $asgErrorCode= '5004' or $asgErrorCode= '5005' or $asgErrorCode= '6000' or $asgErrorCode= '6001' or $asgErrorCode= '6002' or $asgErrorCode= '6003' or $asgErrorCode= '7002' or $asgErrorCode= '7003' or $asgErrorCode= '7005'">
							  <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been an issue when attempting to contact Vodafone's Mediation System.Â  Please contact your regular Vodafone Support team to report this issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">The backend system adapter could not communicate with the back-end system</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Backend System Unavailable</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Major</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">External</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">410</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been an issue when attempting to contact Vodafone's Mediation System.Â  Please contact your regular Vodafone Support team to report this issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>
							 <xsl:when test="$asgErrorCode= '210'">
							  <SOAP-ENV:Fault>
								 <faultstring>The system client is not authorize to execute the operation.</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">The system client is not authorize to execute the operation.</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unauthorized Client</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Minor</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">External</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">210</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">The system client is not authorize to execute the operation.</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							 </xsl:when>							 
							 <xsl:otherwise>
							 <SOAP-ENV:Fault>
								 <faultstring>Unfortunately there has been a failure with the Vodafone Integration Gateway , please contact your regular Vodafone Support team to report this issue</faultstring>
								 <detail>
									<VodafoneFault>
									   <ws-bf:Timestamp xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2"><xsl:value-of select="current-dateTime()"/></ws-bf:Timestamp>
									   <ws-bf:Description xmlns:ws-bf="http://docs.oasis-open.org/wsrf/bf-2">Generic Interface Error</ws-bf:Description>
									   <tns1:Name xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Interface Error</tns1:Name>
									   <tns1:Severity xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Major</tns1:Severity>
									   <tns1:Category xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">System</tns1:Category>
									   <tns1:ReasonCode xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">100</tns1:ReasonCode>
									   <tns1:Message xmlns:tns1="http://group.vodafone.com/contract/vfo/fault/v1">Unfortunately there has been a failure with the Vodafone Integration Gateway , please contact your regular Vodafone Support team to report this issue</tns1:Message>
									</VodafoneFault>
								 </detail>
							  </SOAP-ENV:Fault>
							  </xsl:otherwise>
						  </xsl:choose>
					   </SOAP-ENV:Body>
					</SOAP-ENV:Envelope>
					 </m:payload-xml>
					</xsl:otherwise>
				</xsl:choose>
		</m:mapping-result>
	</xsl:template>
</xsl:stylesheet>
