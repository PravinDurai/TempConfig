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
	xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

	<xsl:variable name="sbResponse"><xsl:for-each select="/transformation/sbResponse"><xsl:copy-of select="document(@href)"/></xsl:for-each></xsl:variable>
	<xsl:variable name="context"><xsl:for-each select="/transformation/nbRequest"><xsl:copy-of select="document(@href)"/></xsl:for-each></xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$sbResponse/er-response[@id='100001']">
				<v:usage-auth-rateServiceFault  xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
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
				</v:usage-auth-rateServiceFault>
			</xsl:when>
			<xsl:when test="$sbResponse/er-response/payload/purchase-options and not($sbResponse/er-response/payload/purchase-options/reason-code[code='41' and name='NO VALID PACKAGE'])">
				<v:usage-auth-rateServiceFault  xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
					<ns1:faultCode>Client</ns1:faultCode>
					<ns1:faultString>SVC0001</ns1:faultString>
					<ns1:faultActor/>
					<ns1:detail>
						<ns1:messageId>SVC0001</ns1:messageId>
						<ns1:text>A service error occurred. Error code is %1</ns1:text>
						<ns1:variables>cause - <xsl:value-of select="$sbResponse/er-response/payload/purchase-options/reason-code/name"/>, description - <xsl:value-of select="$sbResponse/er-response/payload/purchase-options/reason-code/name"/>, error@type - DATA
             , error@id - <xsl:value-of select="$sbResponse/er-response/payload/purchase-options/reason-code/code"/>
            , error@system-id - ER
						</ns1:variables>
					</ns1:detail>
				</v:usage-auth-rateServiceFault>
			</xsl:when>
			<xsl:when test="$sbResponse/er-response/payload/usage-authorisation and $sbResponse/er-response/payload/usage-authorisation/is-success='false'">
				<v:usage-auth-rateServiceFault  xmlns:ns1 = "http://xmlns.vodafone.co.uk/RIG/common/Fault">
					<ns1:faultCode>Client</ns1:faultCode>
					<ns1:faultString>SVC0001</ns1:faultString>
					<ns1:faultActor/>
					<ns1:detail>
						<ns1:messageId>SVC0001</ns1:messageId>
						<ns1:text>A service error occurred. Error code is %1</ns1:text>
						<ns1:variables>cause - <xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/reason-code/name"/>, description - <xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/reason-code/name"/>, error@type - BUSINESS
             , error@id - <xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/reason-code/code"/>
            , error@system-id - ER
						</ns1:variables>
					</ns1:detail>
				</v:usage-auth-rateServiceFault>
			</xsl:when>
			<xsl:when test="$sbResponse/er-response/payload/usage-authorisation and $sbResponse/er-response/payload/usage-authorisation/is-success='true'">
				<v:usage-auth-rateResponse>
					<v1:er-response>
						<xsl:attribute name="id">
							<xsl:value-of select="$sbResponse/er-response/attribute::id"/>
						</xsl:attribute>
						<xsl:if test="$sbResponse/er-response/attribute::sub-id">
							<xsl:attribute name="sub-id">
								<xsl:value-of select="$sbResponse/er-response/attribute::sub-id"/>
							</xsl:attribute>
						</xsl:if>
						<v1:usage-authorisation>
							<v1:is-reserved-only>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/is-reserved-only"/>
							</v1:is-reserved-only>
							<v1:interactive>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/interactive"/>
							</v1:interactive>
							<v1:is-success>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/is-success"/>
							</v1:is-success>
							<v1:package> 
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/package/*"/>
							</v1:package>
							<v1:price-point>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/price-point/*"/>
							</v1:price-point>
							<v1:service-price-point>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/service-price-point/*"/>
							</v1:service-price-point>
							<v1:user-resource-balance>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/user-resource-balance/*"/>
							</v1:user-resource-balance>
							<v1:package-subscription-id>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/package-subscription-id"/>
							</v1:package-subscription-id>
							<v1:reason-code>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/reason-code/*"/>
							</v1:reason-code>
							<v1:sub-reason-code>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/sub-reason-code/*"/>
							</v1:sub-reason-code>
							<v1:receipting-credit-balance-impact>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/receipting-credit-balance-impact"/>
							</v1:receipting-credit-balance-impact>
							<v1:receipting-usage-type-attribute>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/receipting-usage-type-attribute"/>
							</v1:receipting-usage-type-attribute>
							<v1:transaction-id>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/transaction-id"/>
							</v1:transaction-id>
							<v1:is-successful-express-purchase>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/is-successful-express-purchase"/>
							</v1:is-successful-express-purchase>
							<v1:rate>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/rate"/>
							</v1:rate>
							<v1:drm-object>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/drm-object/*"/>
							</v1:drm-object>
							<v1:error-description>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/error-description"/>
							</v1:error-description>
							<v1:error-id>
								<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/error-id"/>
							</v1:error-id>
							<v1:payment-status>
								<xsl:copy-of select="$sbResponse/er-response/payload/usage-authorisation/payment-status/*"/>
							</v1:payment-status>
							<xsl:if test="$sbResponse/er-response/payload/usage-authorisation/re-issue">
								<v1:re-issue>
									<xsl:value-of select="$sbResponse/er-response/payload/usage-authorisation/re-issue"/>
								</v1:re-issue>
							</xsl:if> 
						</v1:usage-authorisation>
					</v1:er-response>
					<v1:traceIdentifier>
						<v2:applicationID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:applicationID"/>
						</v2:applicationID>
						<v2:serviceID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:serviceID"/>
						</v2:serviceID>
						<v2:serviceInterfaceVersion>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
						</v2:serviceInterfaceVersion>
						<v2:timestamp>
							<xsl:value-of select="current-dateTime()"/>
						</v2:timestamp>
						<v2:referenceID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:referenceID"/>
						</v2:referenceID>
						<v2:correlationID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:correlationID"/>
						</v2:correlationID>
						<v2:identityID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:identityID"/>
						</v2:identityID>
					</v1:traceIdentifier>
				</v:usage-auth-rateResponse>
			</xsl:when>
			<xsl:otherwise>
				<v:usage-auth-rateResponse>
					<v1:er-response>
						<xsl:attribute name="id">
							<xsl:value-of select="$sbResponse/er-response/attribute::id"/>
						</xsl:attribute>
						<xsl:if test="$sbResponse/er-response/attribute::sub-id">
							<xsl:attribute name="sub-id">
								<xsl:value-of select="$sbResponse/er-response/attribute::sub-id"/>
							</xsl:attribute>
						</xsl:if>
						<v1:purchase-options>
							<v1:reason-code>
								<xsl:copy-of select="$sbResponse/er-response/payload/purchase-options/reason-code/*"/>
							</v1:reason-code>
							<v1:sub-reason-code>
								<xsl:copy-of select="$sbResponse/er-response/payload/purchase-options/sub-reason-code/*"/>
							</v1:sub-reason-code>
							<v1:packages> 
								<v1:package> 
									<xsl:copy-of select="$sbResponse/er-response/payload/purchase-options/packages/package/*"/>
								</v1:package> 
							</v1:packages>
							<v1:has-promotions>
								<xsl:value-of select="$sbResponse/er-response/payload/purchase-options/has-promotions"/>
							</v1:has-promotions>
							<xsl:if test="$sbResponse/er-response/payload/purchase-options/promotional-packages">
								<v1:promotional-packages> 
									<xsl:copy-of select="$sbResponse/er-response/payload/purchase-options/promotional-packages/*"/>
								</v1:promotional-packages>
							</xsl:if>
						</v1:purchase-options>
					</v1:er-response>
					<v1:traceIdentifier>
						<v2:applicationID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:applicationID"/>
						</v2:applicationID>
						<v2:serviceID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:serviceID"/>
						</v2:serviceID>
						<v2:serviceInterfaceVersion>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
						</v2:serviceInterfaceVersion>
						<v2:timestamp>
							<xsl:value-of select="current-dateTime()"/>
						</v2:timestamp>
						<v2:referenceID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:referenceID"/>
						</v2:referenceID>
						<v2:correlationID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:correlationID"/>
						</v2:correlationID>
						<v2:identityID>
							<xsl:value-of select="$context/v:usage-auth-rate/v1:traceIdentifier/v2:identityID"/>
						</v2:identityID>
					</v1:traceIdentifier>
				</v:usage-auth-rateResponse>
			</xsl:otherwise>
		</xsl:choose> 
	</xsl:template>
</xsl:stylesheet>

