<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:uri="http://www.naptan.org.uk/">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
  <xsl:template match="/">
  
  <!--Header-->  
  <xsl:text>"StopAreaCode","StopAreaName","StopAreaType","AdministrativeAreaRef","Longitude","Latitude","Easting","Northing","StopAreaModificationDateTime","StopAreaStatus"</xsl:text >
  <xsl:text>&#10;</xsl:text>
  
  <xsl:apply-templates select="uri:NaPTAN/uri:StopAreas" />
  </xsl:template>
     
  <xsl:template match="uri:StopAreas/uri:StopArea">
  
    <!--variables-->
    <xsl:variable name="StopAreaCode" select="uri:StopAreaCode"/> 
    <xsl:variable name="StopAreaName" select="uri:Name"/> 
    <xsl:variable name="StopAreaType" select="uri:StopAreaType"/>
    <xsl:variable name="AdministrativeAreaRef" select="uri:AdministrativeAreaRef"/>
    <xsl:variable name="Longitude" select="uri:Location/uri:Translation/uri:Longitude"/>
    <xsl:variable name="Latitude" select="uri:Location/uri:Translation/uri:Latitude"/>
    <xsl:variable name="Easting" select="uri:Location/uri:Translation/uri:Easting"/>
    <xsl:variable name="Northing" select="uri:Location/uri:Translation/uri:Northing"/>
    <xsl:variable name="StopAreaModificationDateTime" select="@ModificationDateTime"/> 
    <xsl:variable name="StopAreaStatus" select="@Status"/> 
    
    <!--insert-->
	<xsl:value-of select="concat('&quot;', $StopAreaCode, '&quot;,')" />
	<xsl:value-of select="concat('&quot;', $StopAreaName, '&quot;,')" />      
	<xsl:value-of select="concat('&quot;', $StopAreaType, '&quot;,')" />   
	<xsl:value-of select="concat('&quot;', $AdministrativeAreaRef, '&quot;,')" />  
	<xsl:value-of select="concat('&quot;', $Longitude, '&quot;,')" />     
	<xsl:value-of select="concat('&quot;', $Latitude, '&quot;,')" />
  <xsl:value-of select="concat('&quot;', $Easting, '&quot;,')" />
  <xsl:value-of select="concat('&quot;', $Northing, '&quot;,')" /> 
  <xsl:value-of select="concat('&quot;', $StopAreaModificationDateTime, '&quot;,')" />  
  <xsl:value-of select="concat('&quot;', $StopAreaStatus, '&quot;,')" />  
        
    <xsl:text>&#10;</xsl:text>
	  
  </xsl:template>

  <xsl:template match="*" mode="csv">
    <xsl:value-of select="concat('&quot;', ., '&quot;,')" />
  </xsl:template>

  <xsl:template match="*" mode="csv-nl">
    <xsl:value-of select="concat('&quot;', ., '&quot;&#xA;')" />
  </xsl:template>
  
</xsl:stylesheet>
