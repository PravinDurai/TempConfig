<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/prepayServiceManagement/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/prepayServiceManagement/messages/v.1.1"   xmlns:set = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/AddPrepayService" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus">

	<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="Severity">
		<xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:severity"/>
	</xsl:variable>
	<xsl:variable name="ErrorCode">
		<xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:code"/>
	</xsl:variable>
	<xsl:variable name="Message">
		<xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:message"/>
	</xsl:variable>
	<xsl:variable name="Component">
		<xsl:choose>
			<xsl:when test="string-length($sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:component) &gt; '0'">
				<xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:component"/>
			</xsl:when>
			<xsl:otherwise>BW</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Operation">
		<xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:operation"/>
	</xsl:variable>
	<xsl:variable name="ExtractErrorCode">
		<xsl:choose>
			<xsl:when test="contains($ErrorCode, '-')">
				<xsl:value-of select="substring-after(substring-after($ErrorCode, '-'), '-')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$ErrorCode"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ConcatErrorCode">
		<xsl:value-of select="concat('SVC9',$ExtractErrorCode)"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus/ns:severity='S'">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Body>
						<v:AddPrepayServiceResponse>
							<xsl:copy-of select="$sbResponse/set:AddPrepayServiceResponse/ns:ResultStatus"/>
                            <xsl:if test="$sbResponse/set:AddPrepayServiceResponse/set:Adddirno">
                               <v1:Adddirno><xsl:value-of select="$sbResponse/set:AddPrepayServiceResponse/set:Adddirno"/></v1:Adddirno>
                            </xsl:if>
							<v1:traceIdentifier>
								<v2:applicationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:applicationID"/>
								</v2:applicationID>
								<v2:serviceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:serviceID"/>
								</v2:serviceID>
								<v2:serviceInterfaceVersion>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
								</v2:serviceInterfaceVersion>
								<v2:timestamp>
									<xsl:value-of select="current-dateTime()"/>
								</v2:timestamp>
								<v2:referenceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:referenceID"/>
								</v2:referenceID>
                                <xsl:if test="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:correlationID">
								<v2:correlationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:correlationID"/>
								</v2:correlationID>
								</xsl:if>
								<v2:identityID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:AddPrepayService/v1:traceIdentifier/v2:identityID"/>
								</v2:identityID>
							</v1:traceIdentifier>
						</v:AddPrepayServiceResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:when test="string-length($sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/SOAP-ENV:Fault/detail) &gt; 0">
				<xsl:copy-of select="$sbResponse/*"/>
			</xsl:when>
			<xsl:when test="$ExtractErrorCode='190'">
				<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>Client</faultcode>
							<faultstring>SVC0002</faultstring>
							<faultactor>null</faultactor>
							<detail>
								<v:AddPrepayServiceserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">SVC0002</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">ProtocolTermination : Request payload parsing error</ns1:variables>
								</v:AddPrepayServiceserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise>
				<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>Client</faultcode>
							<faultstring>
								<xsl:value-of select="$ConcatErrorCode"/>
							</faultstring>
							<faultactor>null</faultactor>
							<detail>
								<v:AddPrepayServiceserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ConcatErrorCode"/>
									</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorCode"/>|severity - E|message - <xsl:value-of select="$Message"/>|operation - <xsl:value-of select="$Operation"/>|component - <xsl:value-of select="$Component"/>|||</ns1:variables>
								</v:AddPrepayServiceserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>