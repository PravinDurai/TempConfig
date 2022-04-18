<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
	xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon"
	xmlns:v="http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1"
	xmlns:v1="http://www.vodafone.com/vf/contentSellingManagement/messages/v.1.1"
	xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/"  xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

	<xsl:variable name="sbResponse"><xsl:for-each select="/transformation/sbResponse"><xsl:copy-of select="document(@href)"/></xsl:for-each>	</xsl:variable>
	
	<xsl:variable name="context"><xsl:for-each select="/transformation/cnRequest"><xsl:copy-of select="document(@href)"/></xsl:for-each>	</xsl:variable>

	<xsl:variable name="IdentityID"><xsl:value-of select="$context/v:Purchase/v1:traceIdentifier/v2:identityID"/></xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$IdentityID='VFUKTIL'">
				<xsl:choose>
					<xsl:when test="$sbResponse/er-response[@id='100001']">
						<v:ModifySubscriptionChargingServiceFault  xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
							<ns1:faultCode>Client</ns1:faultCode>
							<ns1:faultString>SVC0001</ns1:faultString>
							<ns1:faultActor/>
							<ns1:detail>
								<ns1:messageId>SVC0001</ns1:messageId>
								<ns1:text>A service error occurred. Error code is %1</ns1:text>
								<ns1:variables>cause - <xsl:value-of select="$sbResponse/er-response/payload/error/cause"/>, description - <xsl:value-of select="$sbResponse/er-response/payload/error/description"/>, error@type - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::type"/>
             , error@id - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::id"/>
            , error@system-id - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::system-id"/>
								</ns1:variables>
							</ns1:detail>
						</v:ModifySubscriptionChargingServiceFault>
					</xsl:when>
					<xsl:otherwise>
						<v:ModifySubscriptionChargingResponse>
							<v1:er-response>
								<xsl:attribute name="id">
									<xsl:value-of select="$sbResponse/er-response/attribute::id"/>
								</xsl:attribute>
								<xsl:attribute name="sub-id">
									<xsl:value-of select="$sbResponse/er-response/attribute::sub-id"/>
								</xsl:attribute>
								<v1:modify-subscription-charging-method-response>
									<v1:success>
										<xsl:value-of select="$sbResponse/er-response/payload/modify-subscription-charging-method-response/success"/>
									</v1:success>
								</v1:modify-subscription-charging-method-response>
							</v1:er-response>
							<v1:traceIdentifier>
								<v2:applicationID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:applicationID"/>
								</v2:applicationID>
								<v2:serviceID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:serviceID"/>
								</v2:serviceID>
								<v2:serviceInterfaceVersion>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
								</v2:serviceInterfaceVersion>
								<v2:timestamp>
									<xsl:value-of select="current-dateTime()"/>
								</v2:timestamp>
								<v2:referenceID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:referenceID"/>
								</v2:referenceID>
								<v2:correlationID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:correlationID"/>
								</v2:correlationID>
								<v2:identityID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:identityID"/>
								</v2:identityID>
							</v1:traceIdentifier>
						</v:ModifySubscriptionChargingResponse>
					</xsl:otherwise>
				</xsl:choose> 
			</xsl:when>
			<xsl:otherwise>
              <SOAP-ENV:Envelope>
                <SOAP-ENV:Header/>
              <SOAP-ENV:Body>
			<xsl:choose>
					<xsl:when test="$sbResponse/er-response[@id='100001']">
						<v:ModifySubscriptionChargingServiceFault  xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
							<ns1:faultCode>Client</ns1:faultCode>
							<ns1:faultString>SVC0001</ns1:faultString>
							<ns1:faultActor/>
							<ns1:detail>
								<ns1:messageId>SVC0001</ns1:messageId>
								<ns1:text>A service error occurred. Error code is %1</ns1:text>
								<ns1:variables>cause - <xsl:value-of select="$sbResponse/er-response/payload/error/cause"/>, description - <xsl:value-of select="$sbResponse/er-response/payload/error/description"/>, error@type - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::type"/>
             , error@id - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::id"/>
            , error@system-id - <xsl:value-of select="$sbResponse/er-response/payload/error/attribute::system-id"/>
								</ns1:variables>
							</ns1:detail>
						</v:ModifySubscriptionChargingServiceFault>
					</xsl:when>
					<xsl:otherwise>
						<v:ModifySubscriptionChargingResponse>
							<v1:er-response>
								<xsl:attribute name="id">
									<xsl:value-of select="$sbResponse/er-response/attribute::id"/>
								</xsl:attribute>
								<xsl:attribute name="sub-id">
									<xsl:value-of select="$sbResponse/er-response/attribute::sub-id"/>
								</xsl:attribute>
								<v1:modify-subscription-charging-method-response>
									<v1:success>
										<xsl:value-of select="$sbResponse/er-response/payload/modify-subscription-charging-method-response/success"/>
									</v1:success>
								</v1:modify-subscription-charging-method-response>
							</v1:er-response>
							<v1:traceIdentifier>
								<v2:applicationID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:applicationID"/>
								</v2:applicationID>
								<v2:serviceID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:serviceID"/>
								</v2:serviceID>
								<v2:serviceInterfaceVersion>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
								</v2:serviceInterfaceVersion>
								<v2:timestamp>
									<xsl:value-of select="current-dateTime()"/>
								</v2:timestamp>
								<v2:referenceID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:referenceID"/>
								</v2:referenceID>
								<v2:correlationID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:correlationID"/>
								</v2:correlationID>
								<v2:identityID>
									<xsl:value-of select="$context/v:ModifySubscriptionCharging/v1:traceIdentifier/v2:identityID"/>
								</v2:identityID>
							</v1:traceIdentifier>
						</v:ModifySubscriptionChargingResponse>
					</xsl:otherwise>
				</xsl:choose>
                </SOAP-ENV:Body>
               </SOAP-ENV:Envelope>
		     </xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>