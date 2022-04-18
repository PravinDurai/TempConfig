<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon" xmlns:v="http://www.vodafone.com/vf/subscriptionLifecycleManagement/interface/v.2.1" xmlns:v1="http://www.vodafone.com/vf/subscriptionLifecycleManagement/messages/v.2.1"  xmlns:set = "http://xmlns.vodafone.co.uk/map/til/ProvisioningAndFulfilment/SubscriptionManagement/SubscriptionLifecycleManagement/GetSubscriptionInformation" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:v2="http://www.vodafone.com/vf/core_common/types/v.0.3/" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:ns4="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Service" xmlns:ns5="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Threshold">

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
		<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:severity"/>
	</xsl:variable>
	<xsl:variable name="ErrorCode">
		<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:code"/>
	</xsl:variable>
	<xsl:variable name="Message">
		<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:message"/>
	</xsl:variable>
	<xsl:variable name="Component">
		<xsl:choose>
			<xsl:when test="string-length($sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:component) &gt; '0'">
				<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:component"/>
			</xsl:when>
			<xsl:otherwise>BW</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Operation">
		<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:operation"/>
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
			<xsl:when test="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus/ns:severity='S'">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon">
							<xsl:copy-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header"/>
						</head:Header>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<v:GetSubscriptionInformationResponse>
							<xsl:copy-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns:ResultStatus"/>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:SubscriberDetails">
								<v1:SubscriberDetails>
									<v1:subscriberNumber>
										<xsl:value-of select="set:subscriberNumber"/>
									</v1:subscriberNumber>
									<v1:connectDatetime>
										<xsl:value-of select="set:connectDatetime"/>
									</v1:connectDatetime>
									<v1:completionDatetime>
										<xsl:value-of select="set:completionDatetime"/>
									</v1:completionDatetime>
									<v1:serviceLevel>
										<xsl:value-of select="set:serviceLevel"/>
									</v1:serviceLevel>
									<v1:primaryResource>
										<xsl:value-of select="set:primaryResource"/>
									</v1:primaryResource>
									<v1:secondaryResource>
										<xsl:value-of select="set:secondaryResource"/>
									</v1:secondaryResource>
									<xsl:for-each select="ns4:Service">
										<ns4:Service>
											<ns4:serviceID>
												<xsl:value-of select="ns4:serviceID"/>
											</ns4:serviceID>
											<ns4:serviceName>
												<xsl:value-of select="ns4:serviceName"/>
											</ns4:serviceName>
											<xsl:for-each select="ns4:ServiceFeature">
												<ns4:ServiceFeature>
													<ns4:attributeName>
														<xsl:value-of select="ns4:attributeName"/>
													</ns4:attributeName>
													<ns4:attributeValue>
														<xsl:value-of select="ns4:attributeValue"/>
													</ns4:attributeValue>
													<ns4:attributeType>
														<xsl:value-of select="ns4:attributeType"/>
													</ns4:attributeType>
												</ns4:ServiceFeature>
											</xsl:for-each>
										</ns4:Service>
									</xsl:for-each>
								</v1:SubscriberDetails>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:ServiceProviderDetails">
								<v1:ServiceProviderDetails>
									<v1:SPName>
										<xsl:value-of select="set:SPName"/>
									</v1:SPName>
									<v1:SPCode>
										<xsl:value-of select="set:SPCode"/>
									</v1:SPCode>
									<v1:MVNECode>
										<xsl:value-of select="set:MVNECode"/>
									</v1:MVNECode>
									<v1:SPParentCode>
										<xsl:value-of select="set:SPParentCode"/>
									</v1:SPParentCode>
								</v1:ServiceProviderDetails>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:HLRDetails">
								<v1:HLRDetails>
									<v1:primaryHLR>
										<xsl:value-of select="set:primaryHLR"/>
									</v1:primaryHLR>
									<v1:secondaryHLR>
										<xsl:value-of select="set:secondaryHLR"/>
									</v1:secondaryHLR>
								</v1:HLRDetails>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:RecentTransDetails">
								<v1:RecentTransDetails>
									<v1:lastOperation>
										<xsl:value-of select="set:lastOperation"/>
									</v1:lastOperation>
									<v1:transactionNo>
										<xsl:value-of select="set:transactionNo"/>
									</v1:transactionNo>
									<v1:requestDatetime>
										<xsl:value-of select="set:requestDatetime"/>
									</v1:requestDatetime>
									<v1:completionDatetime>
										<xsl:value-of select="set:completionDatetime"/>
									</v1:completionDatetime>
								</v1:RecentTransDetails>
							</xsl:for-each>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:isAdminBarred">
								<v1:isAdminBarred>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:isAdminBarred"/>
								</v1:isAdminBarred>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:userConfNetworkService">
								<v1:userConfNetworkService>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:userConfNetworkService"/>
								</v1:userConfNetworkService>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:lockCode">
								<v1:lockCode>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:lockCode"/>
								</v1:lockCode>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:ESN">
								<v1:ESN>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:ESN"/>
								</v1:ESN>
							</xsl:if>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:disconnectionDateTime">
								<v1:disconnectionDateTime>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:disconnectionDateTime"/>
								</v1:disconnectionDateTime>
							</xsl:if>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:SIMDetails">
								<v1:SIMDetails>
									<v1:SIMSerialNumber>
										<xsl:value-of select="set:SIMSerialNumber"/>
									</v1:SIMSerialNumber>
									<v1:SIMStatus>
										<xsl:value-of select="set:SIMStatus"/>
									</v1:SIMStatus>
									<v1:isChameleonSIM>
										<xsl:value-of select="set:isChameleonSIM"/>
									</v1:isChameleonSIM>
									<v1:liveDatetime>
										<xsl:value-of select="set:liveDatetime"/>
									</v1:liveDatetime>
									<v1:requestDatetime>
										<xsl:value-of select="set:requestDatetime"/>
									</v1:requestDatetime>
									<v1:OEMName>
										<xsl:value-of select="set:OEMName"/>
									</v1:OEMName>
								</v1:SIMDetails>
							</xsl:for-each>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:PUKDetails">
								<v1:PUKDetails>
									<v1:PUKPosition>
										<xsl:value-of select="set:PUKPosition"/>
									</v1:PUKPosition>
									<v1:PIN>
										<xsl:value-of select="set:PIN"/>
									</v1:PIN>
									<v1:PUK>
										<xsl:value-of select="set:PUK"/>
									</v1:PUK>
								</v1:PUKDetails>
							</xsl:for-each>
							<xsl:if test="$sbResponse/set:GetSubscriptionInformationResponse/set:activationDateTime">
								<v1:activationDateTime>
									<xsl:value-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:activationDateTime"/>
								</v1:activationDateTime>
							</xsl:if>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:PrepaySubscriptionDetails">
								<v1:PrepaySubscriptionDetails>
									<v1:balance>
										<xsl:value-of select="set:balance"/>
									</v1:balance>
									<v1:netBalance>
										<xsl:value-of select="set:netBalance"/>
									</v1:netBalance>
									<v1:serviceDaysRemaining>
										<xsl:value-of select="set:serviceDaysRemaining"/>
									</v1:serviceDaysRemaining>
									<v1:timeStamp>
										<xsl:value-of select="set:timeStamp"/>
									</v1:timeStamp>
									<v1:accountStatus>
										<xsl:value-of select="set:accountStatus"/>
									</v1:accountStatus>
									<v1:PAMServiceLevel>
										<xsl:value-of select="set:PAMServiceLevel"/>
									</v1:PAMServiceLevel>
									<v1:accessTime>
										<xsl:value-of select="set:accessTime"/>
									</v1:accessTime>
									<v1:timeUsed>
										<xsl:value-of select="set:timeUsed"/>
									</v1:timeUsed>
									<v1:timeRemaining>
										<xsl:value-of select="set:timeRemaining"/>
									</v1:timeRemaining>
									<v1:SMSUsed>
										<xsl:value-of select="set:SMSUsed"/>
									</v1:SMSUsed>
									<v1:SMSRemaining>
										<xsl:value-of select="set:SMSRemaining"/>
									</v1:SMSRemaining>
									<v1:balanceWithoutAllowance>
										<xsl:value-of select="set:balanceWithoutAllowance"/>
									</v1:balanceWithoutAllowance>
									<v1:minimumSpendRemaining>
										<xsl:value-of select="set:minimumSpendRemaining"/>
									</v1:minimumSpendRemaining>
									<v1:totalContributed>
										<xsl:value-of select="set:totalContributed"/>
									</v1:totalContributed>
									<v1:totalMinCharge>
										<xsl:value-of select="set:totalMinCharge"/>
									</v1:totalMinCharge>
									<xsl:for-each select="set:BundleDetails">
										<v1:BundleDetails>
											<v1:bundleID>
												<xsl:value-of select="set:bundleID"/>
											</v1:bundleID>
											<v1:bundleType>
												<xsl:value-of select="set:bundleType"/>
											</v1:bundleType>
											<v1:bundleName>
												<xsl:value-of select="set:bundleName"/>
											</v1:bundleName>
											<v1:bundleStatus>
												<xsl:value-of select="set:bundleStatus"/>
											</v1:bundleStatus>
											<v1:duration>
												<xsl:value-of select="set:duration"/>
											</v1:duration>
											<v1:bundleUsage>
												<xsl:value-of select="set:bundleUsage"/>
											</v1:bundleUsage>
											<v1:bundleRemaining>
												<xsl:value-of select="set:bundleRemaining"/>
											</v1:bundleRemaining>
											<v1:activationDate>
												<xsl:value-of select="set:activationDate"/>
											</v1:activationDate>
											<v1:expiryDate>
												<xsl:value-of select="set:expiryDate"/>
											</v1:expiryDate>
										</v1:BundleDetails>
									</xsl:for-each>
								</v1:PrepaySubscriptionDetails>
							</xsl:for-each>
							<xsl:copy-of select="$sbResponse/set:GetSubscriptionInformationResponse/ns5:Threshold"/>
							<xsl:for-each select="$sbResponse/set:GetSubscriptionInformationResponse/set:FailedTopUps">
								<v1:FailedTopUps>
									<v1:msisdn>
										<xsl:value-of select="set:msisdn"/>
									</v1:msisdn>
									<v1:fraudPeriodCount>
										<xsl:value-of select="set:fraudPeriodCount"/>
									</v1:fraudPeriodCount>
									<v1:lowerThreshold>
										<xsl:value-of select="set:lowerThreshold"/>
									</v1:lowerThreshold>
									<v1:upperThreshold>
										<xsl:value-of select="set:upperThreshold"/>
									</v1:upperThreshold>
									<v1:numFailedTopUpAttempts>
										<xsl:value-of select="set:numFailedTopUpAttempts"/>
									</v1:numFailedTopUpAttempts>
									<v1:lastResetDateTime>
										<xsl:value-of select="set:lastResetDateTime"/>
									</v1:lastResetDateTime>
									<v1:numResetsInPeriod>
										<xsl:value-of select="set:numResetsInPeriod"/>
									</v1:numResetsInPeriod>
									<v1:thresholdHit>
										<xsl:value-of select="set:thresholdHit"/>
									</v1:thresholdHit>
									<v1:thresholdHitDateTime>
										<xsl:value-of select="set:thresholdHitDateTime"/>
									</v1:thresholdHitDateTime>
									<v1:upperThresholdLastDateTime>
										<xsl:value-of select="set:upperThresholdLastDateTime"/>
									</v1:upperThresholdLastDateTime>
									<xsl:for-each select="set:AttemptInformation">
										<v1:AttemptInformation>
											<v1:dateTime>
												<xsl:value-of select="set:dateTime"/>
											</v1:dateTime>
											<v1:type>
												<xsl:value-of select="set:type"/>
											</v1:type>
											<v1:flag>
												<xsl:value-of select="set:flag"/>
											</v1:flag>
											<v1:resultFromFraudDB>
												<xsl:value-of select="set:resultFromFraudDB"/>
											</v1:resultFromFraudDB>
											<v1:otherDetails>
												<xsl:value-of select="set:otherDetails"/>
											</v1:otherDetails>
										</v1:AttemptInformation>
									</xsl:for-each>
								</v1:FailedTopUps>
							</xsl:for-each>
							<v1:PromotionDetails>
								<xsl:copy-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:PromotionDetails/ancestor-or-self::*/namespace::node()"/>
								<xsl:copy-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:PromotionDetails/@*"/>
								<xsl:copy-of select="$sbResponse/set:GetSubscriptionInformationResponse/set:PromotionDetails/node()"/>
							</v1:PromotionDetails>
							<v1:traceIdentifier>
								<v2:applicationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:applicationID"/>
								</v2:applicationID>
								<v2:serviceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:serviceID"/>
								</v2:serviceID>
								<v2:serviceInterfaceVersion>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:serviceInterfaceVersion"/>
								</v2:serviceInterfaceVersion>
								<v2:timestamp>
									<xsl:value-of select="current-dateTime()"/>
								</v2:timestamp>
								<v2:referenceID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:referenceID"/>
								</v2:referenceID>
								<v2:correlationID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:correlationID"/>
								</v2:correlationID>
								<v2:identityID>
									<xsl:value-of select="$context/SOAP-ENV:Envelope/SOAP-ENV:Body/v:GetSubscriptionInformation/v1:traceIdentifier/v2:identityID"/>
								</v2:identityID>
							</v1:traceIdentifier>
						</v:GetSubscriptionInformationResponse>
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
								<v:GetSubscriptionInformationserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">SVC0002</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">ProtocolTermination : Request payload parsing error</ns1:variables>
								</v:GetSubscriptionInformationserviceException>
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
								<v:GetSubscriptionInformationserviceException>
									<ns1:messageId xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ConcatErrorCode"/>
									</ns1:messageId>
									<ns1:text xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">A service error occurred. Error code is %1</ns1:text>
									<ns1:variables xmlns:ns1="http://www.csapi.org/schema/parlayx/common/v3_1">
										<xsl:value-of select="$ErrorCode"/>|severity - E|message - <xsl:value-of select="$Message"/>|operation - <xsl:value-of select="$Operation"/>|component - <xsl:value-of select="$Component"/>|||</ns1:variables>
								</v:GetSubscriptionInformationserviceException>
							</detail>
						</SOAP-ENV:Fault>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>