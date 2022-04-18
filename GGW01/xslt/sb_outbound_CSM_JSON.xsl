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
  xmlns:dp="http://www.datapower.com/extensions"
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

<xsl:variable name="recdRequest">
        <xsl:copy-of select="$context/c:context/c:entry[@key='asg:jmsRequest']/k:request"/>
</xsl:variable>

<xsl:variable name="httpPayload">
        <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:body"/>
</xsl:variable>

<!-- Handling Response -->
<xsl:variable name="tranid">
        <xsl:copy-of select="$context/c:context/c:entry[@key='asg:sbJMSResponse']/k:message/k:TransactionId"/>
</xsl:variable>
<xsl:variable name="recdResponse">
        <xsl:copy-of select="codecs:base64ToText($context/c:context/c:entry[@key='asg:sbJMSResponse']/k:message/k:body)"/>
</xsl:variable>
<xsl:variable name="jmsCorrelationId">
        <xsl:copy-of select="($context/c:context/c:entry[@key='asg:sbJMSResponse']/k:message/k:JMSCorrelationID)"/>
</xsl:variable>
<xsl:variable name="statusCode">
        <xsl:copy-of select="fn:normalize-space(fn:substring-before($recdResponse,'['))"/>
</xsl:variable>
<xsl:variable name="statusCodeError">
        <xsl:copy-of select="fn:normalize-space(fn:substring-before($recdResponse,'{'))"/>
</xsl:variable>
<xsl:variable name="jsonErrorResponse">
        <xsl:copy-of select="codecs:textToBase64(concat('{',fn:substring-after($recdResponse,'{')))"/>
</xsl:variable>
<xsl:variable name="jsonResponse">
        <xsl:copy-of select="codecs:textToBase64(concat('[',fn:substring-after($recdResponse,'[')))"/>
</xsl:variable>
<!-- For Technical Error Message -->
<xsl:variable name="ErrorMessage">
        <xsl:copy-of select="fn:normalize-space(fn:translate(fn:substring-after(fn:substring-before(fn:substring-after($recdResponse,'&quot;description&quot;:'),'}'),'&quot;value&quot;:'),'&quot;',''))"/>
</xsl:variable>
<!-- For Detailed Error Code -->
<!--<xsl:variable name="DetailedErrorResponseCodelength">
        <xsl:copy-of select="fn:string-length(fn:normalize-space(fn:translate(fn:substring-after(fn:substring-before($recdResponse,'}'),'&quot;detailedCode&quot;:'),'&quot;','')))"/>
</xsl:variable>-->
<xsl:variable name="detailedErrorCode">
        <xsl:copy-of select="fn:normalize-space(fn:translate(fn:substring-after(fn:substring-before($recdResponse,'}'),'&quot;detailedCode&quot;:'),'&quot;',''))"/>
</xsl:variable>
<!-- For tilErrorCode -->
<xsl:variable name="tilErrorCode">
        <xsl:copy-of select="fn:normalize-space(fn:translate(fn:substring-after(fn:substring-before(fn:substring-after($recdResponse,'&quot;errorCode&quot;:'),'}'),'&quot;value&quot;:'),'&quot;',''))"/>
</xsl:variable>
<xsl:variable name="currentDateTime">
        <xsl:value-of select="current-dateTime()"/>
</xsl:variable>

<xsl:template match="/">

<m:mapping-result>
        <m:context>
         <c:context>
          <c:entry key="asg:httpResponse">
           <h:response>
            <xsl:choose>
                     <xsl:when test="$statusCode ='200'">
                        <h:status-code><xsl:value-of select="$statusCode"/></h:status-code>
                        <h:header name="Content-Type">application/json</h:header>
			<h:header name='X-MessageID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-Correlation-ConversationID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-ResultStatus-Timestamp'><xsl:value-of select="$currentDateTime"/></h:header>
                        <h:header name='X-ResultStatus-ErrorCode'>000</h:header>
                        <h:header name='X-ResultStatus-Message'>Success</h:header>
                        <m:payload-text>
                                <xsl:value-of select="$jsonResponse"/>
                        </m:payload-text>
                    </xsl:when>

			<!-- Technical Error -->
                    <xsl:when test="$tilErrorCode &gt;= '400' and $tilErrorCode &lt;= '489'">
                        <h:status-code><xsl:value-of select="$statusCodeError"/></h:status-code>
                        <h:header name="Content-Type">application/json</h:header>
			<h:header name='X-MessageID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-Correlation-ConversationID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <m:payload-text><xsl:value-of select="$jsonErrorResponse"/></m:payload-text>
                    </xsl:when>
					
                        <!-- Business Error -->
                    <xsl:when test="$tilErrorCode &gt;= '490' and $tilErrorCode &lt;= '999'">
                        <h:status-code><xsl:value-of select="$statusCodeError"/></h:status-code>
                        <h:header name="Content-Type">application/json</h:header>
			<h:header name='X-MessageID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-Correlation-ConversationID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-ResultStatus-Timestamp'><xsl:value-of select="$currentDateTime"/></h:header>
                        <h:header name='X-ResultStatus-ErrorCode'><xsl:value-of select="$tilErrorCode"/></h:header>
			<xsl:if test="fn:string-length($detailedErrorCode) &gt; 0 ">
			<h:header name='X-ResultStatus-ReasonCode'><xsl:value-of select="$detailedErrorCode"/></h:header>
			</xsl:if>
			<h:header name='X-ResultStatus-Message'><xsl:value-of select="$ErrorMessage"/></h:header>
                        <m:payload-text>{}</m:payload-text>
                    </xsl:when>	
		    <xsl:otherwise>
			<h:status-code>500</h:status-code>
                        <h:header name="Content-Type">application/json</h:header>
			<h:header name='X-MessageID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
                        <h:header name='X-Correlation-ConversationID'><xsl:value-of select="$jmsCorrelationId"/></h:header>
			<m:payload-text>{}</m:payload-text>
		    </xsl:otherwise>
          </xsl:choose>
         </h:response>
        </c:entry>
       </c:context>
      </m:context>
     </m:mapping-result>
    </xsl:template>
</xsl:stylesheet>

