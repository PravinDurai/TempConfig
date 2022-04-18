<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/businessEvent/interface/v.1.4" xmlns:v1="http://www.vodafone.com/vf/businessEvent/messages/v.1.4" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/">

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

	<xsl:template match="/">
         <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
            <soapenv:Body>
		<xsl:choose>
			<xsl:when test="contains($sbResponse, 'SOAP-ENV:Fault') or contains($sbResponse, 'soapenv:Fault') or contains($sbResponse, 'SOAP-ENV:FAULT')">
				<faultcode>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultcode"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultcode"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:FAULT/faultcode"/>
				</faultcode>
				<faultstring>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultstring"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultstring"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:FAULT/faultstring"/>
				</faultstring>
				<faultactor>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultactor"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:Fault/faultactor"/>
					<xsl:value-of select="$sbResponse/SOAP-ENV:FAULT/faultactor"/>
				</faultactor>
				<xsl:choose>
					<xsl:when test="contains($sbResponse, 'serviceException')">
						<v:businessEventNotificationResponseserviceException>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Fault/detail/*"/>
						</v:businessEventNotificationResponseserviceException>
					</xsl:when>
					<xsl:otherwise>
						<v:businessEventNotificationResponsepolicyException>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Fault/detail/*"/>
						</v:businessEventNotificationResponsepolicyException>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<v:businessEventNotificationResponse>
					<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/v:BusinessEventNotificationResponse/*"/>		
				</v:businessEventNotificationResponse>
			</xsl:otherwise>
		</xsl:choose>
           </soapenv:Body>
        </soapenv:Envelope>
	</xsl:template>
</xsl:stylesheet>