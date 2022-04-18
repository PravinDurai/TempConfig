<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
	xmlns:ns1="http://www.vodafone.com/rig/internal/validateheader/v1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:c="http://www.tibco.com/schemas/asg/context"
	xmlns:asg="http://www.tibco.com/asg/error"
	xmlns:fn="http://www.w3.org/2005/xpath-functions"
	xmlns:m="http://www.tibco.com/asg/mapping"
	xmlns:h="http://www.tibco.com/asg/protocols/http"
	xmlns:j="http://www.tibco.com/asg/protocols/jms"
	exclude-result-prefixes="xsl fn m h">
	<xsl:template match="/">
		<SOAP-ENV:Envelope xmlns:tns="tns" xmlns:s0="s0">
			<SOAP-ENV:Header/>
			<SOAP-ENV:Body>
				<tns:GetClientReportsResponse>
					<tns:GetClientReportsResult>
						<s0:Report>
							<s0:reportName/>
							<s0:data/>
							<s0:totals>0</s0:totals>
							<s0:responseStatus>EC=700 Internal error in WebService</s0:responseStatus>
						</s0:Report>
					</tns:GetClientReportsResult>
				</tns:GetClientReportsResponse>
			</SOAP-ENV:Body>
		</SOAP-ENV:Envelope>
	</xsl:template>
</xsl:stylesheet>

