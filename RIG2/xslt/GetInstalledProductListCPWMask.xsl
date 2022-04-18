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
xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" 
xmlns:ns2="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/InstalledProduct/V2" 
xmlns:ns3="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2" 
xmlns:ns4="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/InstalledProduct/V2"
xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/GetInstalledProductList" 
version="2.0" 
exclude-result-prefixes="xsl soap12 map k soap11 c h form codecs">

<xsl:strip-space elements="*"/>
<xsl:output omit-xml-declaration="yes" indent="yes"/>

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
	<!-- Any elements that need to be removed from the response payload should be specified here -->
    
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:OwnerPartyReference/ns1:LocationReference/ns1:Name"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:SupplierPartyReference/ns1:PartyIdentification/ns1:ApplicationObjectKey/ns1:ID"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:Note/ns1:Content"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstallationDateTime"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:EffectiveTimePeriod/ns1:StartDateTime"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:EffectiveTimePeriod/ns1:EndDateTime"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductEmployee"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:RegistrationStatus/ns1:EffectiveDateTime"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns1:Status/ns1:EffectiveDateTime"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductSpecificationGroup/ns1:SpecificationGroup/ns1:Specification[ns1:Name!='IMSI']"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductSpecificationGroup/ns1:SpecificationGroup/ns1:Specification/ns1:Identification/ns1:ApplicationObjectKey/ns1:ID"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductSpecificationGroup/ns1:SpecificationGroup/ns1:Specification/ns1:DataTypeCode"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductSpecificationGroup/ns1:SpecificationGroup/ns1:Specification/ns1:Custom/ns1:Description"/>		
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductPrice/ns1:Price[ns1:TypeCode='UpfrontCost']/ns1:TypeCode"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductPrice/ns1:Price[ns1:TypeCode='DeviceBuyOutCost']/ns1:TypeCode"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductPrice/ns1:Price[ns1:TypeCode='UpfrontCost']/ns1:Amount"/>
	<xsl:template match="ns0:QueryInstalledProductListResponse/ns2:QueryInstalledProductListResponse/ns2:InstalledProductPrice/ns1:Price[ns1:TypeCode='DeviceBuyOutCost']/ns1:Amount"/>	
</xsl:stylesheet>