<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
		xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
		xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:v="http://www.vodafone.com/vf/customerInterfaceManagement/interface/v.1.1"
		xmlns:v1="http://www.vodafone.com/vf/customerInterfaceManagement/messages/v.1.1"
		xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/">
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
			<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header" >
				<CreateCaseRequest xmlns = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/CreateCase">
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:accountID">
						<accountID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:accountID"/>
						</accountID>
					</xsl:if>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:msisdn">
						<msisdn>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:msisdn"/>
						</msisdn>
					</xsl:if>			
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:channel">
						<channel>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:channel"/>
						</channel>
					</xsl:if>

					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseTitle">
						<caseTitle>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseTitle"/>
						</caseTitle>
					</xsl:if>
					<caseType>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelOne">			
							<levelOne>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelOne"/>
							</levelOne>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelTwo">					
							<levelTwo>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelTwo"/>
							</levelTwo>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelThree">					
							<levelThree>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:caseType/v1:levelThree"/>
							</levelThree>
						</xsl:if>
					</caseType>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:priority">			
						<priority>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:priority"/>
						</priority>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactMethod">			
						<contactMethod>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactMethod"/>
						</contactMethod>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:severity">			
						<severity>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:severity"/>
						</severity>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:parentChildInd">			
						<parentChildInd>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:parentChildInd"/>
						</parentChildInd>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:parentCaseID">			
						<parentCaseID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:parentCaseID"/>
						</parentCaseID>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:correspondence">			
						<correspondence>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:correspondence"/>
						</correspondence>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:status">			
						<status>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:status"/>
						</status>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:firstName">			
						<firstName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:firstName"/>
						</firstName>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:lastName">			
						<lastName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:lastName"/>
						</lastName>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactId">			
						<contactId>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactId"/>
						</contactId>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactRole">			
						<contactRole>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:contactRole"/>
						</contactRole>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeTitle">			
						<alternativeTitle>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeTitle"/>
						</alternativeTitle>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeFirstName">			
						<alternativeFirstName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeFirstName"/>
						</alternativeFirstName>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeLastName">			
						<alternativeLastName>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeLastName"/>
						</alternativeLastName>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeCommunicationMethod">			
						<alternativeCommunicationMethod>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeCommunicationMethod"/>
						</alternativeCommunicationMethod>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeCommunicationAddress">			
						<alternativeCommunicationAddress>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeCommunicationAddress"/>
						</alternativeCommunicationAddress>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeNumber">			
						<alternativeNumber>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:alternativeNumber"/>
						</alternativeNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:userLogin">			
						<userLogin>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:userLogin"/>
						</userLogin>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:notes">			
						<notes>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:notes"/>
						</notes>
					</xsl:if>	
					<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:addNotes">
						<addNotes>
							<xsl:value-of select="."/>
						</addNotes>
					</xsl:for-each>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:interactionID">			
						<interactionID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:interactionID"/>
						</interactionID>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:billingItemType">			
						<billingItemType>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:billingItemType"/>
						</billingItemType>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:billingItemID">			
						<billingItemID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:billingItemID"/>
						</billingItemID>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:IMEISerialNumber">			
						<IMEISerialNumber>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:IMEISerialNumber"/>
						</IMEISerialNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemModelNumber">			
						<problemModelNumber>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemModelNumber"/>
						</problemModelNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemDateTime">			
						<problemDateTime>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemDateTime"/>
						</problemDateTime>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:subscriptionsAffected">			
						<subscriptionsAffected>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:subscriptionsAffected"/>
						</subscriptionsAffected>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemProduct">			
						<problemProduct>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:problemProduct"/>
						</problemProduct>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:autoDispatchInd">			
						<autoDispatchInd>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:autoDispatchInd"/>
						</autoDispatchInd>
					</xsl:if>	
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:queue">			
						<queue>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:queue"/>
						</queue>
					</xsl:if>	
					<AttachmentInfo>
						<attachmentTitle>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:attachmentTitle"/>
						</attachmentTitle>
						<isCorrespondenceInd>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:isCorrespondenceInd"/>
						</isCorrespondenceInd>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:documentNumber">			
							<documentNumber>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:documentNumber"/>
							</documentNumber>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:attachmentURL">			
							<attachmentURL>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:attachmentURL"/>
							</attachmentURL>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:direction">			
							<direction>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:direction"/>
							</direction>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:correspondenceType">			
							<correspondenceType>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:correspondenceType"/>
							</correspondenceType>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:fromFax">			
							<fromFax>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:fromFax"/>
							</fromFax>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:toFax">			
							<toFax>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:toFax"/>
							</toFax>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:batchID">			
							<batchID>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:batchID"/>
							</batchID>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:receivedDate">			
							<receivedDate>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:receivedDate"/>
							</receivedDate>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:scannedDate">			
							<scannedDate>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:scannedDate"/>
							</scannedDate>
						</xsl:if>	
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:attachmentDescription">			
							<attachmentDescription>
								<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:AttachmentInfo/v1:attachmentDescription"/>
							</attachmentDescription>
						</xsl:if>	
					</AttachmentInfo>
					<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:customerSegment">			
						<customerSegment>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/v:CreateCase/v1:customerSegment"/>
						</customerSegment>
					</xsl:if>	
				</CreateCaseRequest>
			</xsl:when>
			<xsl:otherwise>
				<CreateCaseRequest xmlns = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/CreateCase">
					<xsl:if test="$cnRequest/v:CreateCase/v1:accountID">
						<accountID>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:accountID"/>
						</accountID>
					</xsl:if>
					<xsl:if test="$cnRequest/v:CreateCase/v1:msisdn">
						<msisdn>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:msisdn"/>
						</msisdn>
					</xsl:if>			
					<xsl:if test="$cnRequest/v:CreateCase/v1:channel">
						<channel>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:channel"/>
						</channel>
					</xsl:if>

					<xsl:if test="$cnRequest/v:CreateCase/v1:caseTitle">
						<caseTitle>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:caseTitle"/>
						</caseTitle>
					</xsl:if>
					<caseType>
						<xsl:if test="$cnRequest/v:CreateCase/v1:caseType/v1:levelOne">			
							<levelOne>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:caseType/v1:levelOne"/>
							</levelOne>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:caseType/v1:levelTwo">					
							<levelTwo>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:caseType/v1:levelTwo"/>
							</levelTwo>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:caseType/v1:levelThree">					
							<levelThree>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:caseType/v1:levelThree"/>
							</levelThree>
						</xsl:if>
					</caseType>
					<xsl:if test="$cnRequest/v:CreateCase/v1:priority">			
						<priority>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:priority"/>
						</priority>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:contactMethod">			
						<contactMethod>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:contactMethod"/>
						</contactMethod>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:severity">			
						<severity>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:severity"/>
						</severity>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:parentChildInd">			
						<parentChildInd>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:parentChildInd"/>
						</parentChildInd>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:parentCaseID">			
						<parentCaseID>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:parentCaseID"/>
						</parentCaseID>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:correspondence">			
						<correspondence>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:correspondence"/>
						</correspondence>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:status">			
						<status>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:status"/>
						</status>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:firstName">			
						<firstName>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:firstName"/>
						</firstName>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:lastName">			
						<lastName>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:lastName"/>
						</lastName>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:contactId">			
						<contactId>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:contactId"/>
						</contactId>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:contactRole">			
						<contactRole>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:contactRole"/>
						</contactRole>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeTitle">			
						<alternativeTitle>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeTitle"/>
						</alternativeTitle>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeFirstName">			
						<alternativeFirstName>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeFirstName"/>
						</alternativeFirstName>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeLastName">			
						<alternativeLastName>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeLastName"/>
						</alternativeLastName>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeCommunicationMethod">			
						<alternativeCommunicationMethod>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeCommunicationMethod"/>
						</alternativeCommunicationMethod>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeCommunicationAddress">			
						<alternativeCommunicationAddress>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeCommunicationAddress"/>
						</alternativeCommunicationAddress>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:alternativeNumber">			
						<alternativeNumber>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:alternativeNumber"/>
						</alternativeNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:userLogin">			
						<userLogin>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:userLogin"/>
						</userLogin>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:notes">			
						<notes>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:notes"/>
						</notes>
					</xsl:if>	
					<xsl:for-each select="$cnRequest/v:CreateCase/v1:addNotes">
						<addNotes>
							<xsl:value-of select="."/>
						</addNotes>
					</xsl:for-each>
					<xsl:if test="$cnRequest/v:CreateCase/v1:interactionID">			
						<interactionID>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:interactionID"/>
						</interactionID>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:billingItemType">			
						<billingItemType>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:billingItemType"/>
						</billingItemType>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:billingItemID">			
						<billingItemID>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:billingItemID"/>
						</billingItemID>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:IMEISerialNumber">			
						<IMEISerialNumber>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:IMEISerialNumber"/>
						</IMEISerialNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:problemModelNumber">			
						<problemModelNumber>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:problemModelNumber"/>
						</problemModelNumber>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:problemDateTime">			
						<problemDateTime>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:problemDateTime"/>
						</problemDateTime>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:subscriptionsAffected">			
						<subscriptionsAffected>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:subscriptionsAffected"/>
						</subscriptionsAffected>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:problemProduct">			
						<problemProduct>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:problemProduct"/>
						</problemProduct>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:autoDispatchInd">			
						<autoDispatchInd>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:autoDispatchInd"/>
						</autoDispatchInd>
					</xsl:if>	
					<xsl:if test="$cnRequest/v:CreateCase/v1:queue">			
						<queue>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:queue"/>
						</queue>
					</xsl:if>	
					<AttachmentInfo>
						<attachmentTitle>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:attachmentTitle"/>
						</attachmentTitle>
						<isCorrespondenceInd>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:isCorrespondenceInd"/>
						</isCorrespondenceInd>
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:documentNumber">			
							<documentNumber>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:documentNumber"/>
							</documentNumber>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:attachmentURL">			
							<attachmentURL>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:attachmentURL"/>
							</attachmentURL>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:direction">			
							<direction>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:direction"/>
							</direction>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:correspondenceType">			
							<correspondenceType>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:correspondenceType"/>
							</correspondenceType>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:fromFax">			
							<fromFax>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:fromFax"/>
							</fromFax>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:toFax">			
							<toFax>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:toFax"/>
							</toFax>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:batchID">			
							<batchID>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:batchID"/>
							</batchID>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:receivedDate">			
							<receivedDate>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:receivedDate"/>
							</receivedDate>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:scannedDate">			
							<scannedDate>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:scannedDate"/>
							</scannedDate>
						</xsl:if>	
						<xsl:if test="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:attachmentDescription">			
							<attachmentDescription>
								<xsl:value-of select="$cnRequest/v:CreateCase/v1:AttachmentInfo/v1:attachmentDescription"/>
							</attachmentDescription>
						</xsl:if>	
					</AttachmentInfo>
					<xsl:if test="$cnRequest/v:CreateCase/v1:customerSegment">			
						<customerSegment>
							<xsl:value-of select="$cnRequest/v:CreateCase/v1:customerSegment"/>
						</customerSegment>
					</xsl:if>	
				</CreateCaseRequest>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>