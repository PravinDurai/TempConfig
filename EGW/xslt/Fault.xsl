<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fn="http://www.tibco.com/asg/functions/json"
  xmlns:json="http://www.tibco.com/asg/content-types/json" 
  xmlns:m="http://www.tibco.com/asg/mapping"
  xmlns:h="http://www.tibco.com/asg/protocols/http"
  xmlns:codecs="http://www.tibco.com/asg/functions/codecs"
  xmlns:c="http://www.tibco.com/schemas/asg/context"
  xmlns:asg="http://www.tibco.com/asg/error"
  exclude-result-prefixes="xsl fn json h m">
	<xsl:output method="xml" indent="yes" encoding="utf-8"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="asgErrorCode"/>

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/context">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>

	<xsl:variable name="BackendError">
		<xsl:value-of select="codecs:base64ToText($context/c:context/c:entry[@key='asg:sbHttpResponse']/h:response/h:body[@isBinary='false'])"/>
	</xsl:variable>

	<xsl:variable name="errorCode">
		<xsl:value-of select="$context/c:context/c:entry[@key='asg:sbHttpResponse']/h:response/h:status-code"/>
	</xsl:variable>

	<xsl:template match="*">
		<m:mapping-result>
			<m:payload-text>
				<xsl:choose>
					<xsl:when test="$errorCode ='400'">
						<xsl:value-of select="$BackendError"/>
					</xsl:when>
					<xsl:when test="$errorCode ='409'">
                        <xsl:value-of select="$BackendError"/>
                    </xsl:when>
					<xsl:when test="$errorCode ='401'">
                        <xsl:value-of select="$BackendError"/>
                    </xsl:when>
					<xsl:when test="$errorCode ='406'">
                        <xsl:value-of select="$BackendError"/>
                    </xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$asgErrorCode ='2021'">
						{
  "errors": [
    {
      "status": "403",
      "source": {
        "pointer": "/data/attributes/apikey"
      },
      "title": "Forbidden",
      "detail": "Client with given apikey not authorized to use this API"
    }
  ]
}
							</xsl:when>
							<xsl:when test="$asgErrorCode ='2002'">
						{
  "errors": [
    {
      "status": "429",
      "source": {
        "pointer": "/data/attributes/throttle"
      },
      "title": "Too Many Requests",
      "detail": "Requestor throttle limit reached"
    }
  ]
}
							</xsl:when>
							<xsl:when test="$asgErrorCode ='3001'">
						{
  "errors": [
    {
      "status": "429",
      "source": {
        "pointer": "/data/attributes/throttle"
      },
      "title": "Too Many Requests",
      "detail": "Target throttle limit reached"
    }
  ]
}
							</xsl:when>
							<xsl:when test="$asgErrorCode= '5001' or $asgErrorCode= '5002' or $asgErrorCode= '5003' or $asgErrorCode= '5004' or $asgErrorCode= '5005' or $asgErrorCode= '6000' or $asgErrorCode= '6001' or $asgErrorCode= '6002' or $asgErrorCode= '6003' or $asgErrorCode= '7002' or $asgErrorCode= '7003' or $asgErrorCode= '7005'">
						{
  "errors": [
    {
      "status": "411",
      "source": {
        "pointer": "/data/attributes/throttle"
      },
      "title": "Backend System Unavailable",
      "detail": "Operation Failed as Back End was not Reachable"
    }
  ]
}
							</xsl:when>
							<xsl:when test="$asgErrorCode= '6004' or $asgErrorCode= '7004' or $asgErrorCode= '7006' or $asgErrorCode= '7007'">
						{
  "errors": [
    {
      "status": "410",
      "source": {
        "pointer": "/data/attributes/throttle"
      },
      "title": "Backend System Interface Timeout",
      "detail": "Operation Failed due to Backend System Interface Timeout Exception"
    }
  ]
}
							</xsl:when>
							<xsl:when test="$errorCode ='500'">
								<xsl:value-of select="$BackendError"/>
							</xsl:when>
							<xsl:otherwise>
					{
  "errors": [
    {
      "status": "422",
      "source": {
        "pointer": "/data/attributes/invalid"
      },
      "title": "Unhandled Exception",
      "detail": "Something went wrong, please contact technical team"
    }
  ]
}
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</m:payload-text>
		</m:mapping-result>
	</xsl:template>
</xsl:stylesheet>
