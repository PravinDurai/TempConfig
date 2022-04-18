<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
xmlns:get="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerContactManagement/CustomerDataPresentation/GetSubscriptionDetails">

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/cnRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>	
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>

	<xsl:template match="/">
		<get:GetSubscriptionDetailsRequest>
			<xsl:copy-of select="$cnRequest/soap:Envelope/soap:Body/get:GetSubscriptionDetailsRequest/*"/>
		</get:GetSubscriptionDetailsRequest>
	</xsl:template>
</xsl:stylesheet>