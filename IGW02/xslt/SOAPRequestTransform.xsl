<?xml version="1.0"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:k="http://www.tibco.com/asg/protocols/jms" xmlns:map="http://www.tibco.com/asg/mapping" xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties" xmlns:h="http://www.tibco.com/asg/protocols/http" exclude-result-prefixes="xsl map k c h mapperUtils" >
  <xsl:output method="xml" indent="yes"/>
     <xsl:variable name="cnRequestHref"><xsl:value-of select="/transformation/cnRequest/@href"/></xsl:variable>
    <xsl:variable name="cnRequest">
    <xsl:copy-of select="document($cnRequestHref)"/>
  </xsl:variable>
   <xsl:variable name="recdRequest"><xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/></xsl:variable>
	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable> 
                 <xsl:variable name="contextHref">
					<xsl:value-of select="/transformation/context/@href"/>
                </xsl:variable>
                <xsl:variable name="httpRequest">
                    <xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
                </xsl:variable>
                <xsl:variable name="requestId">
                    <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-id"/>
                </xsl:variable>
                    <xsl:variable name="GetPartnerName">
                <xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
       </xsl:variable>
 <xsl:template match="/">
   <map:mapping-result>
      <map:context>
       <c:context>
	  <c:entry key="asg:jmsRequest">
			<k:override-header name="Source">
			<xsl:value-of select="$GetPartnerName"/>
			</k:override-header>
    </c:entry>
        </c:context>
    </map:context>
    <map:payload-xml><xsl:copy-of select="$cnRequest"/></map:payload-xml>
</map:mapping-result>
</xsl:template>
</xsl:stylesheet>