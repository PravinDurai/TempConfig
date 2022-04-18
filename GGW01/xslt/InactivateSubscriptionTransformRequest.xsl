<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:v="http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1"
	xmlns:v1="http://www.vodafone.com/vf/contentSellingManagement/messages/v.1.1"
	xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>

	<xsl:template match="/">
		<er-request>
			<xsl:attribute name="id">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::id"/>
			</xsl:attribute>
			<xsl:attribute name="client-application-id">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::client-application-id"/>
			</xsl:attribute>
			<xsl:attribute name="purchase_locale">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::purchase_locale"/>
			</xsl:attribute>
			<xsl:attribute name="language_locale">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::language_locale"/>
			</xsl:attribute>
			<xsl:attribute name="client-domain">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::client-domain"/>
			</xsl:attribute>
			<xsl:attribute name="domain-translator-context">
				<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/attribute::domain-translator-context"/>
			</xsl:attribute>
			<payload>
				<inactivate-subscription>
					<xsl:variable name="msisdn" select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:msisdn"/>
					<msisdn>
						<xsl:value-of select="substring-after($msisdn, 'tel:')"/>
					</msisdn>
					<subscription-id>
						<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:subscription-id"/>
					</subscription-id>
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:csr-id">
						<csr-id>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:csr-id"/>
						</csr-id>
					</xsl:if> 
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:reason">
						<reason>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:reason"/>
						</reason>
					</xsl:if> 
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:log-id">
						<log-id>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:log-id"/>
						</log-id>
					</xsl:if> 
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:apply-penalty-charge">
						<apply-penalty-charge>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:apply-penalty-charge"/>
						</apply-penalty-charge>
					</xsl:if> 
					<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:override-disallow-flag">
						<override-disallow-flag>
							<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:InactivateSubscriptionRequest/v1:override-disallow-flag"/>
						</override-disallow-flag>
					</xsl:if> 
				</inactivate-subscription>
				<xsl:if test="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:log-id">
					<log-id>
						<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:InactivateSubscription/v1:er-request/v1:log-id"/>
					</log-id>
				</xsl:if> 
			</payload>
		</er-request>
	</xsl:template>
</xsl:stylesheet>
