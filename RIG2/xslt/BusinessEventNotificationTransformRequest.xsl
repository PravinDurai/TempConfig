<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns0="http://www.vodafone.com/vf/businessEvent/interface/v.1.4" >

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="nbRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="nbRequest">
		<xsl:copy-of select="document($nbRequestHref)"/>
	</xsl:variable>

	<xsl:variable name="contextHref">
		<xsl:value-of select="/transformation/context/@href"/>
	</xsl:variable>	
	<xsl:variable name="contextHrefFinal">
		<xsl:copy-of select="document($contextHref)"/>
	</xsl:variable>

	<xsl:template match="/">
				<SOAP-ENV:Envelope>
					<SOAP-ENV:Body>
						<ns0:BusinessEventNotification>        
							<xsl:copy-of select="$nbRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/*"/>	
						</ns0:BusinessEventNotification>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>