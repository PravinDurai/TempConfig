<xsl:stylesheet version="1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:cre="http://xmlns.vodafone.co.uk/map/til/CustomerManagement/ContactChannelManagement/CustomerContactRoutingAndAuthentication/CreateOTAC" xmlns:res="http://xmlns.vodafone.co.uk/map/til/Common/ResultStatus" xmlns:fn="http://www.tibco.com/asg/functions/json" xmlns:json="http://www.tibco.com/asg/content-types/json" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:codecs="http://www.tibco.com/asg/functions/codecs" xmlns:m="http://www.tibco.com/asg/mapping" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:h="http://www.tibco.com/asg/protocols/http">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:variable name="sbResponseHref">
		<xsl:value-of select="/transformation/sbResponse/@href"/>
	</xsl:variable>
	<xsl:variable name="sbResponse">
		<xsl:copy-of select="document($sbResponseHref)/*"/>
	</xsl:variable>
	<xsl:variable name="Severity">
		<xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/res:ResultStatus/res:severity"/>
	</xsl:variable>
	<xsl:variable name="JsonXmlResponse">
		<xsl:choose>
			<xsl:when test="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/res:ResultStatus/res:severity='S'">

				<json:json_xml>
					<json:dict>

						<json:text key="SessionID">
							<xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/cre:StateInformation/cre:SessionID"/>
						</json:text>
					</json:dict>
				</json:json_xml>
			</xsl:when>
			<xsl:when test="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/res:ResultStatus/res:severity='E'">
				<json:json_xml>
					<json:dict>
						<json:text key="status">Error</json:text>
						<json:text key="code"> 
							<xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/res:ResultStatus/res:code"/>
						</json:text>
						<json:text key="detail"> 
							<xsl:value-of select="$sbResponse/SOAP-ENV:Envelope/SOAP-ENV:Body/cre:CreateOTACResponse/res:ResultStatus/res:message"/>
						</json:text>
					</json:dict>
				</json:json_xml>
			</xsl:when>
			<xsl:otherwise>
				<json:json_xml>
					<json:dict>		
						<json:text key="code">500</json:text>
						<json:text key="detail">Internal Server Error</json:text>
						<json:text key="status">Error</json:text>
					</json:dict>
				</json:json_xml>
			</xsl:otherwise>
		</xsl:choose>  
	</xsl:variable>
	<xsl:template match="/">
		<m:mapping-result>
			<m:context>
				<c:context>
					<c:entry key="asg:httpResponse">
						<h:response>
							<h:header name="Content-Type">application/json</h:header>
							<m:payload-text>
								<xsl:value-of select="fn:render($JsonXmlResponse//json:json_xml/json:dict)"/>     
							</m:payload-text>
						</h:response>
					</c:entry>
				</c:context>
			</m:context>
		</m:mapping-result>
	</xsl:template>
</xsl:stylesheet>
