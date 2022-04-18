<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/locationInformation/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/locationInformation/messages/v.1.1" xmlns:set = "http://www.vodafone.com/vf/gig/TerminalLocationFacadeService/interface/v0_1" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:ns3="http://www.vodafone.com/vf/gig/TerminalLocationFacadeService/types/v0_1" xmlns:ns4="http://www.vodafone.com/gig/gig_common/types/v.0.2/" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/">

	<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:template match="/">
	       <xsl:choose>
			<xsl:when test="contains($sbResponse, 'SOAP-ENV:Fault') or contains($sbResponse, 'SOAP-ENV:Fault') or contains($sbResponse, 'SOAP-ENV:FAULT')">
       		<SOAP-ENV:Envelope>
		    	<SOAP-ENV:Body>
				<SOAP-ENV:Fault>	
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
						<v:GetLatLongserviceException>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Fault/detail/*"/>
						</v:GetLatLongserviceException>
					</xsl:when>
					<xsl:otherwise>
						<v:GetLatLongpolicyException>
							<xsl:copy-of select="$sbResponse/SOAP-ENV:Fault/detail/*"/>
						</v:GetLatLongpolicyException>
					</xsl:otherwise>
	     		</xsl:choose>
     				</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise>
			      <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
            	    <soapenv:Body>
			    	<v:GetLatLongResponse>
					<v1:locationData>
                        <msisdn>
                             <xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/set:getLocationResponse/locationData/ns3:customerIdentifier/ns4:Identifier"/>
                        </msisdn>
						<reportStatus>
							<xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/set:getLocationResponse/locationData/reportStatus"/>
						</reportStatus>
						<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/set:getLocationResponse/locationData/ns3:errorInformation"/>
						<xsl:copy-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/set:getLocationResponse/locationData/currentLocation"/>
					</v1:locationData>
					<v1:traceIdentifier>
						<v2:applicationID>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:applicationID"/>
						</v2:applicationID>
						<v2:serviceID>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:serviceID"/>
						</v2:serviceID>
						<v2:serviceInterfaceVersion>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
						</v2:serviceInterfaceVersion>
						<v2:timestamp>
							<xsl:value-of select="current-dateTime()"/>
						</v2:timestamp>
						<v2:referenceID>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:referenceID"/>
						</v2:referenceID>
                        <xsl:if test="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:correlationID">
						<v2:correlationID>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:correlationID"/>
						</v2:correlationID>
                        </xsl:if>
						<v2:identityID>
							<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetLatLong/v1:traceIdentifier/v2:identityID"/>
						</v2:identityID>
					</v1:traceIdentifier>					
				</v:GetLatLongResponse>
				</soapenv:Body></soapenv:Envelope>
			</xsl:otherwise>
	    	</xsl:choose>    	
	</xsl:template>
</xsl:stylesheet>
