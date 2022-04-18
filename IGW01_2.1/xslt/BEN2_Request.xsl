<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.tibco.com/asg/mapping"
  xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"
  xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" 
  xmlns:form="http://www.tibco.com/asg/functions/form"
  xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:h="http://www.tibco.com/asg/protocols/http"
  xmlns:k="http://www.tibco.com/asg/protocols/jms"
  xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
  xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties"
  xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
  xmlns:ns1="http://www.tibco.com/schemas/mathops_insinglemsg"
  exclude-result-prefixes="xsl soap12 ns xsi SOAP-ENV map k soap11 c h form codecs"
>
<xsl:output method="xml" version="1.0" encoding="UTF-8" 
indent="yes" omit-xml-declaration="no"/>
<xsl:variable name="cnRequestHref">
   <xsl:value-of select="/transformation/cnRequest/@href"/>
</xsl:variable>
  	<xsl:variable name="contextHref">
  		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
<xsl:variable name="context">
 <c:context>
 <xsl:for-each select="/transformation/context">
  <xsl:copy-of select="document(@href)/c:context/*"/>
 </xsl:for-each>
 </c:context>
</xsl:variable>


<xsl:variable name="nbRequest">
<xsl:for-each select="/transformation/nbRequest"><xsl:copy-of select="document(@href)"/></xsl:for-each></xsl:variable>
<xsl:variable name="recdRequest">
   <xsl:copy-of select="$context/c:context/c:entry[@key='asg:jmsRequest']/k:request"/>
</xsl:variable>
<xsl:variable name="httpRequestURI">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-uri"/>
</xsl:variable>
<xsl:variable name="httpMethod">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:method"/>
</xsl:variable>
<xsl:variable name="httpQueryString">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:query-string"/>
</xsl:variable>
<xsl:variable name="httpPayload">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:body"/>
</xsl:variable>
<xsl:variable name="Custom">
<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:custom"/></xsl:variable>
<xsl:variable name="EventType">
<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns:BusinessEventNotification/ns:eventType"/>
</xsl:variable>

<xsl:template match="/">

   <map:repeat> 
    <map:payload-xml>
 
	<map:mapping-result>
	 <map:context>
	  <c:context>
	   <c:entry key="asg:jmsRequest">
            <k:override-header name="http_query_string"><xsl:value-of select="$httpQueryString"/> </k:override-header>
			<k:override-header name="http_request_uri"><xsl:value-of select="$httpRequestURI"/> </k:override-header>
            <k:override-header name="http_method"><xsl:value-of select="$httpMethod"/></k:override-header>
	     	<k:override-header name="EventType"><xsl:value-of select="$EventType"/></k:override-header>
			<k:override-header name="custom"><xsl:value-of select="$Custom"/></k:override-header>
			</c:entry>
          </c:context>
         </map:context>
  
             <map:payload isBinary="false"><xsl:copy-of select="$httpPayload"/></map:payload>
              <!--<map:payload isBinary="true"><xsl:copy-of select="$recdRequest"/></map:payload>-->
        
        </map:mapping-result>

    </map:payload-xml>
   </map:repeat> 
 
</xsl:template>
</xsl:stylesheet>