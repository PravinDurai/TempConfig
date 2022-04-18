<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
   xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
   xmlns:ns0="http://schemas.xmlsoap.org/soap/envelope/"
   xmlns:asg_map="http://www.tibco.com/asg/mapping"
   xmlns:err="http://www.tibco.com/schemas/asg/error"
   xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/NotifyResourceServices" xmlns:ns2="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Notification" xmlns:ns3="http://xmlns.vodafone.co.uk/map/til/Common/CommonComponents"
   exclude-result-prefixes="xs ns1 ns2 ns0 ns xsi SOAP-ENV">

<xsl:variable name="nbRequest"><xsl:for-each select="/transformation/nbRequest"><xsl:copy-of select="document(@href)"/></xsl:for-each></xsl:variable>
<xsl:variable name="Destination"><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:destination"/></xsl:variable>
<xsl:variable name="EventType"><xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:event"/></xsl:variable>

<xsl:variable name="RoutingKey">
 <xsl:choose>
   <xsl:when test="$Destination='BAMBOO' and ($EventType=('NotifyResource','NotifyResourceServiceBars','NotifyResourceServices'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:otherwise>Undefined</xsl:otherwise>
 </xsl:choose>
</xsl:variable>

<xsl:template match="/">
 <output>
   <routingKey1><xsl:value-of select="$Destination"/></routingKey1>
   <routingKey2><xsl:value-of select="$EventType"/></routingKey2>
   <routingKey><xsl:value-of select="$RoutingKey"/></routingKey>
 </output>
</xsl:template>
</xsl:stylesheet>