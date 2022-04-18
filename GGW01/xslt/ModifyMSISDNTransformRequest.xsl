<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:v="http://www.vodafone.com/vf/contentSellingManagement/interface/v.1.1" xmlns:v1="http://www.vodafone.com/vf/contentSellingManagement/messages/v.1.1" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">	

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
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::id" />
			</xsl:attribute>
			<xsl:attribute name="client-application-id">
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::client-application-id" />
			</xsl:attribute>
			<xsl:attribute name="purchase_locale">
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::purchase_locale" />
			</xsl:attribute>
			<xsl:attribute name="language_locale">
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::language_locale" />
			</xsl:attribute>
			<xsl:attribute name="client-domain">
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::client-domain" />
			</xsl:attribute>
			<xsl:attribute name="domain-translator-context">
				<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/attribute::domain-translator-context" />
			</xsl:attribute>
			<payload>
				<modify-msisdn>
					<msisdn>
						<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/v1:ModifyMSISDNRequest/v1:msisdn" />
					</msisdn>
					<new-msisdn>
						<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/v1:ModifyMSISDNRequest/v1:new-msisdn" />
					</new-msisdn>
					<csr-id>
						<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/v1:ModifyMSISDNRequest/v1:csr-id" />
					</csr-id>
					<reason>
						<xsl:value-of select="$nbRequest/v:ModifyMSISDN/v1:er-request/v1:ModifyMSISDNRequest/v1:reason" />
					</reason>
				</modify-msisdn>
			</payload> 
		</er-request>
	  </map:payload-xml>
     </map:mapping-result>
	</xsl:template>
</xsl:stylesheet>