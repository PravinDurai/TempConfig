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
		<xsl:for-each select="/transformation/cnRequest">
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
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::id"/>
			</xsl:attribute>
			<xsl:attribute name="client-application-id">
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::client-application-id"/>
			</xsl:attribute>
			<xsl:attribute name="purchase_locale">
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::purchase_locale"/>
			</xsl:attribute>
			<xsl:attribute name="language_locale">
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::language_locale"/>
			</xsl:attribute>
			<xsl:attribute name="client-domain">
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::client-domain"/>
			</xsl:attribute>
			<xsl:attribute name="domain-translator-context">
				<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/attribute::domain-translator-context"/>
			</xsl:attribute>
			<payload>
				<purchase> 
					<msisdn>
						<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:msisdn"/>
					</msisdn>
					<package-id>
						<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:package-id"/>
					</package-id>
					<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes">
						<purchase-attributes>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:is-repurchase">
								<is-repurchase>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:is-repurchase"/>
								</is-repurchase>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:force-reservation">
								<force-reservation>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:force-reservation"/>
								</force-reservation>
							</xsl:if>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:status">
								<status>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:status"/>
								</status>
							</xsl:if>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:start-date">
								<start-date>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:start-date"/>
								</start-date>
							</xsl:if>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:end-date">
								<end-date>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:purchase-attributes/v1:end-date"/>
								</end-date>
							</xsl:if>
						</purchase-attributes>
					</xsl:if>
					<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes">
						<rating-attributes>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/asset-id">
								<asset-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/asset-id"/>
								</asset-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/content-name">
								<content-name>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/content-name"/>
								</content-name>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-id">
								<device-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-id"/>
								</device-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-type">
								<device-type>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-type"/>
								</device-type>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/payment-type">
								<payment-type>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/payment-type"/>
								</payment-type>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/bearer">
								<bearer>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/bearer"/>
								</bearer>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/event-date-time">
								<event-date-time>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/event-date-time"/>
								</event-date-time>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/express-purchase-flag">
								<express-purchase-flag>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/express-purchase-flag"/>
								</express-purchase-flag>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/is-interactive">
								<is-interactive>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/is-interactive"/>
								</is-interactive>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/promo-code">
								<promo-code>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/promo-code"/>
								</promo-code>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-name">
								<device-name>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/device-name"/>
								</device-name>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/access-channel">
								<access-channel>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/access-channel"/>
								</access-channel>
							</xsl:if>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/duration">
								<duration>
									<unit>
										<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/duration/unit"/>
									</unit>
									<value>
										<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/duration/value"/>
									</value>
									<duration-code>
										<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/duration/duration-code"/>
									</duration-code>
									<translated-duration-string>
										<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/duration/translated-duration-string"/>
									</translated-duration-string>
								</duration>
							</xsl:if>
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/payment-information">
								<payment-information>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/payment-information"/>
								</payment-information>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/network-code-string">
								<network-code-string>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/network-code-string"/>
								</network-code-string>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/pre-rate">
								<pre-rate>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/pre-rate"/>
								</pre-rate>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/purchase-channel">
								<purchase-channel>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/purchase-channel"/>
								</purchase-channel>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/tax-rate">
								<tax-rate>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/tax-rate"/>
								</tax-rate>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/has-tax-rate">
								<has-tax-rate>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/has-tax-rate"/>
								</has-tax-rate>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/affiliate-id">
								<affiliate-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/affiliate-id"/>
								</affiliate-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-field1">
								<external-field1>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-field1"/>
								</external-field1>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-field2">
								<external-field2>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-field2"/>
								</external-field2>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-trans-id">
								<external-trans-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/external-trans-id"/>
								</external-trans-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/tariff">
								<tariff>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/tariff"/>
								</tariff>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/partner-id">
								<partner-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/partner-id"/>
								</partner-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/aggregator-id">
								<aggregator-id>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/aggregator-id"/>
								</aggregator-id>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/recipient-msisdn">
								<recipient-msisdn>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/recipient-msisdn"/>
								</recipient-msisdn>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/product-code">
								<product-code>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/product-code"/>
								</product-code>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/merchant-name">
								<merchant-name>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/merchant-name"/>
								</merchant-name>
							</xsl:if> 
							<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/invoice-text">
								<invoice-text>
									<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:rating-attributes/invoice-text"/>
								</invoice-text>
							</xsl:if> 
						</rating-attributes>
					</xsl:if>
					<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:log-id">
						<log-id>
							<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:PurchaseRequest/v1:log-id"/>
						</log-id>
					</xsl:if> 
				</purchase>
			</payload>
			<xsl:if test="$nbRequest/v:Purchase/v1:er-request/v1:log-id">
				<log-id>
					<xsl:value-of select="$nbRequest/v:Purchase/v1:er-request/v1:log-id"/>
				</log-id>
			</xsl:if> 
		</er-request>
	</map:payload-xml>
  </map:mapping-result>
  </xsl:template>
</xsl:stylesheet>