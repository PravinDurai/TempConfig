<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
   xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification"
   xmlns:ns2="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
   exclude-result-prefixes="xs ns1 ns2 ns0 ns xsi SOAP-ENV">

<xsl:variable name="nbRequest"><xsl:for-each select="/transformation/nbRequest"><xsl:copy-of select="document(@href)"/></xsl:for-each></xsl:variable>
<xsl:variable name="Destination"><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:destination"/></xsl:variable>
<xsl:variable name="EventType"><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns1:BusinessEventNotification/ns1:eventType"/></xsl:variable>

<xsl:variable name="RoutingKey">
 <xsl:choose>
   <xsl:when test="$Destination='VPS' and ($EventType=('SALESORDERNOTIFICATION','CREDITVETEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:otherwise>Undefined</xsl:otherwise>
 </xsl:choose>
</xsl:variable>

<xsl:template match="/">
 <output>
  <routingKey>
    <xsl:value-of select="$RoutingKey"/>
  </routingKey>
 </output>
</xsl:template>
</xsl:stylesheet>