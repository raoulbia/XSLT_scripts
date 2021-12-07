<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:uri="http://www.siri.org.uk/siri">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
  <xsl:template match="/">

  <!--Header-->  
  <xsl:text >"RecordedAtTime",
              "LineRef",
              "DirectionRef",
              "DataFrameRef",
              "JourneyPatternRef",
              "PublishedLineName",
              "DestinationDisplayAtOrigin",
              "OperatorRef",
              "Monitored",
              "PredictionInaccurate",
              "BlockRef",
              "DatedVehicleJourneyRef",
              

              
              "DirectionRef",
              "BlockRef",
              "VehicleRef",

              "StopPointRef",
              "StopPointName",
              "VisitNumber",
              "DestinationDisplay",
              "AimedArrivalTime",
              "ExpectedArrivalTime"</xsl:text >
  <xsl:text>&#10;</xsl:text>
  <xsl:apply-templates select="uri:Siri/uri:ServiceDelivery/uri:EstimatedTimetableDelivery/uri:EstimatedJourneyVersionFrame/uri:EstimatedVehicleJourney"/>
  </xsl:template>
     
  <xsl:template match="uri:ServiceDelivery/uri:EstimatedTimetableDelivery/uri:EstimatedJourneyVersionFrame/uri:EstimatedVehicleJourney">
  
	<!--variables-->

  <xsl:variable name="RecordedAtTime" select="uri:RecordedAtTime"/>
  <xsl:variable name="OperatorRef" select="uri:OperatorRef"/>
  <xsl:variable name="LineRef" select="uri:LineRef"/>
  <xsl:variable name="PublishedLineName" select="uri:PublishedLineName"/>
  <xsl:variable name="DirectionRef" select="uri:DirectionRef"/>
  <xsl:variable name="BlockRef" select="uri:BlockRef"/>
  <xsl:variable name="VehicleRef" select="uri:VehicleRef"/>
  <xsl:variable name="DatedVehicleJourneyRef" select="uri:FramedVehicleJourneyRef/uri:DatedVehicleJourneyRef"/>




  <!--insert-->

  <xsl:for-each select="uri:EstimatedCalls/uri:EstimatedCall">  
    <xsl:value-of select="concat('&quot;', $RecordedAtTime, '&quot;,')" />
    <xsl:value-of select="concat('&quot;', $OperatorRef, '&quot;,')" />
    <xsl:value-of select="concat('&quot;', $LineRef, '&quot;,')" />
    <xsl:value-of select="concat('&quot;', $PublishedLineName, '&quot;,')" />
    <xsl:value-of select="concat('&quot;', $DirectionRef, '&quot;,')" /> 
    <xsl:value-of select="concat('&quot;', $BlockRef, '&quot;,')" /> 
    <xsl:value-of select="concat('&quot;', $VehicleRef, '&quot;,')" /> 
    <xsl:value-of select="concat('&quot;', $DatedVehicleJourneyRef, '&quot;,')" /> 
    <xsl:apply-templates select="uri:StopPointRef" mode="csv" />
    <xsl:apply-templates select="uri:StopPointName" mode="csv" />
    <xsl:apply-templates select="uri:VisitNumber" mode="csv" />
    <xsl:apply-templates select="uri:DestinationDisplay" mode="csv" />
    <xsl:apply-templates select="uri:AimedArrivalTime" mode="csv" />
    <xsl:apply-templates select="uri:ExpectedArrivalTime" mode="csv" />
    <xsl:text>&#10;</xsl:text>
  </xsl:for-each>
  </xsl:template>

  <xsl:template match="*" mode="csv">
    <xsl:value-of select="concat('&quot;', ., '&quot;,')" />
  </xsl:template>

  <xsl:template match="*" mode="csv-nl">
    <xsl:value-of select="concat('&quot;', ., '&quot;&#10;')" />
  </xsl:template>
  
</xsl:stylesheet>
