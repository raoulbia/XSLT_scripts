<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:uri="http://www.naptan.org.uk/">
<xsl:output method="text" />
<xsl:output encoding="Windows-1252"/>
   
  <xsl:template match="/">
  <xsl:text >"AdministrativeAreaCode","AdministrativeAreaName","AtcoAreaCode","RegionCode","RegionName","RevisionNumber"</xsl:text >
  <xsl:text>&#10;</xsl:text>
  <xsl:apply-templates select="uri:NationalPublicTransportGazetteer/uri:Regions" />
  </xsl:template>
     
  <xsl:template match="uri:Regions/uri:Region">
  
	<!--variables-->
    <xsl:variable name="RegionCode" select="uri:RegionCode"/> 
    <xsl:variable name="RegionName" select="uri:Name"/>
    <xsl:variable name="RevisionNumber" select="uri:Name"/>


<!--<xsl:apply-templates select="@RevisionNumber" mode="csv" />  -->


    <xsl:for-each select="uri:AdministrativeAreas/uri:AdministrativeArea">
    
        <xsl:apply-templates select="uri:AdministrativeAreaCode" mode="csv" />
        <xsl:apply-templates select="uri:Name" mode="csv" />
        <xsl:apply-templates select="uri:AtcoAreaCode" mode="csv" />  
        <xsl:value-of select="concat('&quot;', $RegionCode, '&quot;,')" />
        <xsl:value-of select="concat('&quot;', $RegionName, '&quot;,')" />
        <xsl:apply-templates select="@RevisionNumber" mode="csv" />
        
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
