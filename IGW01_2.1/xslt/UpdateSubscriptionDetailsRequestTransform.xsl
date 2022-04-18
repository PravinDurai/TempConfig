<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header"
xmlns:vod="http://xmlns.vodafone.co.uk/map/til/Common/SimpleTypes"
xmlns:ns="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMContactDetails"
xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/UpdateSubscriptionDetails"
xmlns:ns5="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMContactDetails"
xmlns:ns2="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMPerson"
xmlns:ns3="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMAddress"
xmlns:ns4 = "http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMMarketingPreference" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error">

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
		<ns0:UpdateSubscriptionDetailsRequest>
			<ns0:CTN>
				<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns0:CTN"/>
			</ns0:CTN>
			<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails!=''">
				<ns5:CRMContactDetails>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:ID!=''">
						<ns5:ID>
							<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:ID"/>
						</ns5:ID>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns2:CRMPerson!=''">
						<ns2:CRMPerson>
							<xsl:copy-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns2:CRMPerson/*"/>
						</ns2:CRMPerson>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:specialRequirements!=''">
						<ns5:specialRequirements>
							<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:specialRequirements"/>
						</ns5:specialRequirements>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:SpecialInstructions!=''">
						<ns5:SpecialInstructions>
							<xsl:copy-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:SpecialInstructions/*"/>
						</ns5:SpecialInstructions>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:preferredContactMethod!=''">
						<ns5:preferredContactMethod>
							<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:preferredContactMethod"/>
						</ns5:preferredContactMethod>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:alternativePhone!=''">
						<ns5:alternativePhone>
							<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:alternativePhone"/>
						</ns5:alternativePhone>
					</xsl:if>
					<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:referenceNumber!=''">
						<ns5:referenceNumber>
							<xsl:value-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns5:CRMContactDetails/ns5:referenceNumber"/>
						</ns5:referenceNumber>
					</xsl:if>
				</ns5:CRMContactDetails>
			</xsl:if>
			<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns3:CRMAddress!=''">
				<ns3:CRMAddress>
					<xsl:copy-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns3:CRMAddress/*"/>
				</ns3:CRMAddress>
			</xsl:if>
			<xsl:if test="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns4:CRMMarketingPreference!=''">
				<xsl:copy-of select="$cnRequest/soap:Envelope/soap:Body/ns0:UpdateSubscriptionDetailsRequest/ns4:CRMMarketingPreference"/>
			</xsl:if>
		</ns0:UpdateSubscriptionDetailsRequest>
	</xsl:template>
</xsl:stylesheet>