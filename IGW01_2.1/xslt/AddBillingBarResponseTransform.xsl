<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:req="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/RequestHeader" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/AddBillingBar" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus">


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

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>
	<xsl:variable name="GetSerialNumber">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='serialnumber']"/>
	</xsl:variable>
	<xsl:variable name="GetCAISsuer">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='caissuer']"/>
	</xsl:variable>

	<xsl:variable name="Severity">
		<xsl:value-of select="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:severity"/>
	</xsl:variable>
	<xsl:variable name="ErrorCode">
		<xsl:value-of select="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:code"/>
	</xsl:variable>
	<xsl:variable name="Message">
		<xsl:value-of select="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:message"/>
	</xsl:variable>
	<xsl:variable name="Component">
		<xsl:choose>
			<xsl:when test="string-length($sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:component) &gt; '0'">
				<xsl:value-of select="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:component"/>
			</xsl:when>
			<xsl:otherwise>BW</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Operation">
		<xsl:value-of select="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:operation"/>
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
			<xsl:when test="$sbResponse/ns0:AddBillingBarResponse/ns:ResultStatus/ns:severity='S'">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon">
							<xsl:for-each select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header[1]">
								<xsl:copy-of select="head:source"/>
								<xsl:copy-of select="head:sourceTimestamp"/>
								<xsl:copy-of select="head:transactionId"/>
								<xsl:copy-of select="head:application"/>
								<xsl:copy-of select="head:correlationID"/>
								<head:originator>VPS</head:originator>
								<xsl:copy-of select="head:version"/>
							</xsl:for-each>
						</head:Header>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<ns0:AddBillingBarResponse xmlns = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/AddBillingBar">
							<xsl:copy-of select="$sbResponse/ns0:AddBillingBarResponse/*"/>
						</ns0:AddBillingBarResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:when test="$ExtractErrorCode='190'">
				<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>Client</faultcode>
							<faultstring>SVC0002</faultstring>
							<faultactor>null</faultactor>
							<detail>
								<v:AddBillingBarserviceException xmlns:v="http://www.vodafone.com/vf/customerInterfaceManagement/interface/v.1.1">
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">SVC0002</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">ProtocolTermination : Request payload parsing error</ns1:variables>
								</v:AddBillingBarserviceException>
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
								<v:AddBillingBarserviceException xmlns:v="http://www.vodafone.com/vf/customerInterfaceManagement/interface/v.1.1">
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ConcatErrorCode"/>
									</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorCode"/>|severity - E|message - <xsl:value-of select="$Message"/>|operation - <xsl:value-of select="$Operation"/>|component - <xsl:value-of select="$Component"/>|||</ns1:variables>
								</v:AddBillingBarserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>