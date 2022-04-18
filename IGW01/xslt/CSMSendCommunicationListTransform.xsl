<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:k="http://www.tibco.com/asg/protocols/jms" xmlns:m="http://www.tibco.com/asg/mapping" >
<xsl:strip-space elements="*"/>
<xsl:output method="xml" indent="yes" omit-xml-declaration="yes" />
<xsl:template match="/">
<m:mapping-result>
  	  <m:context>
	    <c:context>
	    <c:entry key="asg:httpResponse">
	     <h:response>
		   <h:override-header name="Content-Type">text/xml;charset=utf-8</h:override-header>
  	     </h:response>
	   </c:entry>
	   </c:context>
        </m:context>
</m:mapping-result>
</xsl:template>
</xsl:stylesheet>
