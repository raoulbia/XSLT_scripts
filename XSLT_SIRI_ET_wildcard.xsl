<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:uri="http://www.siri.org.uk/siri">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
     
   
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
  <xsl:template match="uri:ServiceDelivery/uri:EstimatedTimetableDelivery/uri:EstimatedJourneyVersionFrame/uri:EstimatedVehicleJourney/*/child::*">
  <xsl:for-each select="child::*">
  <xsl:if test="position() != last()">"<xsl:value-of select="normalize-space(.)"/>",    </xsl:if>
  <xsl:if test="position()  = last()">"<xsl:value-of select="normalize-space(.)"/>"<xsl:text>&#xD;</xsl:text>
  </xsl:if>
  </xsl:for-each>
  </xsl:template>

  

  <xsl:template match="*" mode="csv">
    <xsl:value-of select="concat('&quot;', ., '&quot;,')" />
  </xsl:template>

  <xsl:template match="*" mode="csv-nl">
    <xsl:value-of select="concat('&quot;', ., '&quot;&#10;')" />
  </xsl:template>
  
</xsl:stylesheet>
