<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:asg_map="http://www.tibco.com/asg/mapping" 
xmlns:err="http://www.tibco.com/schemas/asg/error" 
xmlns:c="http://www.tibco.com/schemas/asg/context" 
xmlns:h="http://www.tibco.com/asg/protocols/http" 
xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
xmlns:asg="http://www.tibco.com/asg/error" 
xmlns:mapperUtils="java:com.tibco.asg.tools.MapperProperties"   
xmlns:codecs="http://www.tibco.com/asg/functions/codecs" 
xmlns:json="http://www.tibco.com/asg/functions/json"
exclude-result-prefixes="err c h" >
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="no"/>
	<xsl:variable name="context">
		<c:context>
			<xsl:for-each select="/transformation/context">
				<xsl:copy-of select="document(@href)/c:context/*"/>
			</xsl:for-each>
		</c:context>
	</xsl:variable>
	<xsl:param name="GetPBIDBIDDetails" select="document('/opt/SP/tibco/env/RIG2/cfgmgmt/asg/RIG2/xslt/xml/PBID_BID_MAPPING.xml')"/>
	<xsl:param name="GetTokenDetails" select="document('/opt/SP/tibco/env/RIG2/cfgmgmt/asg/RIG2/xslt/xml/PO_TOKEN_TYPE.xml')"/>
	<xsl:param name="GetOperationDetails" select="document('/opt/SP/tibco/env/RIG2/cfgmgmt/asg/RIG2/xslt/xml/GetOperationDetails.xml')"/>
	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>
	<xsl:variable name="httpRequest">
		<xsl:copy-of select="document($contextHref)/c:context/c:entry[@key='asg:httpRequest']/h:request"/>
	</xsl:variable>
	<xsl:variable name="requestId">
		<xsl:copy-of select="$httpRequest/h:request/h:request-id"/>
	</xsl:variable>
	<xsl:variable name="GetPartnerName">
		<xsl:value-of select="mapperUtils:getProperty($requestId,'partnerName')"/>
	</xsl:variable>
	<xsl:variable name="request-uri">
		<xsl:copy-of select="$httpRequest/h:request/h:request-uri"/>
	</xsl:variable>
	<xsl:variable name="GetOperationName">
		<xsl:value-of select="$GetOperationDetails/Syntax/OperationDetails[URI = $request-uri]/OperationName"/>
	</xsl:variable>
	<xsl:variable name="TokenSupplied">
		<xsl:value-of select="$context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='authorization']"/>
	</xsl:variable>

	<xsl:variable name="AccessToken">
		<xsl:value-of select="codecs:base64ToText($context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='authorization'])"/>
	</xsl:variable>
	<xsl:variable name="Substring">
		<xsl:value-of select="substring-after($context/c:context/c:entry[@key='asg:httpRequest']/h:request/h:header[@name='authorization'] , '.')"/>
	</xsl:variable>
	<xsl:variable name="SubstringBefore">
		<xsl:value-of select="codecs:base64ToText(substring-before($Substring , '.'))"/>
	</xsl:variable>
	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>
	<xsl:variable name="integrationPartnerName">
		<xsl:value-of select="json:parse($SubstringBefore)//*[@key = 'integrationPartnerName']"/>
	</xsl:variable>
	<xsl:variable name="tokenType">
		<xsl:value-of select="json:parse($SubstringBefore)//*[@key = 'tokenType']"/>
	</xsl:variable>
	<xsl:variable name="pbid">
		<xsl:value-of select="json:parse($SubstringBefore)//*[@key = 'pbid']"/>
	</xsl:variable>
	<xsl:variable name="bid">
		<xsl:value-of select="json:parse($SubstringBefore)//*[@key = 'bid']"/>
	</xsl:variable>

	<xsl:variable name="divisionName">
		<xsl:value-of select="json:parse($SubstringBefore)//*[@key = 'divisionName']"/>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:choose>
			<xsl:when test=" $GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType != 'None' ">
				<xsl:choose>				
					<xsl:when test="$TokenSupplied != ''">
						<xsl:choose>
							<xsl:when test="$integrationPartnerName = $GetPartnerName">
								<xsl:choose>
									<xsl:when test="($tokenType = $GetTokenDetails/Syntax/TokenTypes[PartnerName = $GetPartnerName and OperationName = $GetOperationName]/TokenType) or ($tokenType = 'Contact') ">
										<xsl:choose>
											<xsl:when test="$pbid = $GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/PBID">
												<xsl:choose>
													<xsl:when test="$bid = $GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/BID">
														<xsl:choose>
															<xsl:when test="$divisionName = $GetPBIDBIDDetails/Syntax/DetailsOfPartner[PartnerName = $GetPartnerName]/DIVNAME">
																<asg_map:mapping-result>
																	<asg_map:payload-text>
																		<xsl:copy-of select="$nbRequest/*"/>
																	</asg_map:payload-text>
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
					<asg_map:payload-text>
						<xsl:copy-of select="$nbRequest/*"/>
					</asg_map:payload-text>
				</asg_map:mapping-result>  
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
