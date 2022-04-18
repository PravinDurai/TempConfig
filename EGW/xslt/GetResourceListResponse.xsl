<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:m="http://www.tibco.com/asg/mapping"
  xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"
  xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" 
  xmlns:form="http://www.tibco.com/asg/functions/form"
  xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:h="http://www.tibco.com/asg/protocols/http"
  xmlns:k="http://www.tibco.com/asg/protocols/jms"
  xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:json="http://www.tibco.com/asg/functions/json"
  exclude-result-prefixes="#all"
>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/cnRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable>
	
	<!-- Handling Response -->
	<xsl:variable name="recdResponse">
		<xsl:copy-of select="codecs:base64ToText($context/c:context/c:entry[@key='asg:sbJMSResponse']/k:message/k:body)"/>
	</xsl:variable>

	<xsl:variable name="statusCode">
		<xsl:copy-of select="fn:normalize-space(fn:substring-before($recdResponse,'{'))"/>
	</xsl:variable>
	<xsl:variable name="jsonResponse">
		<xsl:copy-of select="concat('{',fn:substring-after($recdResponse,'{'))"/>
	</xsl:variable>

	<xsl:variable name="ResponseMasked">
	{
  "resource":{
    "id":{
      "msisdn":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'msisdn']"/>",
      "sim":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'sim']"/>"
    },
    "status":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'status']"/>",
    "activationDateTime":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'activationDateTime']"/>",
    "specification":{
      "puk":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'puk']"/>",
      "puk2":"<xsl:value-of select="json:parse($jsonResponse)//*[@key = 'puk2']"/>"
    }
  }
}
	</xsl:variable>

	<xsl:template match="/">
		<m:mapping-result>
			<m:context>
				<c:context>
					<c:entry key="asg:httpResponse">
						<h:response>
							<h:status-code>
								<xsl:value-of select="$statusCode"/>
							</h:status-code>
							<h:header name="Content-Type">application/json</h:header>
							<m:payload-text>
							<xsl:choose>
								<xsl:when test="$statusCode='200'">
									<xsl:value-of select="codecs:textToBase64($ResponseMasked)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="codecs:textToBase64($jsonResponse)"/>
								</xsl:otherwise>
							</xsl:choose> 
							</m:payload-text>
						</h:response>
					</c:entry>
				</c:context>
			</m:context>

		</m:mapping-result>
	</xsl:template>
</xsl:stylesheet>