<xsl:stylesheet version="2.0" 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:err="http://www.tibco.com/schemas/asg/error" xmlns:c="http://www.tibco.com/schemas/asg/context" xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ns1="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification" xmlns:h="http://www.tibco.com/asg/protocols/http" xmlns:asg="http://www.tibco.com/asg/error" xmlns:ns="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" xmlns:nssync="http://www.vodafone.com/vf/businessEvent/interface/v.2.0"   exclude-result-prefixes="xsl c h">
	<xsl:strip-space elements="*"/>
	<xsl:output omit-xml-declaration="yes" indent="yes"/>

	<xsl:param name="routingKey"/>

	<xsl:variable name="context">
		<xsl:for-each select="/transformation/nbRequest">
			<xsl:copy-of select="document(@href)"/>
		</xsl:for-each>
	</xsl:variable>
	<xsl:variable name="cnRequestHref">
		<xsl:value-of select="/transformation/nbRequest/@href"/>
	</xsl:variable>
	<xsl:variable name="cnRequest">
		<xsl:copy-of select="document($cnRequestHref)"/>
	</xsl:variable>

<xsl:variable name="Destination"><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/ns:Header/ns:destination"/></xsl:variable>

<xsl:variable name="EventType">
       <xsl:choose>  
        <xsl:when test="exists($cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns1:BusinessEventNotification/ns1:eventType)">
		     <xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns1:BusinessEventNotification/ns1:eventType"/>
		</xsl:when>
        <xsl:otherwise><xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/nssync:BusinessEventNotification/eventType"/></xsl:otherwise>
       </xsl:choose>		
</xsl:variable>


<xsl:variable name="RoutingKey">
 <xsl:choose>
   <xsl:when test="$Destination='VPS' and ($EventType=('SALESORDERNOTIFICATION','CREDITVETEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='PONTIS' and ($EventType=('InteractionJourneyEvent','SALESORDERNOTIFICATION','PROMOTIONEVENT','DEVICECHANGEEVENT','BUNDLEEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='WIN' and ($EventType=('SALESORDERNOTIFICATION'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='CPW' and ($EventType=('SALESORDERNOTIFICATION','CREDITVETEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='2020' and ($EventType=('SALESORDERNOTIFICATION','CREDITVETEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='ARP1' and ($EventType=('ROAMINGNETWORKSTATUS'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='ARP2' and ($EventType=('ROAMINGNETWORKSTATUS'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='APPLE' and ($EventType=('SALESORDERNOTIFICATION','CREDITVETEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='VDC' and ($EventType=('DEVICECHANGEEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='LEBARA' and ($EventType=('DEVICECHANGEEVENT'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:when test="$Destination='VESTA' and ($EventType=('SALESORDERNOTIFICATION'))"><xsl:value-of select="$Destination"/></xsl:when>
   <xsl:otherwise>Undefined</xsl:otherwise>
 </xsl:choose>
</xsl:variable>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>  
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:choose xmlns:ns0="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/BusinessEventNotification" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
		<xsl:when test="$RoutingKey='Undefined'">
		  <asg_map:mapping-result xmlns:asg_map="http://www.tibco.com/asg/mapping">
		  <asg_map:error>
			<err:errorCode>R9020</err:errorCode>
			<err:errorMessage>Routing not defined</err:errorMessage>
	      </asg_map:error>
	      </asg_map:mapping-result>	
		</xsl:when>
		<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:eventType='ROAMINGNETWORKSTATUS'">
    	  <asg_map:mapping-result xmlns:asg_map="http://www.tibco.com/asg/mapping">
		   <asg_map:payload-xml>  
     		<xsl:choose xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header">
					<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header/head:Property[head:name='Format']/head:value='JSON'">

{"roamingChangeNotification":{
"roaming" : [
{
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:BusinessKey/ns0:value!=''"> 
	"address": "tel:+<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:BusinessKey/ns0:value"/>",
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:subscriberId!=''"> 
	"subscriberId": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:subscriberId"/>",
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:deviceId!=''"> 
    "deviceId": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:deviceId"/>",
						</xsl:if>
   "retrievalStatus": "Retrieved",
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:retrievalTime!=''">
   "retrievalTime": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:retrievalTime"/>",
						</xsl:if>
   "currentRoaming": "InternationalRoaming",

						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode!=''">  
   "servingNode": {
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:type!=''">
      "type": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:type"/>",
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:node!=''">
      "node": "tel:+<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:node"/>"
							</xsl:if>
	  }
						</xsl:if>
						<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc!=''">  
	  "servingMccMnc": {
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mcc!=''">
      "mcc": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mcc"/>",
							</xsl:if>
							<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mnc!=''">
      "mnc": "<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mnc"/>"
							</xsl:if>
	  }
						</xsl:if>
	  }
	]  
	  }
	  }
					</xsl:when>
					<xsl:otherwise>

						<ts:roamingChangeNotification xmlns:ts="urn:oma:xml:rest:netapi:terminalstatus:1">
							<ts:roaming>
								<xsl:choose>
									<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:BusinessKey/ns0:value!=''"> 
										<ts:address>tel:+<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:BusinessKey/ns0:value"/>
										</ts:address>
									</xsl:when>
									<xsl:otherwise>
										<ts:address>tel:+000000000000</ts:address>
									</xsl:otherwise>
								</xsl:choose>


								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:subscriberId!=''"> 
									<ts:subscriberId>
										<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:subscriberId"/>
									</ts:subscriberId>
								</xsl:if>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:deviceId!=''"> 
									<ts:deviceId>
										<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:deviceId"/>
									</ts:deviceId>
								</xsl:if>
								<ts:retrievalStatus>Retrieved</ts:retrievalStatus>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:retrievalTime!=''">
									<ts:retrievalTime>
										<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:retrievalTime"/>
									</ts:retrievalTime>
								</xsl:if>
								<currentRoaming>InternationalRoaming</currentRoaming>
								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode!=''">  
									<ts:servingNode>
										<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:type!=''">
											<ts:type>
												<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:type"/>
											</ts:type>
										</xsl:if>
										<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:node!=''">
											<ts:node>tel:+<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingNode/ns0:node"/>
											</ts:node>
										</xsl:if>
									</ts:servingNode>
								</xsl:if>

								<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc!=''">  
									<ts:servingMccMnc>
										<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mcc!=''">
											<ts:mcc>
												<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mcc"/>
											</ts:mcc>
										</xsl:if>
										<xsl:if test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mnc!=''">
											<ts:mnc>
												<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:RoamingNetworkStatus/ns0:roaming/ns0:servingMccMnc/ns0:mnc"/>
											</ts:mnc>
										</xsl:if>
									</ts:servingMccMnc>
								</xsl:if>
							</ts:roaming>
						</ts:roamingChangeNotification>

					</xsl:otherwise>
				</xsl:choose>
      	  	</asg_map:payload-xml>	
      	</asg_map:mapping-result>  
			</xsl:when>
			<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:eventType='DEVICECHANGEEVENT' or $cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:eventType='DEVICECHANGEEVENT' or $cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/nssync:BusinessEventNotification/eventType='DEVICECHANGEEVENT'" xmlns:vdc2="http://xmlns.oracle.com/EnterpriseObjects/Core/EBO/Device/V1" xmlns:vdc1="http://xmlns.vodafone.co.uk/map/til/ITIntegration/ApplicationIntegration/Routing/DeviceChangeEvent" xmlns:vdc3="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 	xmlns:nssync="http://www.vodafone.com/vf/businessEvent/interface/v.2.0">
            <asg_map:mapping-result xmlns:asg_map="http://www.tibco.com/asg/mapping">  	  
               <asg_map:payload-xml>	
                  <xsl:choose>
					<xsl:when test="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header/head:destination='VDC'" exclude-result-prefixes='#all' >
			   		   <TerminalChangedTrigger>
						<triggerID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header/head:transactionId"/>
						</triggerID>
						<MSISDN>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:BusinessKey[ns0:name='MSISDN']/ns0:value"/>
						</MSISDN>
						<IMSI>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:DeviceChangeEvent/vdc1:Device/vdc2:DeviceReference/vdc2:IMSI"/>
						</IMSI>
						<IMEI-SV>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:DeviceChangeEvent/vdc1:Device/vdc2:SerialNumber[@schemeID='IMEISV']"/>
						</IMEI-SV>
						<OpCo>UK</OpCo>
						<RuleID>
							<xsl:value-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/ns0:BusinessEventNotification/ns0:Notification/ns0:DeviceChangeEvent/vdc1:EventSpecification/vdc3:Specification[vdc3:Name='VDC_RULEID']/vdc3:ValueText"/>
						</RuleID>
					</TerminalChangedTrigger>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="$cnRequest">
						<xsl:copy>
							<xsl:apply-templates select="@* | node()"/>
						</xsl:copy>
					</xsl:for-each>
				</xsl:otherwise>
     		</xsl:choose>
     	  	</asg_map:payload-xml>	
        	</asg_map:mapping-result>  
			</xsl:when>
			<xsl:otherwise xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
      	        <asg_map:mapping-result xmlns:asg_map="http://www.tibco.com/asg/mapping">
			   <asg_map:payload-xml>	
				 <SOAP-ENV:Envelope>
					<SOAP-ENV:Header>
						<head:Header xmlns:head="http://xmlns.vodafone.co.uk/map/til/wsdl/Common/Header" 
xmlns:log="http://xmlns.vodafone.co.uk/map/til/Common/CommonObjects/Logon">
							<xsl:for-each select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Header/head:Header[1]">
								<xsl:copy-of select="head:source"/>
								<xsl:copy-of select="head:sourceTimestamp"/>
								<xsl:copy-of select="head:transactionId"/>
								<xsl:copy-of select="head:application"/>
								<xsl:copy-of select="head:messageId"/>
								<xsl:copy-of select="head:originator"/>
								<xsl:copy-of select="head:version"/>
								<xsl:copy-of select="head:custom"/>
								<xsl:copy-of select="head:Logon"/>
								<xsl:copy-of select="head:Property"/>
							</xsl:for-each>
						</head:Header>
					</SOAP-ENV:Header>
					<SOAP-ENV:Body>
						<xsl:copy-of select="$cnRequest/SOAP-ENV:Envelope/SOAP-ENV:Body/*"/>
					</SOAP-ENV:Body>
				</SOAP-ENV:Envelope>
      	  	</asg_map:payload-xml>	
      	</asg_map:mapping-result>  
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template xmlns:vdc3="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" match="vdc3:Specification[vdc3:Name='VDC_RULEID']"/>
	<xsl:template xmlns:vdc3="http://xmlns.oracle.com/EnterpriseObjects/Core/Common/V2" match="vdc3:Specification[vdc3:Name='VDC_RULEID']/vdc3:ValueText"/>
</xsl:stylesheet>