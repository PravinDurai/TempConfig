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
xmlns:ns1="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/CustomerParty/V2"
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/GetCustomerPartyList"
xmlns:ns2="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2"
xmlns:ns22="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/Common/V2"
xmlns:ns3="http://xmlns.oracle.com/EnterpriseObjects/Core/Custom/EBO/CustomerParty/V2"

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

	<xsl:template match="ns1:CustomerPartyBillingProfile/ns1:Custom/ns3:LegalGroup"/>

	<xsl:template match="ns1:CustomerPartySupportTeam/ns1:CustomerPartySupportTeamMember/ns1:CustomerPartyWorker/ns2:WorkerReference/ns2:PersonName"/>
	<xsl:template match="ns1:CustomerPartySupportTeam/ns1:CustomerPartySupportTeamMember/ns1:CustomerPartyWorker/ns2:WorkerReference/ns2:PersonName/CreationDateTime"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:AccountSegment"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:AccountSubSegment"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:DaysSinceLastSuspension"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:SuspensionsNumberInLast90Days"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:SuspensionsNumberInLast180Days"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:ApplicationDetails"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:ApplicationDetails/ns22:Identification/ns2:ApplicationObjectKey/ns2:ID"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails/ns22:Outcome"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails/ns22:OutcomeReasonCode"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails/ns22:CreditClass"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails/ns22:RecurringChargeLimit"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:DecisionDetails/ns22:ExpiryDateOfLastVet"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:CreditLimit"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:ShadowLimit"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:MaxNoOfPostpaidConnectionsAllowed"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:DepositAmount"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:DepositTimePeriod"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:AdditionalTermsOfBusiness1"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:AdditionalTermsOfBusiness2"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:CallBars"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:CallBars/ns22:CallBarProductID"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:TermsOfBusiness/ns22:CallBars/ns22:CallBarFlag"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:Notes"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:CreditVetResult/ns22:Notes/ns22:AgentNotes"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:RegistrationCode"/>
	<xsl:template match="ns1:CustomerPartyAccount/ns1:Custom/ns3:DisableSubscriptionPurchases"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:PreferredCommunicationChannelCode/ns2:ContactEmailCommunication/ns2:EmailCommunication/ns2:URI"/>
	<xsl:template match="ns22:Person/ns2:Custom/ns22:Identity/ns22:EmailAddress"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:PreferredCommunicationChannelCode"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Preference/ns2:PreferredIndicator"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication/ns2:PhoneCommunication/ns2:Preference/ns2:PreferredIndicator"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactAddressCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactAddressCommunication/ns2:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication/ns2:PhoneCommunication/ns2:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication/ns2:PhoneCommunication/ns2:UseCode"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication/ns2:PhoneCommunication/ns2:UseCode/ns2:CompleteNumber"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication/ns2:PhoneCommunication/ns2:UseCode/ns2:ExtensionNumber"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactEmailCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactEmailCommunication/ns2:EmailCommunication/ns2:URI/ns2:UseCode"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactEmailCommunication/ns2:EmailCommunication/ns2:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactFaxCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactFaxCommunication/ns2:FaxCommunication/ns2:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactFaxCommunication/ns2:FaxCommunication/ns2:UseCode/ns2:CompleteNumber"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:ContactFaxCommunication/ns2:FaxCommunication/ns2:Preference/ns2:PreferredIndicator"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactMMSCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactMMSCommunication/ns22:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSMSCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSMSCommunication/ns22:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSurveyCommunication"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSurveyCommunication/ns22:Status/ns2:Code"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:Name"/>
	<xsl:template match="ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:Value"/>
	<xsl:template match="ns2:PartyContact/ns2:Custom/ns22:Person/ns2:DeceasedIndicator"/>
	<xsl:template match="ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity"/>
	<xsl:template match="ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Username"/>
	<xsl:template match="ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Type"/>
	<xsl:template match="ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN"/>
	<xsl:template match="ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN/Status"/>
	<xsl:template match="ns3:CustomerPartyBillingProfile/ns3:PreferredIndicator"/>
	<xsl:template match="ns2:BillingInquiryEmailCommunication/ns2:URI"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Status"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Status/ns2:Code"/> 
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Note"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Note/ns2:Content"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns1:PaymentMethodCode"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Status/ns2:ReasonCode"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:CreditCard"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:Number"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:ExpirationMonth"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:ExpirationYear"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress/ns2:PostalCode"/>
	<xsl:template match="ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress/ns2:LineThree"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:Custom/ns3:MandateID"/>
	<xsl:template match="ns1:CustomerPartyBankAccount"/>
	<xsl:template match="ns3:CreditVetResult"/>
	<xsl:template match="ns2:BillingInquiryEmailCommunication"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:Name"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:AccountNumber"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:TypeCode"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankBranchReference"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankBranchReference/ns2:Description"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:Contact/ns2:PreferredLanguageCode"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:OrganizationName"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:RoutingNumber"/>
	<xsl:template match="ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:Description"/>

</xsl:stylesheet>