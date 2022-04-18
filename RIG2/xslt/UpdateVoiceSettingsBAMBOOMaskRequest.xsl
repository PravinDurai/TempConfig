<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:map="http://www.tibco.com/asg/mapping" 
xmlns:soap12="http://www.w3.org/2003/05/soap-envelope" 
xmlns:soap11="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:form="http://www.tibco.com/asg/functions/form" 
xmlns:c="http://www.tibco.com/schemas/asg/context" 
xmlns:h="http://www.tibco.com/asg/protocols/http" 
xmlns:k="http://www.tibco.com/asg/protocols/jms" 
xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon"
xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/SalesOrder/V2" 
xmlns:upd="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/UpdateVoiceSettings" 
version="2.0" 
exclude-result-prefixes="xsl soap12 map k soap11 c h form codecs">

<xsl:strip-space elements="*"/>
<xsl:output omit-xml-declaration="yes" indent="yes"/>

<xsl:variable name="contextHref">
<xsl:value-of select="/transformation/context/@href"/>
</xsl:variable>

   <xsl:variable name="nbRequest">
      <xsl:if test="/transformation/nbRequest/@size>0">
         <xsl:copy-of select="document(/transformation/nbRequest/@href)"/>
      </xsl:if>
   </xsl:variable>
   

	
	<xsl:template match="/">
		<xsl:for-each select="$nbRequest">
			<xsl:copy>
				<xsl:apply-templates select="@* | node()"/>
			</xsl:copy>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>  
        </xsl:copy>
    </xsl:template>
	<xsl:template match="upd:UpdateVoiceSettingsRequest/upd:FNP"/>
	</xsl:stylesheet>