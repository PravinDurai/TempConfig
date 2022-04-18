<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:map="http://www.tibco.com/asg/mapping"
   xmlns:soap12="http://www.w3.org/2003/05/soap-envelope"
   xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:form="http://www.tibco.com/asg/functions/form"
   xmlns:c="http://www.tibco.com/schemas/asg/context"
   xmlns:h="http://www.tibco.com/asg/protocols/http"
   xmlns:f="http://www.tibco.com/asg/content-types/form"
   xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
   exclude-result-prefixes="xsl soap11 c h form codecs">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

   <xsl:variable name="cnRequestHref"><xsl:value-of select="/transformation/cnRequest/@href"/></xsl:variable>
   <xsl:variable name="context">
      <c:context><xsl:for-each select="/transformation/context"><xsl:copy-of select="document(@href)/c:context/*"/></xsl:for-each></c:context>
  </xsl:variable>
  <xsl:variable name="recdRequest"><xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/></xsl:variable>

    <xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>
  
<xsl:template match="/">
   <map:mapping-result>
      <map:context>
       <c:context>
	     <c:entry key="asg:jmsRequest">
             <h:override-header name="Content-Type">text/xml; charset=utf-8</h:override-header>
         </c:entry>
        </c:context>
    </map:context>
    <map:payload-xml><xsl:copy-of select="$cnRequest"/></map:payload-xml>
</map:mapping-result>
</xsl:template>
</xsl:stylesheet>