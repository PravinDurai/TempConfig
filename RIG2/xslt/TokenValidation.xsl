<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:asg_map="http://www.tibco.com/asg/mapping" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:book="http://www.example.com/xsd/books"  exclude-result-prefixes="err c h date" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"  xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
xmlns:asg="http://www.tibco.com/asg/error" xmlns:date="http://exslt.org/dates-and-times">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>
	<xsl:variable name="httpRequest">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
	</xsl:variable>
	<xsl:variable name="soapaction">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='soapaction']"/>
	</xsl:variable>

	<xsl:param name="GetPartnerNameFile" select="document('/opt/tibco/env/RIG2/conf/PartnerName.xml')"/>
	<xsl:variable name="GetSerialNumber">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='serialnumber']"/>
	</xsl:variable>
	<xsl:variable name="GetCAISsuer">
		<xsl:value-of select="$contextHrefFinal/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='caissuer']"/>
	</xsl:variable>

	<xsl:param name="GetErrorTemplateFile" select="document('/opt/tibco/env/RIG2/conf/GetErrorTemplate.xml')"/>
	<xsl:param name="GetPartnerDetails" select="document('/opt/tibco/env/RIG2/conf/PartnerOperationToken.xml')"/>
	<xsl:param name="GetPBIDBID" select="document('/opt/tibco/env/RIG2/conf/PBID_BID_Mapping.xml')"/>
	<xsl:variable name="GetOperationName">
		<xsl:value-of select="$GetErrorTemplateFile/Syntax/TemplateReturn[SoapAction = $soapaction]/OperationName"/>	
	</xsl:variable>	

	<xsl:variable name="GetPartnerName">
		<xsl:for-each select="$GetPartnerNameFile/Syntax/DetailsOfPartner">
			<xsl:if test="SerialNumber = $GetSerialNumber and CAIssuer = $GetCAISsuer">
				<xsl:value-of select="PartnerName"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:variable>
	
	<xsl:variable name="TokenEnabled">
		<xsl:value-of select="$GetPartnerDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenReq"/>	
	</xsl:variable>	
	<xsl:variable name="TokenType">
		<xsl:value-of select="$GetPartnerDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType"/>	
	</xsl:variable>
	<xsl:variable name="TokenSupplied">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion"/>
	</xsl:variable>
	<xsl:variable name="IntegrationPartnerName">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = 'IntegrationPartnerName']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="Version">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/@Version"/>
	</xsl:variable>
	<xsl:variable name="PBID">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = 'PBID']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="BID">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = 'BID']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="PBID2">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute/saml:AttributeValue/saml:Attribute[@Name = 'PBID']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="BID2">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute/saml:AttributeValue/saml:Attribute[@Name = 'BID']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="DIVNAME">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = 'DivisionName']/saml:AttributeValue"/>
	</xsl:variable>
	<xsl:variable name="ReqTokenType">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:AttributeStatement/saml:Attribute[@Name = 'TokenType']/saml:AttributeValue"/>
	</xsl:variable>	
	<xsl:variable name="ExpiryDate">
		<xsl:value-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/wsse:Security/saml:Assertion/saml:Conditions/@NotOnOrAfter"/>
	</xsl:variable>	
	<xsl:variable name="CurrentDate">
		<xsl:value-of select="substring(date:date-time(),1,29)"/>
	</xsl:variable>
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>  
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">

		<xsl:choose>
			<xsl:when test="string-length($GetOperationName)> 0 and string-length($GetPartnerName)> 0 ">
				<xsl:choose>
					<xsl:when test="$Version = '2.0'">
						<xsl:choose>
							<xsl:when test="$TokenEnabled='YES'">
								<xsl:choose>				
									<xsl:when test="$TokenSupplied != ''">
										<xsl:choose>
											<xsl:when test="translate($ExpiryDate,':T-','')  >=
                       translate($CurrentDate,':T-','')">
												<xsl:choose>
													<xsl:when test="$IntegrationPartnerName = $GetPartnerName">
														<xsl:choose>
															<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/PBID = $PBID2">
																<xsl:choose>
																	<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/BID = $BID2">
																		<xsl:choose>
																			<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/DIVNAME = $DIVNAME">
																				<xsl:choose>
																					<xsl:when test="$ReqTokenType = $TokenType or ($ReqTokenType = 'CustomerParty' and $TokenType = 'Organisation')">    		
																						<asg_map:mapping-result>
																							<asg_map:payload-xml>    		
																								<xsl:copy-of select="$nbRequest/*"/>
																							</asg_map:payload-xml>	
																						</asg_map:mapping-result>  
																					</xsl:when>
																					<xsl:otherwise>
																						<asg_map:mapping-result>
																							<asg_map:error>
																								<err:errorCode>R9006</err:errorCode>
																								<err:errorMessage>Facade Tokenization: Token Type of the Security Token supplied in the request is invalid</err:errorMessage>
																							</asg_map:error>
																						</asg_map:mapping-result>
																					</xsl:otherwise>
																				</xsl:choose> 
																			</xsl:when>
																			<xsl:otherwise>
																				<asg_map:mapping-result>
																					<asg_map:error>
																						<err:errorCode>R9005</err:errorCode>
																						<err:errorMessage>Facade Tokenization: DivisionName of the Security Token supplied in the request is invalid</err:errorMessage>
																					</asg_map:error>
																				</asg_map:mapping-result>
																			</xsl:otherwise>
																		</xsl:choose> 
																	</xsl:when>
																	<xsl:otherwise>
																		<asg_map:mapping-result>
																			<asg_map:error>
																				<err:errorCode>R9004</err:errorCode>
																				<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																			</asg_map:error>
																		</asg_map:mapping-result>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:when>
															<xsl:otherwise>
																<asg_map:mapping-result>
																	<asg_map:error>
																		<err:errorCode>R9004</err:errorCode>
																		<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																	</asg_map:error>
																</asg_map:mapping-result>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<asg_map:mapping-result>
															<asg_map:error>
																<err:errorCode>R9003</err:errorCode>
																<err:errorMessage>Facade Tokenization: Mismatch of Integration Partner Name in token and requestor</err:errorMessage>
															</asg_map:error>
														</asg_map:mapping-result>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<asg_map:mapping-result>
													<asg_map:error>
														<err:errorCode>R9002</err:errorCode>
														<err:errorMessage>Facade Tokenization: Security Token supplied in the request has expired</err:errorMessage>
													</asg_map:error>
												</asg_map:mapping-result>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<asg_map:mapping-result>
											<asg_map:error>
												<err:errorCode>R9001</err:errorCode>
												<err:errorMessage>Facade Tokenization: Security Token is not supplied in the request</err:errorMessage>
											</asg_map:error>
										</asg_map:mapping-result>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>	
								<asg_map:mapping-result>
									<asg_map:payload-xml>    		
										<xsl:copy-of select="$nbRequest/*"/>
									</asg_map:payload-xml>	
								</asg_map:mapping-result>  
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>	
						<xsl:choose>
							<xsl:when test="$TokenEnabled='YES'">
								<xsl:choose>
									<xsl:when test="$TokenSupplied != ''">
										<xsl:choose>
											<xsl:when test="translate($ExpiryDate,':T-','')  >=
                       translate($CurrentDate,':T-','')">
												<xsl:choose>
													<xsl:when test="$IntegrationPartnerName = $GetPartnerName">
														<xsl:choose>
															<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/PBID = $PBID">
																<xsl:choose>
																	<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/BID = $BID">
																		<xsl:choose>
																			<xsl:when test="$GetPBIDBID/Syntax/DetailsOfPartner[$IntegrationPartnerName = $GetPartnerName]/DIVNAME = $DIVNAME">
																				<xsl:choose>
																					<xsl:when test="$ReqTokenType = $TokenType or ($ReqTokenType = 'CustomerParty' and $TokenType = 'Organisation')"> 		
																						<asg_map:mapping-result>
																							<asg_map:payload-xml>    		
																								<xsl:copy-of select="$nbRequest/*"/>
																							</asg_map:payload-xml>	
																						</asg_map:mapping-result>    
																					</xsl:when>
																					<xsl:otherwise>
																						<asg_map:mapping-result>
																							<asg_map:error>
																								<err:errorCode>R9006</err:errorCode>
																								<err:errorMessage>Facade Tokenization: Token Type of the Security Token supplied in the request is invalid</err:errorMessage>
																							</asg_map:error>
																						</asg_map:mapping-result>
																					</xsl:otherwise>
																				</xsl:choose> 
																			</xsl:when>
																			<xsl:otherwise>
																				<asg_map:mapping-result>
																					<asg_map:error>
																						<err:errorCode>R9005</err:errorCode>
																						<err:errorMessage>Facade Tokenization: DivisionName of the Security Token supplied in the request is invalid</err:errorMessage>
																					</asg_map:error>
																				</asg_map:mapping-result>
																			</xsl:otherwise>
																		</xsl:choose> 
																	</xsl:when>
																	<xsl:otherwise>
																		<asg_map:mapping-result>
																			<asg_map:error>
																				<err:errorCode>R9004</err:errorCode>
																				<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																			</asg_map:error>
																		</asg_map:mapping-result>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:when>
															<xsl:otherwise>
																<asg_map:mapping-result>
																	<asg_map:error>
																		<err:errorCode>R9004</err:errorCode>
																		<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																	</asg_map:error>
																</asg_map:mapping-result>
															</xsl:otherwise>
														</xsl:choose>
													</xsl:when>
													<xsl:otherwise>
														<asg_map:mapping-result>
															<asg_map:error>
																<err:errorCode>R9003</err:errorCode>
																<err:errorMessage>Facade Tokenization: Mismatch of Integration Partner Name in token and requestor</err:errorMessage>
															</asg_map:error>
														</asg_map:mapping-result>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<asg_map:mapping-result>
													<asg_map:error>
														<err:errorCode>R9002</err:errorCode>
														<err:errorMessage>Facade Tokenization: Security Token supplied in the request has expired</err:errorMessage>
													</asg_map:error>
												</asg_map:mapping-result>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<asg_map:mapping-result>
											<asg_map:error>
												<err:errorCode>R9001</err:errorCode>
												<err:errorMessage>Facade Tokenization: Security Token is not supplied in the request</err:errorMessage>
											</asg_map:error>
										</asg_map:mapping-result>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>  		
								<asg_map:mapping-result>
									<asg_map:payload-xml>
										<xsl:copy-of select="$nbRequest/*"/>
									</asg_map:payload-xml>	
								</asg_map:mapping-result>  
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<asg_map:mapping-result>
					<asg_map:error>
						<err:errorCode>R9009</err:errorCode>
						<err:errorMessage>Facade Tokenization: Partner/Operation Configuration mismatch</err:errorMessage>
					</asg_map:error>
				</asg_map:mapping-result>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>