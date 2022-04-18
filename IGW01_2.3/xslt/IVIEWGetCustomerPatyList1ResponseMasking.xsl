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
	<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Identification"/>       
	<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyLocation"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PrimaryClassificationCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:NameInitial"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:GenderCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:MaritalStatusCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:BirthDateTime"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:DeathDateTime"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:DeathPlace"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:DeathCertificateID"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:VeteranBenefitEligibilityIndicator"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Age"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:LanguageCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:NationalityCountryCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:TaxPayerRegistrationNumber"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:TaxPayerIdentificationNumber"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PrimaryLocationTimezoneCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:BirthPlace"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:EthnicityCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:MaritalStatusEffectiveDate"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonalIncomeAmount"/>
  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:RentOrOwnCode"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:BankruptcyIndicator"/>
    <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:ProblematicAccountIndicator"/>
	 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:TaxLienIndicator"/>
	  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:EmployedIndicator"/>
	   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:TotalDependentCount"/>
	    <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:MinorIndicator"/>
		 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonName"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonNameUsage"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Citizenship"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:EducationRecord"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:EmploymentRecord"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonInterest"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:MotherMaidenName"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonCertification"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:LanguageProficiency"/>
		  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonFinancialProfile"/>
		    <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonDriversLicense"/>
			  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonAffiliation"/>
			    <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonNationalIdentity"/>
				  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonProfessionalLicense"/>


<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:AgeProof"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Action"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:EmailAddress"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewPassword"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewPIN"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewUsername"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Password"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:SecretsList"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:MemorablePair"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Type"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Status"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:EmploymentStatus"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:ResidentialStatus"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Status"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Person"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Organization"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyRelatedParty"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:LevelCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:TaxCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:ClassificationCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:PotentialRevenueAmount"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:SpeciallyDesignatedNationalIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:ResidentIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Note"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Status/ns2:EffectiveDateTime"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Status/ns2:EffectiveEndDateTime"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Status/ns2:ReasonCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Status/ns2:Description"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Status/ns2:SubStatusCode"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:BusinessComponentID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:ID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:ContextID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:ApplicationObjectKey/ns2:ContextID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:AlternateObjectKey"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Identification/ns2:Revision"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:BillingProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:ShippingProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:PaymentProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:CreditProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Note"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:ParentCustomerPartyAccountIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CustomerPartyAccountContact"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:RelatedCustomerPartyAccount"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CustomerPartyAccountUsage"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CustomerPartyAccountAttachment"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:AccountBalanceSummary"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CustomerPartyOverdueCollectionRule"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CreationDateTime"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CurrencyCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CoterminateDateTime"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:Status"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns2:SellingProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:CustomerPartyAccountSite"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAccount/ns1:Custom"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:BusinessComponentID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:ID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:ContextID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:ApplicationObjectKey/ns2:ContextID"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:AlternateObjectKey"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Identification/ns2:Revision"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:Name"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:PreferredIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:FrequencyCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:BillTypeCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:MediaTypeCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Status"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Contact"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DayOfMonth"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DayOfMonthCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:CurrencyCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:LanguageCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:LanguageCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:MediaFormatCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:NumberOfCopies"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:InvoiceConsolidationIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:InvoiceConsolidationTypeCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:HoldBillIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:PORequiredIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:ManualInvoiceCreationAllowedIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DeliveryNotePrintIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:PartialPaymentAllowedIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:AutomaticPaymentEnabledIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:ImmediatePaymentRequiredIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DisplayPriceIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DueDaysGraceAllowedIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:DiscountDaysGraceAllowedIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:FreightBillTypeCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:RefundMethodCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:TaxHeaderLevelIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:TaxRoundingRuleCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:TaxPrintingOptionCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:RoundingMethodCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:EffectiveTimePeriod"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:Note"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:PaymentProfileIdentification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:BillingInquiryPhoneCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:BillingInquiryEmailCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:PayFromPartyReference"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:CustomerPurchaseOrderReference"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns2:PriorPayFromPartyReference"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:BalanceGroup"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:BalanceSummary"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:Custom/ns3:BalanceDate"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns1:Custom/ns3:LegalGroup"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyShippingProfile"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyCreditProfile"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartySellingProfile"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartySupportTeam"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyShippingExceptionConfiguration"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Identification"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Identification/ns2:ID"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Identification/ns2:ContextID"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Identification/ns2:AlternateObjectKey"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Identification/ns2:Revision"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:PreferredLanguageCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Department"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:JobTitle"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Responsibility"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:OrganizationIndicator"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:PreferredCommunicationChannelCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactTelexCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:PreferredMediaFormatCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:PersonName"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:BirthDateTime"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Preference"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:OrganizationName"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Identification/ns2:BusinessComponentID"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Preference/ns2:PreferredIndicator"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactAddressCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactPhoneCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactEmailCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactWebsiteCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:ContactFaxCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactMMSCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSMSCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactSurveyCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:ValueType"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:Description"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:StartDate"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactCharacteristic/ns22:EndDate"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:ContactAccountStatus"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:Group"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Contact/ns2:Custom/ns22:CriticallyIll"/> 
 
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:DeceasedIndicator"/> 


  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:GenderCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:MaritalStatusCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:BirthDateTime"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:PersonName"/>



<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:AgeProof"/>
  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Action"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:EmailAddress"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewPassword"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewPIN"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:NewUsername"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Password"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:SecretsList"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:MemorablePair"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Type"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Status"/>
  <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:EmploymentStatus"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:ResidentalStatus"/>
   <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:PartyContact/ns2:Custom/ns22:Status"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBillingProfile/ns22:Person/ns2:Custom/ns22:Identity/ns22:EmailAddress"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:BusinessComponentID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:ID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:ContextID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:ApplicationObjectKey/ns2:ContextID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:AlternateObjectKey"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PartyIdentification/ns2:Revision"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PersonName"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:OrganizationName"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:LocationReference"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:Contact"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountIdentification"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountName"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountContactIdentification"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountContactPersonName"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountContactAddressCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:BillingProfileReference"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:PriorAccountID"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountTypeCode"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountContactPhoneCommunication"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:ParentCustomerPartyReference/ns2:CustomerPartyAccountContactEmailCommunication"/> 
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:Type"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:Custom/ns22:Person/ns2:Custom/ns22:Identity/ns22:PIN/Status"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:BillingInquiryEmailCommunication/ns2:URI"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:BillingInquiryEmailCommunication"/>


<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile"/>
 <xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Status"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Status/ns2:Code"/> 
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Note"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Note/ns2:Content"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns1:PaymentMethodCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Status/ns2:ReasonCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:CreditCard"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:Number"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:ExpirationMonth"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:ExpirationYear"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress/ns2:PostalCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns2:CardHolderBillingAddress/ns2:LineThree"/>

<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:Custom/ns3:MandateID"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns3:CreditVetResult"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns2:BillingInquiryEmailCommunication"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:Name"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:AccountNumber"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:TypeCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankBranchReference"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankBranchReference/ns2:Description"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:Contact/ns2:PreferredLanguageCode"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:OrganizationName"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:BankPartyReference/ns2:RoutingNumber"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBankAccount/ns2:BankAccount/ns2:Description"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyTaxExemption"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyAttachment"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPrivacyProfile"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:RelatedCustomerParty"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:SpecialNeedProfile"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartySpecification"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyFinancialAccount"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyBestVisitationTime"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:Custom"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns3:RecurringTopupFlag"/>
<xsl:template match="ns0:more"/>
<xsl:template match="ns0:QueryCustomerPartyListResponse/ns1:QueryCustomerPartyListResponse/ns1:CustomerPartyPaymentProfile/ns1:Custom/ns3:PaymentProvider"/>
</xsl:stylesheet>