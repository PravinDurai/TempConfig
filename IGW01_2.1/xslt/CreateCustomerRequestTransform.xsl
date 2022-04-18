<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
		xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:pfx7="http://www.vodafone.com/vf/customerInterfaceManagement/interface/v.1.1"
		xmlns:ns11="http://www.vodafone.com/vf/customerInterfaceManagement/messages/v.1.1"
		xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/"
		xmlns:ns3="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMContactDetails"
		xmlns:ns4="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMPerson"
		xmlns:ns5="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMAddress"
		xmlns:ns6="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMAccount"
		xmlns:ns7="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/PaymentInfo"
		xmlns:ns8="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMBillParams"
		xmlns:ns9="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMMarketingPreference"
		xmlns:ns10="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/CRMCredit"
		xmlns:pfx6="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/CreateCustomer">
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
	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body" >
				<pfx6:CreateCustomerRequest>
					<pfx6:createMode>
						<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:createMode"/>
					</pfx6:createMode>
					<ns3:CRMContactDetails>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:ID">
							<ns3:ID>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:ID"/>
							</ns3:ID>
						</xsl:if>
						<ns4:CRMPerson>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:title">
								<ns4:title>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:title"/>
								</ns4:title>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:firstName">
								<ns4:firstName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:firstName"/>
								</ns4:firstName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:middleName">
								<ns4:middleName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:middleName"/>
								</ns4:middleName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:lastName">
								<ns4:lastName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:lastName"/>
								</ns4:lastName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fullName">
								<ns4:fullName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fullName"/>
								</ns4:fullName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:dob">
								<ns4:dob>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:dob"/>
								</ns4:dob>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telContact">
								<ns4:telContact>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telContact"/>
								</ns4:telContact>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telWork">
								<ns4:telWork>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telWork"/>
								</ns4:telWork>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fax">
								<ns4:fax>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fax"/>
								</ns4:fax>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:email">
								<ns4:email>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:email"/>
								</ns4:email>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:birthTown">
								<ns4:birthTown>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:birthTown"/>
								</ns4:birthTown>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:occupation">
								<ns4:occupation>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:occupation"/>
								</ns4:occupation>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:employmentStatus">
								<ns4:employmentStatus>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:employmentStatus"/>
								</ns4:employmentStatus>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:jobTitle">
								<ns4:jobTitle>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:jobTitle"/>
								</ns4:jobTitle>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathInd">
								<ns4:deathInd>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathInd"/>
								</ns4:deathInd>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathDate">
								<ns4:deathDate>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathDate"/>
								</ns4:deathDate>
							</xsl:if>
						</ns4:CRMPerson>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:specialRequirements">
							<ns3:specialRequirements>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:specialRequirements"/>
							</ns3:specialRequirements>
						</xsl:if>
						<ns3:SpecialInstructions>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:instructions">
								<ns3:instructions>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:instructions"/>
								</ns3:instructions>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:code">
								<ns3:code>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:code"/>
								</ns3:code>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:dateTime">
								<ns3:dateTime>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:dateTime"/>
								</ns3:dateTime>
							</xsl:if>
						</ns3:SpecialInstructions>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:preferredContactMethod">
							<ns3:preferredContactMethod>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:preferredContactMethod"/>
							</ns3:preferredContactMethod>
						</xsl:if>
						<ns3:Access>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin">
								<ns3:pin>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin"/>
								</ns3:pin>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password">
								<ns3:password>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password"/>
								</ns3:password>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion">
								<ns3:secretQuestion>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion"/>
								</ns3:secretQuestion>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer">
								<ns3:secretAnswer>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer"/>
								</ns3:secretAnswer>
							</xsl:if>
						</ns3:Access>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:alternativePhone">
							<ns3:alternativePhone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:alternativePhone"/>
							</ns3:alternativePhone>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:referenceNumber">
							<ns3:referenceNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:referenceNumber"/>
							</ns3:referenceNumber>
						</xsl:if>
					</ns3:CRMContactDetails>
					<ns5:CRMAddress>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns5:CRMAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</ns5:CRMAddress>
					<ns6:CRMAccount>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:ID">
							<ns6:ID>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:ID"/>
							</ns6:ID>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:name">
							<ns6:name>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:name"/>
							</ns6:name>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:status">
							<ns6:status>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:status"/>
							</ns6:status>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:type">
							<ns6:type>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:type"/>
							</ns6:type>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:registrationNumber">
							<ns6:registrationNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:registrationNumber"/>
							</ns6:registrationNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:suppressLetters">
							<ns6:suppressLetters>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:suppressLetters"/>
							</ns6:suppressLetters>
						</xsl:if>
						<ns6:Team>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:ID">
								<ns6:ID>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:ID"/>
								</ns6:ID>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:name">
								<ns6:name>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:name"/>
								</ns6:name>
							</xsl:if>
						</ns6:Team>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:specialInstructions">
							<ns6:specialInstructions>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:specialInstructions"/>
							</ns6:specialInstructions>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:industry">
							<ns6:industry>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:industry"/>
							</ns6:industry>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:fax">
							<ns6:fax>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:fax"/>
							</ns6:fax>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:email">
							<ns6:email>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:email"/>
							</ns6:email>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:securityClass">
							<ns6:securityClass>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:securityClass"/>
							</ns6:securityClass>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:relationshipType">
							<ns6:relationshipType>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:relationshipType"/>
							</ns6:relationshipType>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:phone">
							<ns6:phone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:phone"/>
							</ns6:phone>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:market">
							<ns6:market>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:market"/>
							</ns6:market>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:segment">
							<ns6:segment>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:segment"/>
							</ns6:segment>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:dealerCode">
							<ns6:dealerCode>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:dealerCode"/>
							</ns6:dealerCode>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:orgLevel">
							<ns6:orgLevel>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:orgLevel"/>
							</ns6:orgLevel>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:creditCheck">
							<ns6:creditCheck>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:creditCheck"/>
							</ns6:creditCheck>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:approvedSubs">
							<ns6:approvedSubs>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns6:CRMAccount/ns6:approvedSubs"/>
							</ns6:approvedSubs>
						</xsl:if>
					</ns6:CRMAccount>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:barName">
						<pfx6:barName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:barName"/>
						</pfx6:barName>
					</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:financialAccountName">
						<pfx6:financialAccountName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:financialAccountName"/>
						</pfx6:financialAccountName>
					</xsl:if>
					<ns7:PaymentInfo>
						<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit">
							<ns7:DirectDebit>
							    <xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:bankCode">
								<ns7:bankCode>
									<xsl:value-of select="ns7:bankCode"/>
								</ns7:bankCode>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:bankAccountNumber">
								<ns7:bankAccountNumber>
									<xsl:value-of select="ns7:bankAccountNumber"/>
								</ns7:bankAccountNumber>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:accountOwner">
								<ns7:accountOwner>
									<xsl:value-of select="ns7:accountOwner"/>
								</ns7:accountOwner>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateStatus">
								<ns7:mandateStatus>
									<xsl:value-of select="ns7:mandateStatus"/>
								</ns7:mandateStatus>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateStatusDate">
								<ns7:mandateStatusDate>
									<xsl:value-of select="ns7:mandateStatusDate"/>
								</ns7:mandateStatusDate>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateNumber">
								<ns7:mandateNumber>
									<xsl:value-of select="ns7:mandateNumber"/>
								</ns7:mandateNumber>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:amount">
								<ns7:amount>
									<xsl:value-of select="ns7:amount"/>
								</ns7:amount>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:lastUpdateDate">
								<ns7:day>
									<xsl:value-of select="ns7:day"/>
								</ns7:day>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:lastUpdateDate">
								<ns7:lastUpdateDate>
									<xsl:value-of select="ns7:lastUpdateDate"/>
								</ns7:lastUpdateDate>
								</xsl:if>
							</ns7:DirectDebit>
						</xsl:for-each>
					</ns7:PaymentInfo>
					<ns8:CRMBillParams>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billProduction">
							<ns8:billProduction>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billProduction"/>
							</ns8:billProduction>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printCategory">
							<ns8:printCategory>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printCategory"/>
							</ns8:printCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printSubCategory">
							<ns8:printSubCategory>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printSubCategory"/>
							</ns8:printSubCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:webIndicator">
							<ns8:webIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:webIndicator"/>
							</ns8:webIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:sendMailIndicator">
							<ns8:sendMailIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:sendMailIndicator"/>
							</ns8:sendMailIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billFormat">
							<ns8:billFormat>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billFormat"/>
							</ns8:billFormat>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:twoColumnIndicator">
							<ns8:twoColumnIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:twoColumnIndicator"/>
							</ns8:twoColumnIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:virtuallyImpairedCategory">
							<ns8:virtuallyImpairedCategory>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:virtuallyImpairedCategory"/>
							</ns8:virtuallyImpairedCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:detailBreakdownIndicator">
							<ns8:detailBreakdownIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:detailBreakdownIndicator"/>
							</ns8:detailBreakdownIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:statementIndicator">
							<ns8:statementIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:statementIndicator"/>
							</ns8:statementIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:groupingSmsIndicator">
							<ns8:groupingSmsIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:groupingSmsIndicator"/>
							</ns8:groupingSmsIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:excludePaymentMethodIndicator">
							<ns8:excludePaymentMethodIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:excludePaymentMethodIndicator"/>
							</ns8:excludePaymentMethodIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:productBreakdownIndicator">
							<ns8:productBreakdownIndicator>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:productBreakdownIndicator"/>
							</ns8:productBreakdownIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:taxCountry">
							<ns8:taxCountry>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:taxCountry"/>
							</ns8:taxCountry>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:paymentTerms">
							<ns8:paymentTerms>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:paymentTerms"/>
							</ns8:paymentTerms>
						</xsl:if>
					</ns8:CRMBillParams>
					<pfx6:BillingContact>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:ID">
							<ns3:ID>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:ID"/>
							</ns3:ID>
						</xsl:if>
						<ns4:CRMPerson>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:title">
								<ns4:title>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:title"/>
								</ns4:title>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:firstName">
								<ns4:firstName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:firstName"/>
								</ns4:firstName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:middleName">
								<ns4:middleName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:middleName"/>
								</ns4:middleName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:lastName">
								<ns4:lastName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:lastName"/>
								</ns4:lastName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fullName">
								<ns4:fullName>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fullName"/>
								</ns4:fullName>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:dob">
								<ns4:dob>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:dob"/>
								</ns4:dob>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telContact">
								<ns4:telContact>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telContact"/>
								</ns4:telContact>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telWork">
								<ns4:telWork>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telWork"/>
								</ns4:telWork>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fax">
								<ns4:fax>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fax"/>
								</ns4:fax>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:email">
								<ns4:email>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:email"/>
								</ns4:email>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:birthTown">
								<ns4:birthTown>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:birthTown"/>
								</ns4:birthTown>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:occupation">
								<ns4:occupation>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:occupation"/>
								</ns4:occupation>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:employmentStatus">
								<ns4:employmentStatus>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:employmentStatus"/>
								</ns4:employmentStatus>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:jobTitle">
								<ns4:jobTitle>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:jobTitle"/>
								</ns4:jobTitle>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathInd">
								<ns4:deathInd>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathInd"/>
								</ns4:deathInd>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathDate">
								<ns4:deathDate>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathDate"/>
								</ns4:deathDate>
							</xsl:if>
						</ns4:CRMPerson>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:specialRequirements">
							<ns3:specialRequirements>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:specialRequirements"/>
							</ns3:specialRequirements>
						</xsl:if>
						<ns3:SpecialInstructions>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:instructions">
								<ns3:instructions>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:instructions"/>
								</ns3:instructions>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:code">
								<ns3:code>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:code"/>
								</ns3:code>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:dateTime">
								<ns3:dateTime>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:dateTime"/>
								</ns3:dateTime>
							</xsl:if>
						</ns3:SpecialInstructions>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:preferredContactMethod">
							<ns3:preferredContactMethod>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:preferredContactMethod"/>
							</ns3:preferredContactMethod>
						</xsl:if>
						<ns3:Access>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin">
								<ns3:pin>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin"/>
								</ns3:pin>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password">
								<ns3:password>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password"/>
								</ns3:password>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion">
								<ns3:secretQuestion>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion"/>
								</ns3:secretQuestion>
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer">
								<ns3:secretAnswer>
									<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer"/>
								</ns3:secretAnswer>
							</xsl:if>
						</ns3:Access>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:alternativePhone">
							<ns3:alternativePhone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:alternativePhone"/>
							</ns3:alternativePhone>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:referenceNumber">
							<ns3:referenceNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingContact/ns3:referenceNumber"/>
							</ns3:referenceNumber>
						</xsl:if>
					</pfx6:BillingContact>
					<pfx6:BillingAddress>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:BillingAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</pfx6:BillingAddress>
					<pfx6:EAddress>
						<pfx6:type>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:EAddress/ns11:type"/>
						</pfx6:type>
						<pfx6:value>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:EAddress/ns11:value"/>
						</pfx6:value>
					</pfx6:EAddress>
					<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns9:CRMMarketingPreference"/>
					<pfx6:PreviousAddress>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</pfx6:PreviousAddress>
					<pfx6:CreditResultInformation>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditClass">
							<ns10:creditClass>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditClass"/>
							</ns10:creditClass>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:reference">
							<ns10:reference>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:reference"/>
							</ns10:reference>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditVettingInd">
							<ns10:creditVettingInd>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditVettingInd"/>
							</ns10:creditVettingInd>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionAdditionalInformation">
							<ns10:decisionAdditionalInformation>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionAdditionalInformation"/>
							</ns10:decisionAdditionalInformation>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionDate">
							<ns10:decisionDate>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionDate"/>
							</ns10:decisionDate>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:vettingExpiryDate">
							<ns10:vettingExpiryDate>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:vettingExpiryDate"/>
							</ns10:vettingExpiryDate>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noRequestedSubscriptions">
							<ns10:noRequestedSubscriptions>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noRequestedSubscriptions"/>
							</ns10:noRequestedSubscriptions>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:subscriptionCreditStatus">
							<ns10:subscriptionCreditStatus>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:subscriptionCreditStatus"/>
							</ns10:subscriptionCreditStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedSubs">
							<ns10:totalNoApprovedSubs>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedSubs"/>
							</ns10:totalNoApprovedSubs>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithoutDeposit">
							<ns10:noSubsWithoutDeposit>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithoutDeposit"/>
							</ns10:noSubsWithoutDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithDeposit">
							<ns10:noSubsWithDeposit>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithDeposit"/>
							</ns10:noSubsWithDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:isICBRequested">
							<ns10:isICBRequested>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:isICBRequested"/>
							</ns10:isICBRequested>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:ICBCreditStatus">
							<ns10:ICBCreditStatus>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:ICBCreditStatus"/>
							</ns10:ICBCreditStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedICB">
							<ns10:totalNoApprovedICB>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedICB"/>
							</ns10:totalNoApprovedICB>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithoutDeposit">
							<ns10:noICBWithoutDeposit>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithoutDeposit"/>
							</ns10:noICBWithoutDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithDeposit">
							<ns10:noICBWithDeposit>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithDeposit"/>
							</ns10:noICBWithDeposit>
						</xsl:if>
					</pfx6:CreditResultInformation>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:dAndBNumber">
						<pfx6:dAndBNumber>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:dAndBNumber"/>
						</pfx6:dAndBNumber>
					</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:corporateID">
						<pfx6:corporateID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:corporateID"/>
						</pfx6:corporateID>
					</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:subsidiaryID">
						<pfx6:subsidiaryID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/pfx7:CreateCustomer/ns11:subsidiaryID"/>
						</pfx6:subsidiaryID>
					</xsl:if>
				</pfx6:CreateCustomerRequest>
			</xsl:when>

			<xsl:otherwise>	
				<pfx6:CreateCustomerRequest>
					<pfx6:createMode>
						<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:createMode"/>
					</pfx6:createMode>
					<ns3:CRMContactDetails>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:ID">
							<ns3:ID>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:ID"/>
							</ns3:ID>
						</xsl:if>
						<ns4:CRMPerson>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:title">
								<ns4:title>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:title"/>
								</ns4:title>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:firstName">
								<ns4:firstName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:firstName"/>
								</ns4:firstName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:middleName">
								<ns4:middleName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:middleName"/>
								</ns4:middleName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:lastName">
								<ns4:lastName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:lastName"/>
								</ns4:lastName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fullName">
								<ns4:fullName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fullName"/>
								</ns4:fullName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:dob">
								<ns4:dob>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:dob"/>
								</ns4:dob>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telContact">
								<ns4:telContact>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telContact"/>
								</ns4:telContact>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telWork">
								<ns4:telWork>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:telWork"/>
								</ns4:telWork>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fax">
								<ns4:fax>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:fax"/>
								</ns4:fax>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:email">
								<ns4:email>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:email"/>
								</ns4:email>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:birthTown">
								<ns4:birthTown>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:birthTown"/>
								</ns4:birthTown>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:occupation">
								<ns4:occupation>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:occupation"/>
								</ns4:occupation>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:employmentStatus">
								<ns4:employmentStatus>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:employmentStatus"/>
								</ns4:employmentStatus>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:jobTitle">
								<ns4:jobTitle>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:jobTitle"/>
								</ns4:jobTitle>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathInd">
								<ns4:deathInd>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathInd"/>
								</ns4:deathInd>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathDate">
								<ns4:deathDate>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns4:CRMPerson/ns4:deathDate"/>
								</ns4:deathDate>
							</xsl:if>
						</ns4:CRMPerson>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:specialRequirements">
							<ns3:specialRequirements>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:specialRequirements"/>
							</ns3:specialRequirements>
						</xsl:if>
						<ns3:SpecialInstructions>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:instructions">
								<ns3:instructions>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:instructions"/>
								</ns3:instructions>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:code">
								<ns3:code>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:code"/>
								</ns3:code>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:dateTime">
								<ns3:dateTime>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:SpecialInstructions/ns3:dateTime"/>
								</ns3:dateTime>
							</xsl:if>
						</ns3:SpecialInstructions>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:preferredContactMethod">
							<ns3:preferredContactMethod>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:preferredContactMethod"/>
							</ns3:preferredContactMethod>
						</xsl:if>
						<ns3:Access>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin">
								<ns3:pin>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin"/>
								</ns3:pin>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password">
								<ns3:password>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password"/>
								</ns3:password>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion">
								<ns3:secretQuestion>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion"/>
								</ns3:secretQuestion>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer">
								<ns3:secretAnswer>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer"/>
								</ns3:secretAnswer>
							</xsl:if>
						</ns3:Access>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:alternativePhone">
							<ns3:alternativePhone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:alternativePhone"/>
							</ns3:alternativePhone>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:referenceNumber">
							<ns3:referenceNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:referenceNumber"/>
							</ns3:referenceNumber>
						</xsl:if>
					</ns3:CRMContactDetails>
					<ns5:CRMAddress>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns5:CRMAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</ns5:CRMAddress>
					<ns6:CRMAccount>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:ID">
							<ns6:ID>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:ID"/>
							</ns6:ID>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:name">
							<ns6:name>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:name"/>
							</ns6:name>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:status">
							<ns6:status>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:status"/>
							</ns6:status>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:type">
							<ns6:type>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:type"/>
							</ns6:type>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:registrationNumber">
							<ns6:registrationNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:registrationNumber"/>
							</ns6:registrationNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:suppressLetters">
							<ns6:suppressLetters>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:suppressLetters"/>
							</ns6:suppressLetters>
						</xsl:if>
						<ns6:Team>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:ID">
								<ns6:ID>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:ID"/>
								</ns6:ID>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:name">
								<ns6:name>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:Team/ns6:name"/>
								</ns6:name>
							</xsl:if>
						</ns6:Team>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:specialInstructions">
							<ns6:specialInstructions>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:specialInstructions"/>
							</ns6:specialInstructions>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:industry">
							<ns6:industry>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:industry"/>
							</ns6:industry>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:fax">
							<ns6:fax>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:fax"/>
							</ns6:fax>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:email">
							<ns6:email>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:email"/>
							</ns6:email>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:securityClass">
							<ns6:securityClass>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:securityClass"/>
							</ns6:securityClass>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:relationshipType">
							<ns6:relationshipType>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:relationshipType"/>
							</ns6:relationshipType>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:phone">
							<ns6:phone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:phone"/>
							</ns6:phone>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:market">
							<ns6:market>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:market"/>
							</ns6:market>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:segment">
							<ns6:segment>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:segment"/>
							</ns6:segment>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:dealerCode">
							<ns6:dealerCode>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:dealerCode"/>
							</ns6:dealerCode>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:orgLevel">
							<ns6:orgLevel>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:orgLevel"/>
							</ns6:orgLevel>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:creditCheck">
							<ns6:creditCheck>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:creditCheck"/>
							</ns6:creditCheck>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:approvedSubs">
							<ns6:approvedSubs>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns6:CRMAccount/ns6:approvedSubs"/>
							</ns6:approvedSubs>
						</xsl:if>
					</ns6:CRMAccount>
					<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:barName">
						<pfx6:barName>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:barName"/>
						</pfx6:barName>
					</xsl:if>
					<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:financialAccountName">
						<pfx6:financialAccountName>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:financialAccountName"/>
						</pfx6:financialAccountName>
					</xsl:if>
					<ns7:PaymentInfo>
						<xsl:for-each select="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit">
							<ns7:DirectDebit>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:bankCode">
								<ns7:bankCode>
									<xsl:value-of select="ns7:bankCode"/>
								</ns7:bankCode>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:bankAccountNumber">
								<ns7:bankAccountNumber>
									<xsl:value-of select="ns7:bankAccountNumber"/>
								</ns7:bankAccountNumber>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:accountOwner">
								<ns7:accountOwner>
									<xsl:value-of select="ns7:accountOwner"/>
								</ns7:accountOwner>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateStatus">
								<ns7:mandateStatus>
									<xsl:value-of select="ns7:mandateStatus"/>
								</ns7:mandateStatus>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateStatusDate">
								<ns7:mandateStatusDate>
									<xsl:value-of select="ns7:mandateStatusDate"/>
								</ns7:mandateStatusDate>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:mandateNumber">
								<ns7:mandateNumber>
									<xsl:value-of select="ns7:mandateNumber"/>
								</ns7:mandateNumber>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:amount">
								<ns7:amount>
									<xsl:value-of select="ns7:amount"/>
								</ns7:amount>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:day">
								<ns7:day>
									<xsl:value-of select="ns7:day"/>
								</ns7:day>
								</xsl:if>
								<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns7:PaymentInfo/ns7:DirectDebit/ns7:lastUpdateDate">
								<ns7:lastUpdateDate>
									<xsl:value-of select="ns7:lastUpdateDate"/>
								</ns7:lastUpdateDate>
								</xsl:if>
							</ns7:DirectDebit>
						</xsl:for-each>
					</ns7:PaymentInfo>
					<ns8:CRMBillParams>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billProduction">
							<ns8:billProduction>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billProduction"/>
							</ns8:billProduction>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printCategory">
							<ns8:printCategory>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printCategory"/>
							</ns8:printCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printSubCategory">
							<ns8:printSubCategory>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:printSubCategory"/>
							</ns8:printSubCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:webIndicator">
							<ns8:webIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:webIndicator"/>
							</ns8:webIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:sendMailIndicator">
							<ns8:sendMailIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:sendMailIndicator"/>
							</ns8:sendMailIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billFormat">
							<ns8:billFormat>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:billFormat"/>
							</ns8:billFormat>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:twoColumnIndicator">
							<ns8:twoColumnIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:twoColumnIndicator"/>
							</ns8:twoColumnIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:virtuallyImpairedCategory">
							<ns8:virtuallyImpairedCategory>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:virtuallyImpairedCategory"/>
							</ns8:virtuallyImpairedCategory>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:detailBreakdownIndicator">
							<ns8:detailBreakdownIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:detailBreakdownIndicator"/>
							</ns8:detailBreakdownIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:statementIndicator">
							<ns8:statementIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:statementIndicator"/>
							</ns8:statementIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:groupingSmsIndicator">
							<ns8:groupingSmsIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:groupingSmsIndicator"/>
							</ns8:groupingSmsIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:excludePaymentMethodIndicator">
							<ns8:excludePaymentMethodIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:excludePaymentMethodIndicator"/>
							</ns8:excludePaymentMethodIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:productBreakdownIndicator">
							<ns8:productBreakdownIndicator>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:productBreakdownIndicator"/>
							</ns8:productBreakdownIndicator>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:taxCountry">
							<ns8:taxCountry>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:taxCountry"/>
							</ns8:taxCountry>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:paymentTerms">
							<ns8:paymentTerms>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns8:CRMBillParams/ns8:paymentTerms"/>
							</ns8:paymentTerms>
						</xsl:if>
					</ns8:CRMBillParams>
					<pfx6:BillingContact>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:ID">
							<ns3:ID>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:ID"/>
							</ns3:ID>
						</xsl:if>
						<ns4:CRMPerson>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:title">
								<ns4:title>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:title"/>
								</ns4:title>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:firstName">
								<ns4:firstName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:firstName"/>
								</ns4:firstName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:middleName">
								<ns4:middleName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:middleName"/>
								</ns4:middleName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:lastName">
								<ns4:lastName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:lastName"/>
								</ns4:lastName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fullName">
								<ns4:fullName>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fullName"/>
								</ns4:fullName>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:dob">
								<ns4:dob>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:dob"/>
								</ns4:dob>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telContact">
								<ns4:telContact>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telContact"/>
								</ns4:telContact>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telWork">
								<ns4:telWork>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:telWork"/>
								</ns4:telWork>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fax">
								<ns4:fax>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:fax"/>
								</ns4:fax>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:email">
								<ns4:email>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:email"/>
								</ns4:email>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:birthTown">
								<ns4:birthTown>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:birthTown"/>
								</ns4:birthTown>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:occupation">
								<ns4:occupation>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:occupation"/>
								</ns4:occupation>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:employmentStatus">
								<ns4:employmentStatus>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:employmentStatus"/>
								</ns4:employmentStatus>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:jobTitle">
								<ns4:jobTitle>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:jobTitle"/>
								</ns4:jobTitle>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathInd">
								<ns4:deathInd>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathInd"/>
								</ns4:deathInd>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathDate">
								<ns4:deathDate>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns4:CRMPerson/ns4:deathDate"/>
								</ns4:deathDate>
							</xsl:if>
						</ns4:CRMPerson>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:specialRequirements">
							<ns3:specialRequirements>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:specialRequirements"/>
							</ns3:specialRequirements>
						</xsl:if>
						<ns3:SpecialInstructions>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:instructions">
								<ns3:instructions>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:instructions"/>
								</ns3:instructions>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:code">
								<ns3:code>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:code"/>
								</ns3:code>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:dateTime">
								<ns3:dateTime>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:SpecialInstructions/ns3:dateTime"/>
								</ns3:dateTime>
							</xsl:if>
						</ns3:SpecialInstructions>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:preferredContactMethod">
							<ns3:preferredContactMethod>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:preferredContactMethod"/>
							</ns3:preferredContactMethod>
						</xsl:if>
						<ns3:Access>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin">
								<ns3:pin>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:pin"/>
								</ns3:pin>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password">
								<ns3:password>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:password"/>
								</ns3:password>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion">
								<ns3:secretQuestion>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretQuestion"/>
								</ns3:secretQuestion>
							</xsl:if>
							<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer">
								<ns3:secretAnswer>
									<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns3:CRMContactDetails/ns3:Access/ns3:secretAnswer"/>
								</ns3:secretAnswer>
							</xsl:if>
						</ns3:Access>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:alternativePhone">
							<ns3:alternativePhone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:alternativePhone"/>
							</ns3:alternativePhone>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:referenceNumber">
							<ns3:referenceNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingContact/ns3:referenceNumber"/>
							</ns3:referenceNumber>
						</xsl:if>
					</pfx6:BillingContact>
					<pfx6:BillingAddress>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:BillingAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</pfx6:BillingAddress>
					<pfx6:EAddress>
						<pfx6:type>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:EAddress/ns11:type"/>
						</pfx6:type>
						<pfx6:value>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:EAddress/ns11:value"/>
						</pfx6:value>
					</pfx6:EAddress>
					<xsl:copy-of select="$cnRequest/pfx7:CreateCustomer/ns9:CRMMarketingPreference"/>
					<pfx6:PreviousAddress>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:flat">
							<ns5:flat>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:flat"/>
							</ns5:flat>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseNumber">
							<ns5:houseNumber>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseNumber"/>
							</ns5:houseNumber>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseName">
							<ns5:houseName>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:houseName"/>
							</ns5:houseName>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine1">
							<ns5:streetLine1>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine1"/>
							</ns5:streetLine1>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine2">
							<ns5:streetLine2>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:streetLine2"/>
							</ns5:streetLine2>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:city">
							<ns5:city>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:city"/>
							</ns5:city>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:county">
							<ns5:county>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:county"/>
							</ns5:county>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:country">
							<ns5:country>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:country"/>
							</ns5:country>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:postcode">
							<ns5:postcode>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:postcode"/>
							</ns5:postcode>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress">
						<ns5:TimeInAddress>
							<ns5:years>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress/ns5:years"/>
							</ns5:years>
							<ns5:months>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:TimeInAddress/ns5:months"/>
							</ns5:months>
						</ns5:TimeInAddress>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:residentStatus">
							<ns5:residentStatus>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:residentStatus"/>
							</ns5:residentStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:validated">
							<ns5:validated>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:validated"/>
							</ns5:validated>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:addition">
							<ns5:addition>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:addition"/>
							</ns5:addition>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:phone">
							<ns5:phone>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:PreviousAddress/ns5:phone"/>
							</ns5:phone>
						</xsl:if>
					</pfx6:PreviousAddress>
					<pfx6:CreditResultInformation>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditClass">
							<ns10:creditClass>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditClass"/>
							</ns10:creditClass>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:reference">
							<ns10:reference>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:reference"/>
							</ns10:reference>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditVettingInd">
							<ns10:creditVettingInd>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:creditVettingInd"/>
							</ns10:creditVettingInd>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionAdditionalInformation">
							<ns10:decisionAdditionalInformation>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionAdditionalInformation"/>
							</ns10:decisionAdditionalInformation>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionDate">
							<ns10:decisionDate>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:decisionDate"/>
							</ns10:decisionDate>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:vettingExpiryDate">
							<ns10:vettingExpiryDate>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:vettingExpiryDate"/>
							</ns10:vettingExpiryDate>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noRequestedSubscriptions">
							<ns10:noRequestedSubscriptions>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noRequestedSubscriptions"/>
							</ns10:noRequestedSubscriptions>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:subscriptionCreditStatus">
							<ns10:subscriptionCreditStatus>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:subscriptionCreditStatus"/>
							</ns10:subscriptionCreditStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedSubs">
							<ns10:totalNoApprovedSubs>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedSubs"/>
							</ns10:totalNoApprovedSubs>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithoutDeposit">
							<ns10:noSubsWithoutDeposit>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithoutDeposit"/>
							</ns10:noSubsWithoutDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithDeposit">
							<ns10:noSubsWithDeposit>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noSubsWithDeposit"/>
							</ns10:noSubsWithDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:isICBRequested">
							<ns10:isICBRequested>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:isICBRequested"/>
							</ns10:isICBRequested>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:ICBCreditStatus">
							<ns10:ICBCreditStatus>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:ICBCreditStatus"/>
							</ns10:ICBCreditStatus>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedICB">
							<ns10:totalNoApprovedICB>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:totalNoApprovedICB"/>
							</ns10:totalNoApprovedICB>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithoutDeposit">
							<ns10:noICBWithoutDeposit>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithoutDeposit"/>
							</ns10:noICBWithoutDeposit>
						</xsl:if>
						<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithDeposit">
							<ns10:noICBWithDeposit>
								<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:CreditResultInformation/ns10:noICBWithDeposit"/>
							</ns10:noICBWithDeposit>
						</xsl:if>
					</pfx6:CreditResultInformation>
					<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:dAndBNumber">
						<pfx6:dAndBNumber>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:dAndBNumber"/>
						</pfx6:dAndBNumber>
					</xsl:if>
					<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:corporateID">
						<pfx6:corporateID>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:corporateID"/>
						</pfx6:corporateID>
					</xsl:if>
					<xsl:if test="$cnRequest/pfx7:CreateCustomer/ns11:subsidiaryID">
						<pfx6:subsidiaryID>
							<xsl:value-of select="$cnRequest/pfx7:CreateCustomer/ns11:subsidiaryID"/>
						</pfx6:subsidiaryID>
					</xsl:if>
				</pfx6:CreateCustomerRequest>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
