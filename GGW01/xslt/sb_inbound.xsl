<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:map="http://www.tibco.com/asg/mapping"
  xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"
  xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" 
  xmlns:form="http://www.tibco.com/asg/functions/form"
  xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:h="http://www.tibco.com/asg/protocols/http"
  xmlns:k="http://www.tibco.com/asg/protocols/jms"
  xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
  xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties"
  xmlns:ns1="http://www.tibco.com/schemas/mathops_insinglemsg"
  exclude-result-prefixes="xsl soap12 map k soap11 c h form codecs"
>
	<xsl:output method="xml" version="1.0" encoding="UTF-8" 
indent="yes" omit-xml-declaration="yes"/>
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


	<xsl:variable name="httpRequestURI">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-uri"/>
	</xsl:variable>
	<xsl:variable name="httpMethod">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:method"/>
	</xsl:variable>
	<xsl:variable name="httpQueryString">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:query-string"/>
	</xsl:variable>
	<xsl:variable name="authorization">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='authorization']"/>
	</xsl:variable>
	<xsl:variable name="httpPayload">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:body"/>
	</xsl:variable>
	<xsl:variable name="Source">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='x-source']"/>
	</xsl:variable>
	<xsl:variable name="Originator">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='originator']"/>
	</xsl:variable>
	<xsl:variable name="TransactionID">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='x-transactionid']"/>
	</xsl:variable>
	<xsl:variable name="Date">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='date']"/>
	</xsl:variable>

	<!-- TOBI -->
	<xsl:variable name="recdRequest">
		<xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
	</xsl:variable>
	<xsl:variable name="requestId">
		<xsl:copy-of select="$recdRequest/h:request/h:request-id"/>
	</xsl:variable>
	<xsl:variable name="GetPartnerName">
		<xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
	</xsl:variable>


	<!-- TOBI --> 
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
            <k:override-header name="authorization"><xsl:value-of select="$authorization"/></k:override-header>
			<k:override-header name="source"><xsl:value-of select="$GetPartnerName"/></k:override-header>
			<k:override-header name="originator"><xsl:value-of select="$GetPartnerName"/></k:override-header>
			<k:override-header name="transactionid"><xsl:value-of select="$TransactionID"/></k:override-header>
			<k:override-header name="date"><xsl:value-of select="$Date"/></k:override-header>
           </c:entry>
          </c:context>
         </map:context>
  
             <map:payload isBinary="true"><xsl:copy-of select="$httpPayload"/></map:payload>
        
        </map:mapping-result>

    </map:payload-xml>
   </map:repeat> 
     
</xsl:template>
	<!--<xsl:template match="/">
		<map:mapping-result>
			<map:failOnError>false</map:failOnError>
			<map:context>
				<c:context>
					<c:entry key="asg:jmsRequest">
						<k:override-header name="http_query_string">
							<xsl:value-of select="$httpQueryString"/>
						</k:override-header>
						<k:override-header name="http_request_uri">
							<xsl:value-of select="$httpRequestURI"/>
						</k:override-header>
						<k:override-header name="http_method">
							<xsl:value-of select="$httpMethod"/>
						</k:override-header>
						<k:override-header name="authorization">
							<xsl:value-of select="$authorization"/>
						</k:override-header>
						<k:override-header name="source">
							<xsl:value-of select="$GetPartnerName"/>
						</k:override-header>
						<k:override-header name="originator">
							<xsl:value-of select="$GetPartnerName"/>
						</k:override-header>
						<k:override-header name="transactionid">
							<xsl:value-of select="$TransactionID"/>
						</k:override-header>
						<k:override-header name="date">
							<xsl:value-of select="$Date"/>
						</k:override-header>
					</c:entry>
				</c:context>
			</map:context>
			<map:payload-xml>
				<xsl:copy-of select="$httpPayload"/>
			</map:payload-xml>
		</map:mapping-result>
	</xsl:template>-->
</xsl:stylesheet>