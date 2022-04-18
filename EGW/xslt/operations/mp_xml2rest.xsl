<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:j="http://www.tibco.com/asg/content-types/json"
    xmlns:f="http://www.tibco.com/asg/content-types/form"
    xmlns:m="http://www.tibco.com/asg/mapping"
    xmlns:c="http://www.tibco.com/schemas/asg/context"
    xmlns:h="http://www.tibco.com/asg/protocols/http"
    xmlns:v="http://tag-pg.vipnet.hr/pg/content-types/formdata"
    xmlns:form="http://www.tibco.com/asg/functions/form"
    xmlns:json="http://www.tibco.com/asg/functions/json"
    xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
    exclude-result-prefixes="xsl soapenv fn h c j f v form json"
    >

<xsl:variable name="context">
 <xsl:for-each select="/transformation/context">
  <xsl:copy-of select="document(@href)"/>
 </xsl:for-each>
</xsl:variable>

<xsl:variable name="httpRequest">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
</xsl:variable>

<xsl:template match="/">
  <xsl:if test="/output">
    <xsl:copy-of select="/output"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>