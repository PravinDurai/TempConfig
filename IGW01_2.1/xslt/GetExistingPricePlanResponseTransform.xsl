<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/customerPersonalInformationManagement/interface/v.2.1" xmlns:v1="http://www.vodafone.com/vf/customerPersonalInformationManagement/messages/v.2.1" xmlns:set = "http://xmlns.vodafone.co.uk/map/til/CustomerManagement/CustomerProfileManagement/CustomerPersonalInformationManagement/GetExistingPricePlan" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:ns4="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Feature">

	<xsl:variable name="sbResponse">
		<xsl:for-each select="/transformation/sbResponse">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="context">
		<xsl:for-each select="/transformation/cnRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="Severity">
		<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:severity"/>
	</xsl:variable>
	<xsl:variable name="ErrorCode">
		<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:code"/>
	</xsl:variable>
	<xsl:variable name="Message">
		<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:message"/>
	</xsl:variable>
	<xsl:variable name="Component">
		<xsl:choose>
			<xsl:when test="string-length($sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:component) &gt; '0'">
				<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:component"/>
			</xsl:when>
			<xsl:otherwise>BW</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Operation">
		<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:operation"/>
	</xsl:variable>
	<xsl:variable name="ExtractErrorCode">
		<xsl:choose>
			<xsl:when test="contains($ErrorCode, '-')">
				<xsl:value-of select="substring-after(substring-after($ErrorCode, '-'), '-')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$ErrorCode"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ConcatErrorCode">
		<xsl:value-of select="concat('SVC9',$ExtractErrorCode)"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus/ns:severity='S'">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon">
							<xsl:copy-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header"/>
						</head:Header>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v:GetExistingPricePlanResponse>
							<xsl:copy-of select="$sbResponse/set:GetExistingPricePlanResponse/ns:ResultStatus"/>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanCode">
								<v1:PricePlanCode>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanCode"/>
								</v1:PricePlanCode>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanName">
								<v1:PricePlanName>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanName"/>
								</v1:PricePlanName>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:LongPricePlanName">
								<v1:LongPricePlanName>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:LongPricePlanName"/>
								</v1:LongPricePlanName>
							</xsl:if>
							<xsl:for-each select="$sbResponse/set:GetExistingPricePlanResponse/set:OptionalExtra">
								<v1:OptionalExtra>
									<v1:code>
										<xsl:value-of select="set:code"/>
									</v1:code>
									<v1:name>
										<xsl:value-of select="set:name"/>
									</v1:name>
									<v1:effectiveDate>
										<xsl:value-of select="set:effectiveDate"/>
									</v1:effectiveDate>
									<xsl:if test="set:expiryDate">
										<v1:expiryDate>
											<xsl:value-of select="set:expiryDate"/>
										</v1:expiryDate>
									</xsl:if>
								</v1:OptionalExtra>
							</xsl:for-each>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:IsGroupSaver">
								<v1:IsGroupSaver>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:IsGroupSaver"/>
								</v1:IsGroupSaver>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:IsParent">
								<v1:IsParent>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:IsParent"/>
								</v1:IsParent>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanCost">
								<v1:PricePlanCost>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:PricePlanCost"/>
								</v1:PricePlanCost>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:Period">
								<v1:Period>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:Period"/>
								</v1:Period>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:ActivationDate">
								<v1:ActivationDate>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:ActivationDate"/>
								</v1:ActivationDate>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:LastPricePlanChangeDate">
								<v1:LastPricePlanChangeDate>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:LastPricePlanChangeDate"/>
								</v1:LastPricePlanChangeDate>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentPeriod">
								<v1:CommitmentPeriod>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentPeriod"/>
								</v1:CommitmentPeriod>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentStartDate">
								<v1:CommitmentStartDate>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentStartDate"/>
								</v1:CommitmentStartDate>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentEndDate">
								<v1:CommitmentEndDate>
									<xsl:value-of select="$sbResponse/set:GetExistingPricePlanResponse/set:CommitmentEndDate"/>
								</v1:CommitmentEndDate>
							</xsl:if>
							<xsl:for-each select="$sbResponse/set:GetExistingPricePlanResponse/set:AllocationCodes">
								<v1:AllocationCodes>
									<v1:allocationCode1>
										<xsl:value-of select="set:allocationCode1"/>
									</v1:allocationCode1>
									<v1:allocationCode2>
										<xsl:value-of select="set:allocationCode2"/>
									</v1:allocationCode2>
									<v1:allocationCode3>
										<xsl:value-of select="set:allocationCode3"/>
									</v1:allocationCode3>
									<v1:allocationCode4>
										<xsl:value-of select="set:allocationCode4"/>
									</v1:allocationCode4>
								</v1:AllocationCodes>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetExistingPricePlanResponse/set:ProductServiceInfo">
								<v1:ProductServiceInfo>
									<xsl:for-each select="set:PricePlan">
										<v1:PricePlan>
											<v1:SOC>
												<xsl:value-of select="set:SOC"/>
											</v1:SOC>
											<v1:socDescription>
												<xsl:value-of select="set:socDescription"/>
											</v1:socDescription>
										</v1:PricePlan>
									</xsl:for-each>
									<xsl:for-each select="set:AdditionalServices">
										<v1:AdditionalServices>
											<v1:serviceType>
												<xsl:value-of select="set:serviceType"/>
											</v1:serviceType>
											<v1:SOC>
												<xsl:value-of select="set:SOC"/>
											</v1:SOC>
										</v1:AdditionalServices>
									</xsl:for-each>
								</v1:ProductServiceInfo>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetExistingPricePlanResponse/set:ProductFeatureInfo">
								<v1:ProductFeatureInfo>
									<xsl:for-each select="set:PricePlanFeatures">
										<v1:PricePlanFeatures>
											<ns4:SOC>
												<xsl:value-of select="ns4:SOC"/>
											</ns4:SOC>
											<ns4:code>
												<xsl:value-of select="ns4:code"/>
											</ns4:code>
											<ns4:effectiveDate>
												<xsl:value-of select="ns4:effectiveDate"/>
											</ns4:effectiveDate>
											<ns4:expiryDate>
												<xsl:value-of select="ns4:expiryDate"/>
											</ns4:expiryDate>
											<ns4:additionalInformationType>
												<xsl:value-of select="ns4:additionalInformationType"/>
											</ns4:additionalInformationType>
											<ns4:additionalInformationAmount>
												<xsl:value-of select="ns4:additionalInformationAmount"/>
											</ns4:additionalInformationAmount>
											<ns4:additionalInformation>
												<xsl:value-of select="ns4:additionalInformation"/>
											</ns4:additionalInformation>
											<ns4:BEN>
												<xsl:value-of select="ns4:BEN"/>
											</ns4:BEN>
											<ns4:revenueCode>
												<xsl:value-of select="ns4:revenueCode"/>
											</ns4:revenueCode>
											<ns4:description>
												<xsl:value-of select="ns4:description"/>
											</ns4:description>
											<ns4:mpsFeatureCode>
												<xsl:value-of select="ns4:mpsFeatureCode"/>
											</ns4:mpsFeatureCode>
											<ns4:inclusionIndicator>
												<xsl:value-of select="ns4:inclusionIndicator"/>
											</ns4:inclusionIndicator>
											<ns4:inclusionType>
												<xsl:value-of select="ns4:inclusionType"/>
											</ns4:inclusionType>
											<xsl:for-each select="ns4:DynamicParametersInformation">
												<ns4:DynamicParametersInformation>
													<ns4:sequenceNumber>
														<xsl:value-of select="ns4:sequenceNumber"/>
													</ns4:sequenceNumber>
													<ns4:code>
														<xsl:value-of select="ns4:code"/>
													</ns4:code>
													<ns4:value>
														<xsl:value-of select="ns4:value"/>
													</ns4:value>
												</ns4:DynamicParametersInformation>
											</xsl:for-each>
										</v1:PricePlanFeatures>
									</xsl:for-each>
									<xsl:for-each select="set:PromotionalPricePlanFeatures">
										<v1:PromotionalPricePlanFeatures>
											<ns4:SOC>
												<xsl:value-of select="ns4:SOC"/>
											</ns4:SOC>
											<ns4:code>
												<xsl:value-of select="ns4:code"/>
											</ns4:code>
											<ns4:effectiveDate>
												<xsl:value-of select="ns4:effectiveDate"/>
											</ns4:effectiveDate>
											<ns4:expiryDate>
												<xsl:value-of select="ns4:expiryDate"/>
											</ns4:expiryDate>
											<ns4:additionalInformationType>
												<xsl:value-of select="ns4:additionalInformationType"/>
											</ns4:additionalInformationType>
											<ns4:additionalInformationAmount>
												<xsl:value-of select="ns4:additionalInformationAmount"/>
											</ns4:additionalInformationAmount>
											<ns4:additionalInformation>
												<xsl:value-of select="ns4:additionalInformation"/>
											</ns4:additionalInformation>
											<ns4:BEN>
												<xsl:value-of select="ns4:BEN"/>
											</ns4:BEN>
											<ns4:revenueCode>
												<xsl:value-of select="ns4:revenueCode"/>
											</ns4:revenueCode>
											<ns4:description>
												<xsl:value-of select="ns4:description"/>
											</ns4:description>
											<ns4:mpsFeatureCode>
												<xsl:value-of select="ns4:mpsFeatureCode"/>
											</ns4:mpsFeatureCode>
											<ns4:inclusionIndicator>
												<xsl:value-of select="ns4:inclusionIndicator"/>
											</ns4:inclusionIndicator>
											<ns4:inclusionType>
												<xsl:value-of select="ns4:inclusionType"/>
											</ns4:inclusionType>
											<xsl:for-each select="ns4:DynamicParametersInformation">
												<ns4:DynamicParametersInformation>
													<ns4:sequenceNumber>
														<xsl:value-of select="ns4:sequenceNumber"/>
													</ns4:sequenceNumber>
													<ns4:code>
														<xsl:value-of select="ns4:code"/>
													</ns4:code>
													<ns4:value>
														<xsl:value-of select="ns4:value"/>
													</ns4:value>
												</ns4:DynamicParametersInformation>
											</xsl:for-each>
										</v1:PromotionalPricePlanFeatures>
									</xsl:for-each>
									<xsl:for-each select="set:AdditionalSocFeatures">
										<v1:AdditionalSocFeatures>
											<ns4:SOC>
												<xsl:value-of select="ns4:SOC"/>
											</ns4:SOC>
											<ns4:code>
												<xsl:value-of select="ns4:code"/>
											</ns4:code>
											<ns4:effectiveDate>
												<xsl:value-of select="ns4:effectiveDate"/>
											</ns4:effectiveDate>
											<ns4:expiryDate>
												<xsl:value-of select="ns4:expiryDate"/>
											</ns4:expiryDate>
											<ns4:additionalInformationType>
												<xsl:value-of select="ns4:additionalInformationType"/>
											</ns4:additionalInformationType>
											<ns4:additionalInformationAmount>
												<xsl:value-of select="ns4:additionalInformationAmount"/>
											</ns4:additionalInformationAmount>
											<ns4:additionalInformation>
												<xsl:value-of select="ns4:additionalInformation"/>
											</ns4:additionalInformation>
											<ns4:BEN>
												<xsl:value-of select="ns4:BEN"/>
											</ns4:BEN>
											<ns4:revenueCode>
												<xsl:value-of select="ns4:revenueCode"/>
											</ns4:revenueCode>
											<ns4:description>
												<xsl:value-of select="ns4:description"/>
											</ns4:description>
											<ns4:mpsFeatureCode>
												<xsl:value-of select="ns4:mpsFeatureCode"/>
											</ns4:mpsFeatureCode>
											<ns4:inclusionIndicator>
												<xsl:value-of select="ns4:inclusionIndicator"/>
											</ns4:inclusionIndicator>
											<ns4:inclusionType>
												<xsl:value-of select="ns4:inclusionType"/>
											</ns4:inclusionType>
											<xsl:for-each select="ns4:DynamicParametersInformation">
												<ns4:DynamicParametersInformation>
													<ns4:sequenceNumber>
														<xsl:value-of select="ns4:sequenceNumber"/>
													</ns4:sequenceNumber>
													<ns4:code>
														<xsl:value-of select="ns4:code"/>
													</ns4:code>
													<ns4:value>
														<xsl:value-of select="ns4:value"/>
													</ns4:value>
												</ns4:DynamicParametersInformation>
											</xsl:for-each>
										</v1:AdditionalSocFeatures>
									</xsl:for-each>
									<xsl:for-each select="set:PromotionalAdditionalSocFeatures">
										<v1:PromotionalAdditionalSocFeatures>
											<ns4:SOC>
												<xsl:value-of select="ns4:SOC"/>
											</ns4:SOC>
											<ns4:code>
												<xsl:value-of select="ns4:code"/>
											</ns4:code>
											<ns4:effectiveDate>
												<xsl:value-of select="ns4:effectiveDate"/>
											</ns4:effectiveDate>
											<ns4:expiryDate>
												<xsl:value-of select="ns4:expiryDate"/>
											</ns4:expiryDate>
											<ns4:additionalInformationType>
												<xsl:value-of select="ns4:additionalInformationType"/>
											</ns4:additionalInformationType>
											<ns4:additionalInformationAmount>
												<xsl:value-of select="ns4:additionalInformationAmount"/>
											</ns4:additionalInformationAmount>
											<ns4:additionalInformation>
												<xsl:value-of select="ns4:additionalInformation"/>
											</ns4:additionalInformation>
											<ns4:BEN>
												<xsl:value-of select="ns4:BEN"/>
											</ns4:BEN>
											<ns4:revenueCode>
												<xsl:value-of select="ns4:revenueCode"/>
											</ns4:revenueCode>
											<ns4:description>
												<xsl:value-of select="ns4:description"/>
											</ns4:description>
											<ns4:mpsFeatureCode>
												<xsl:value-of select="ns4:mpsFeatureCode"/>
											</ns4:mpsFeatureCode>
											<ns4:inclusionIndicator>
												<xsl:value-of select="ns4:inclusionIndicator"/>
											</ns4:inclusionIndicator>
											<ns4:inclusionType>
												<xsl:value-of select="ns4:inclusionType"/>
											</ns4:inclusionType>
											<xsl:for-each select="ns4:DynamicParametersInformation">
												<ns4:DynamicParametersInformation>
													<ns4:sequenceNumber>
														<xsl:value-of select="ns4:sequenceNumber"/>
													</ns4:sequenceNumber>
													<ns4:code>
														<xsl:value-of select="ns4:code"/>
													</ns4:code>
													<ns4:value>
														<xsl:value-of select="ns4:value"/>
													</ns4:value>
												</ns4:DynamicParametersInformation>
											</xsl:for-each>
										</v1:PromotionalAdditionalSocFeatures>
									</xsl:for-each>
								</v1:ProductFeatureInfo>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetExistingPricePlanResponse/set:BundleAllowance">
								<v1:BundleAllowance>
									<v1:voice>
										<xsl:value-of select="set:voice"/>
									</v1:voice>
									<v1:data>
										<xsl:value-of select="set:data"/>
									</v1:data>
									<v1:sms>
										<xsl:value-of select="set:sms"/>
									</v1:sms>
								</v1:BundleAllowance>
							</xsl:for-each>
							<v1:traceIdentifier>
								<v2:applicationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:applicationID"/>
								</v2:applicationID>
								<v2:serviceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:serviceID"/>
								</v2:serviceID>
								<v2:serviceInterfaceVersion>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
								</v2:serviceInterfaceVersion>
								<v2:timestamp>
									<xsl:value-of select="current-dateTime()"/>
								</v2:timestamp>
								<v2:referenceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:referenceID"/>
								</v2:referenceID>
								<v2:correlationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:correlationID"/>
								</v2:correlationID>
								<v2:identityID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetExistingPricePlan/v1:traceIdentifier/v2:identityID"/>
								</v2:identityID>
							</v1:traceIdentifier>
						</v:GetExistingPricePlanResponse>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:when test="string-length($sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/SOAP-ENV:Fault/detail) &gt; 0">
				<xsl:copy-of select="$sbResponse/*"/>
			</xsl:when>
			<xsl:when test="$ExtractErrorCode='190'">
				<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>Client</faultcode>
							<faultstring>SVC0002</faultstring>
							<faultactor>null</faultactor>
							<detail>
								<v:GetExistingPricePlanserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">SVC0002</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">ProtocolTermination : Request payload parsing error</ns1:variables>
								</v:GetExistingPricePlanserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:when>
			<xsl:otherwise>
				<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
					<SOAP-ENV:Body>
						<SOAP-ENV:Fault>
							<faultcode>Client</faultcode>
							<faultstring>
								<xsl:value-of select="$ConcatErrorCode"/>
							</faultstring>
							<faultactor>null</faultactor>
							<detail>
								<v:GetExistingPricePlanserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ConcatErrorCode"/>
									</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorCode"/>|severity - E|message - <xsl:value-of select="$Message"/>|operation - <xsl:value-of select="$Operation"/>|component - <xsl:value-of select="$Component"/>|||</ns1:variables>
								</v:GetExistingPricePlanserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>