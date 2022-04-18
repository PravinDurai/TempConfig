<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/contentSellingManagement/messages/v.1.1" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

	<xsl:variable name="nbRequestHref"><xsl:value-of select="/transformation/nbRequest/@href"/></xsl:variable>
	<xsl:variable name="nbRequest"><xsl:copy-of select="document($nbRequestHref)"/></xsl:variable>

	<xsl:template match="/">
   <map:mapping-result xmlns:map="http://www.tibco.com/asg/mapping">
      <map:context>
       <c:context>
	     <c:entry key="asg:httpRequest">
             <h:override-header name="Content-Type">text/xml</h:override-header>
			 <h:override-header name="accept-encoding">identity</h:override-header>
			 <h:override-header name="accept-charset">iso-8859-1,*,utf-8</h:override-header>
         </c:entry>
        </c:context>
    </map:context>
    <map:payload-xml>
     	<er-request>
			<xsl:attribute name="id">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::id"/>
			</xsl:attribute>
			<xsl:attribute name="client-application-id">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::client-application-id"/>
			</xsl:attribute>
			<xsl:attribute name="ModifySubscriptionCharging_locale">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::ModifySubscriptionCharging_locale"/>
			</xsl:attribute>
            <xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::language_locale">
			<xsl:attribute name="language_locale">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::language_locale"/>
			</xsl:attribute>
            </xsl:if>
            <xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::client-domain">
			<xsl:attribute name="client-domain">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::client-domain"/>
			</xsl:attribute>
            </xsl:if>
            <xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::domain-translator-context">
			<xsl:attribute name="domain-translator-context">
				<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/attribute::domain-translator-context"/>
			</xsl:attribute>
            </xsl:if>
			<payload>
				<modify-subscription-charging-method> 
					<msisdn>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:msisdn"/>
					</msisdn>
					<subscription-id>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:subscription-id"/>
					</subscription-id>
					<charging-method>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:charging-method"/>
					</charging-method>
			        <xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:device-type">
					<device-type>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:device-type"/>
					</device-type>
			        </xsl:if> 
					<xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:csr-id">
					<csr-id>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:csr-id"/>
					</csr-id>
			        </xsl:if> 
					<xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:reason">
					<reason>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:reason"/>
					</reason>
			        </xsl:if> 
					<xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:log-id">
					<log-id>
						<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:ModifySubscriptionChargingRequest/v1:log-id"/>
					</log-id>
          			</xsl:if> 
					</modify-subscription-charging-method>
			</payload>
			<xsl:if test="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:log-id">
				<log-id>
					<xsl:value-of select="$nbRequest/v:ModifySubscriptionCharging/v1:er-request/v1:log-id"/>
				</log-id>
			</xsl:if> 
		</er-request>
	  </map:payload-xml>
     </map:mapping-result>
	</xsl:template>
</xsl:stylesheet>