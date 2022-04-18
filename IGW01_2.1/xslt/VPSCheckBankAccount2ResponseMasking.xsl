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
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/BankWizard/CheckBankAccount"

version="2.0" 
exclude-result-prefixes="xsl soap12 map k soap11 c h form codecs">

<xsl:variable name="contextHref">
<xsl:value-of select="/transformation/context/@href"/>
</xsl:variable>
<xsl:variable name="JMSResponse">
<xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:sbJMSResponse']/h:response/*"/>
</xsl:variable>
<xsl:variable name="sbResponse123">
<xsl:copy-of select="codecs:base64ToText($JMSResponse/h:body)"/>
</xsl:variable>


   <xsl:variable name="sbResponse">
      <xsl:if test="/transformation/sbResponse/@size>0">
         <xsl:copy-of select="document(/transformation/sbResponse/@href)"/>
      </xsl:if>
   </xsl:variable>
   

	
	<xsl:template match="/">
		<xsl:for-each select="$sbResponse">
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
	<xsl:template match="ns0:CheckBankAccountResponse/ns0:directDebitAllowed"/>       
	<xsl:template match="ns0:CheckBankAccountResponse/ns0:auddisAllowed"/>

			 	
</xsl:stylesheet>