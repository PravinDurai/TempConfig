<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
        xmlns:xs="http://www.w3.org/2001/XMLSchema" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
		xmlns:map="http://www.tibco.com/asg/mapping"
		xmlns:k="http://www.tibco.com/asg/protocols/jms"
	 xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
	 xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
	 xmlns:h="http://www.tibco.com/asg/protocols/http"
	 xmlns:asg="http://www.tibco.com/asg/error"
	 xmlns:c="http://www.tibco.com/schemas/asg/context"
	 xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
<xsl:output omit-xml-declaration="yes" indent="yes"/>
<xsl:variable name="context">
 <xsl:for-each select="/transformation/nbRequest">
  <xsl:copy-of select="document(@href)"/>
 </xsl:for-each>
</xsl:variable>
<xsl:variable name="httpPayload">
  <xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:body"/>
</xsl:variable>
<xsl:template match="/">

   <map:repeat> 
    <map:payload-xml>
 
	<map:mapping-result>
	 <map:context>
	  <c:context>
	   <c:entry key="asg:httpRequest">
            <k:override-header name="OperationAction">CREATE</k:override-header>
           </c:entry>
          </c:context>
         </map:context>
  
             <map:payload isBinary="true"><xsl:copy-of select="$httpPayload"/></map:payload>
        
        </map:mapping-result>

    </map:payload-xml>
   </map:repeat> 
 
</xsl:template>
</xsl:stylesheet>