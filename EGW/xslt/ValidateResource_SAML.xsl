<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:asg_map="http://www.tibco.com/asg/mapping" 
xmlns:err="http://www.tibco.com/schemas/asg/error" 
xmlns:c="http://www.tibco.com/schemas/asg/context" 
xmlns:h="http://www.tibco.com/asg/protocols/http" 
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"  
xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"  
xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
xmlns:asg="http://www.tibco.com/asg/error" 
xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties"
exclude-result-prefixes="err c h" >
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>

	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable>

	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>

	<xsl:param name="GetPBIDBIDDetails" select="document('/opt/SP/tibco/env/EGW/cfgmgmt/asg/EGW/xslt/PBID_BID_MAPPING.xml')"/>
	<xsl:param name="GetTokenDetails" select="document('/opt/SP/tibco/env/EGW/cfgmgmt/asg/EGW/xslt/PO_TOKEN_TYPE.xml')"/>
	<xsl:param name="GetOperationDetails" select="document('/opt/SP/tibco/env/EGW/cfgmgmt/asg/EGW/xslt/GetOperationDetails.xml')"/>

	<xsl:variable name="SoapAction">
		<xsl:value-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[lower-case(@name)='soapaction']"/>
	</xsl:variable>
	<xsl:variable name="GetOperationName">
		<xsl:value-of select="$GetOperationDetails/Syntax/OperationDetails[SoapAction = $SoapAction]/OperationName"/>
	</xsl:variable>

	<xsl:variable name="requestId">
		<xsl:copy-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:request-id"/>
	</xsl:variable>
	<xsl:variable name="GetPartnerName">
		<xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
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

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test="$Version = '2.0'">
				<xsl:choose>
					<xsl:when test="$GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType !='None'">
						<xsl:choose>				
							<xsl:when test="$TokenSupplied != ''">
								<xsl:choose>
									<xsl:when test="$IntegrationPartnerName = $GetPartnerName">
										<xsl:choose>
											<xsl:when test="$ReqTokenType = $GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType">
												<xsl:choose>

													<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/PBID = $PBID2">
														<xsl:choose>
															<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/BID = $BID2">
																<xsl:choose>
																	<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/DIVNAME = $DIVNAME">
																		<asg_map:mapping-result>
																			<asg_map:payload-xml>    		
																				<xsl:copy-of select="$nbRequest/*"/>
																			</asg_map:payload-xml>	
																		</asg_map:mapping-result>  
																	</xsl:when>
																	<xsl:otherwise>
																		<asg_map:mapping-result>
																			<asg_map:error>
																				<err:errorCode>T9005</err:errorCode>
																				<err:errorMessage>Facade Tokenization: DivisionName of the Security Token supplied in the request is invalid</err:errorMessage>
																			</asg_map:error>
																		</asg_map:mapping-result>
																	</xsl:otherwise>
																</xsl:choose> 
															</xsl:when>
															<xsl:otherwise>
																<asg_map:mapping-result>
																	<asg_map:error>
																		<err:errorCode>T9004</err:errorCode>
																		<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																	</asg_map:error>
																</asg_map:mapping-result>
															</xsl:otherwise>
														</xsl:choose> 
													</xsl:when>
													<xsl:otherwise>
														<asg_map:mapping-result>
															<asg_map:error>
																<err:errorCode>T9004</err:errorCode>
																<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
															</asg_map:error>
														</asg_map:mapping-result>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<asg_map:mapping-result>
													<asg_map:error>
														<err:errorCode>T9006</err:errorCode>
														<err:errorMessage>Facade Tokenization: Token Type of the Security Token supplied in the request is invalid</err:errorMessage>
													</asg_map:error>
												</asg_map:mapping-result>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<asg_map:mapping-result>
											<asg_map:error>
												<err:errorCode>T9003</err:errorCode>
												<err:errorMessage>Facade Tokenization: Mismatch of Integration Partner Name in token and requester</err:errorMessage>
											</asg_map:error>
										</asg_map:mapping-result>
									</xsl:otherwise>
								</xsl:choose>

							</xsl:when>
							<xsl:otherwise>
								<asg_map:mapping-result>
									<asg_map:error>
										<err:errorCode>T9001</err:errorCode>
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
					<xsl:when test="$GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType !='None'">
						<xsl:choose>
							<xsl:when test="$TokenSupplied != ''">
								<xsl:choose>
									<xsl:when test="$IntegrationPartnerName = $GetPartnerName">
										<xsl:choose>
											<xsl:when test="$ReqTokenType = $GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType">

												<xsl:choose>
													<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/PBID = $PBID">
														<xsl:choose>
															<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/BID = $BID">
																<xsl:choose>
																	<xsl:when test="$GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/DIVNAME = $DIVNAME">		
																		<asg_map:mapping-result>
																			<asg_map:payload-xml>    		
																				<xsl:copy-of select="$nbRequest/*"/>
																			</asg_map:payload-xml>	
																		</asg_map:mapping-result>    
																	</xsl:when>
																	<xsl:otherwise>
																		<asg_map:mapping-result>
																			<asg_map:error>
																				<err:errorCode>T9005</err:errorCode>
																				<err:errorMessage>Facade Tokenization: DivisionName of the Security Token supplied in the request is invalid</err:errorMessage>
																			</asg_map:error>
																		</asg_map:mapping-result>
																	</xsl:otherwise>
																</xsl:choose> 
															</xsl:when>
															<xsl:otherwise>
																<asg_map:mapping-result>
																	<asg_map:error>
																		<err:errorCode>T9004</err:errorCode>
																		<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
																	</asg_map:error>
																</asg_map:mapping-result>
															</xsl:otherwise>
														</xsl:choose> 
													</xsl:when>
													<xsl:otherwise>
														<asg_map:mapping-result>
															<asg_map:error>
																<err:errorCode>T9004</err:errorCode>
																<err:errorMessage>Facade Tokenization: BID/PBID of the Security Token supplied in the request is invalid</err:errorMessage>
															</asg_map:error>
														</asg_map:mapping-result>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:when>
											<xsl:otherwise>
												<asg_map:mapping-result>
													<asg_map:error>
														<err:errorCode>T9006</err:errorCode>
														<err:errorMessage>Facade Tokenization: Token Type of the Security Token supplied in the request is invalid</err:errorMessage>
													</asg_map:error>
												</asg_map:mapping-result>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<asg_map:mapping-result>
											<asg_map:error>
												<err:errorCode>T9003</err:errorCode>
												<err:errorMessage>Facade Tokenization: Mismatch of Integration Partner Name in token and requester</err:errorMessage>
											</asg_map:error>
										</asg_map:mapping-result>
									</xsl:otherwise>
								</xsl:choose>

							</xsl:when>
							<xsl:otherwise>
								<asg_map:mapping-result>
									<asg_map:error>
										<err:errorCode>T9001</err:errorCode>
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
	</xsl:template>
</xsl:stylesheet>
