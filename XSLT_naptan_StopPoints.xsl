<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:uri="http://www.naptan.org.uk/">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
  <xsl:template match="/">
  
  <!--Header-->  
  <xsl:text>"AtcoCode","PlateCode","NptgLocalityRef","StopAreaRef","AdministrativeAreaRef","StopType","CommonName","ShortCommonNameEN","ShortCommonNameGA","Street","BusStopType","TimingStatus","CompassPoint","Longitude","Latitude","StopPointModificationDateTime","StopPointStatus"</xsl:text >
  <xsl:text>&#10;</xsl:text>
  
  <xsl:apply-templates select="uri:NaPTAN/uri:StopPoints" />
  </xsl:template>
     
  <xsl:template match="uri:StopPoints/uri:StopPoint">
  
    <!--variables-->
    <xsl:variable name="AtcoCode" select="uri:AtcoCode"/> 
    <xsl:variable name="PlateCode" select="uri:PlateCode"/> 
    <xsl:variable name="NptgLocalityRef" select="uri:Place/uri:NptgLocalityRef"/>
    <xsl:variable name="StopAreaRef" select="uri:StopAreas/uri:StopAreaRef"/>
    <xsl:variable name="AdministrativeAreaRef" select="uri:AdministrativeAreaRef"/>
    <xsl:variable name="StopType" select="uri:StopClassification/uri:StopType"/>
    <xsl:variable name="CommonName" select="uri:Descriptor/uri:CommonName"/>
    <xsl:variable name="ShortCommonNameEN" select="uri:Descriptor/uri:ShortCommonName"/>
    <xsl:variable name="ShortCommonNameGA" select="uri:AlternativeDescriptors/uri:Descriptor/uri:ShortCommonName"/>
    <xsl:variable name="Street" select="uri:Descriptor/uri:Street"/>
    <xsl:variable name="BusStopType" select="uri:StopClassification/uri:OnStreet/uri:Bus/uri:BusStopType"/>
    <xsl:variable name="TimingStatus" select="uri:StopClassification/uri:OnStreet/uri:Bus/uri:TimingStatus"/>
    <xsl:variable name="CompassPoint" select="uri:StopClassification/uri:OnStreet/uri:Bus/uri:MarkedPoint/uri:Bearing/uri:CompassPoint"/>
    <xsl:variable name="Longitude" select="uri:Place/uri:Location/uri:Translation/uri:Longitude"/>
    <xsl:variable name="Latitude" select="uri:Place/uri:Location/uri:Translation/uri:Latitude"/>
    <xsl:variable name="StopPointModificationDateTime" select="@ModificationDateTime"/> 
    <xsl:variable name="StopPointStatus" select="@Status"/> 
    
    <!--insert-->
	<xsl:value-of select="concat('&quot;', $AtcoCode, '&quot;,')" />
	<xsl:value-of select="concat('&quot;', $PlateCode, '&quot;,')" />
  <xsl:value-of select="concat('&quot;', $NptgLocalityRef, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $StopAreaRef, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $AdministrativeAreaRef, '&quot;,')" />       
  <xsl:value-of select="concat('&quot;', $StopType, '&quot;,')" /> 
	<xsl:value-of select="concat('&quot;', $CommonName, '&quot;,')" />
	<xsl:value-of select="concat('&quot;', $ShortCommonNameEN, '&quot;,')" />     
	<xsl:value-of select="concat('&quot;', $ShortCommonNameGA, '&quot;,')" />     
	<xsl:value-of select="concat('&quot;', $Street, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $BusStopType, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $TimingStatus, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $CompassPoint, '&quot;,')" />     		   
	<xsl:value-of select="concat('&quot;', $Longitude, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $Latitude, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $StopPointModificationDateTime, '&quot;,')" />  
  <xsl:value-of select="concat('&quot;', $StopPointStatus, '&quot;,')" />  
	
    <xsl:text>&#10;</xsl:text>
	  
  </xsl:template>

  <xsl:template match="*" mode="csv">
    <xsl:value-of select="concat('&quot;', ., '&quot;,')" />
  </xsl:template>

  <xsl:template match="*" mode="csv-nl">
    <xsl:value-of select="concat('&quot;', ., '&quot;&#xA;')" />
  </xsl:template>
  
</xsl:stylesheet>


