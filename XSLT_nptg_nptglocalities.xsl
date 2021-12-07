<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:uri="http://www.naptan.org.uk/">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
  <xsl:template match="/">
  
  <!--Header-->  
  <xsl:text >"NptgLocalityCode","LocalityName","QualifierName","LocalityNameGA","AdministrativeAreaRef","Longitude","Latitude","NptgLocalityCodeModification"</xsl:text >
  <xsl:text>&#10;</xsl:text>
  
  <xsl:apply-templates select="uri:NationalPublicTransportGazetteer/uri:NptgLocalities" />
  </xsl:template>
     
  <xsl:template match="uri:NptgLocalities/uri:NptgLocality">
  
    <!--variables-->
    <xsl:variable name="NptgLocalityCode" select="uri:NptgLocalityCode"/> 
    <xsl:variable name="LocalityName" select="uri:Descriptor/uri:LocalityName"/>
    <xsl:variable name="QualifierName" select="uri:Descriptor/uri:Qualify/uri:QualifierName"/>
    <xsl:variable name="LocalityNameGA" select="uri:AlternativeDescriptors/uri:Descriptor/uri:LocalityName"/>
    <xsl:variable name="AdministrativeAreaRef" select="uri:AdministrativeAreaRef"/>
    <xsl:variable name="Longitude" select="uri:Location/uri:Translation/uri:Longitude"/>   
    <xsl:variable name="Latitude" select="uri:Location/uri:Translation/uri:Latitude"/>          
    <xsl:variable name="NptgLocalityCodeModification" select="@Modification"/> 
    
    <!--insert-->
	<xsl:value-of select="concat('&quot;', $NptgLocalityCode, '&quot;,')" />
	<xsl:value-of select="concat('&quot;', $LocalityName, '&quot;,')" />   
  <xsl:value-of select="concat('&quot;', $QualifierName, '&quot;,')" />      
	<xsl:value-of select="concat('&quot;', $LocalityNameGA, '&quot;,')" />
	<xsl:value-of select="concat('&quot;', $AdministrativeAreaRef, '&quot;,')" />     
	<xsl:value-of select="concat('&quot;', $Longitude, '&quot;,')" />     
	<xsl:value-of select="concat('&quot;', $Latitude, '&quot;,')" />     		   
	<xsl:value-of select="concat('&quot;', $NptgLocalityCodeModification, '&quot;,')" />  
	
    <xsl:text>&#10;</xsl:text>
	  
  </xsl:template>

  <xsl:template match="*" mode="csv">
    <xsl:value-of select="concat('&quot;', ., '&quot;,')" />
  </xsl:template>

  <xsl:template match="*" mode="csv-nl">
    <xsl:value-of select="concat('&quot;', ., '&quot;&#xA;')" />
  </xsl:template>
  
</xsl:stylesheet>
