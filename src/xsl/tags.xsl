<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:strip-space elements="*"/>

  <!-- typewriter font -->
  <xsl:template match="tt"><span class="tt"><xsl:apply-templates /></span></xsl:template>
  
  <!-- EM dash -->
  <xsl:template match="em">—</xsl:template>

  <!-- docbook references -->
  <xsl:template match="xref[@linkend]">
    <xsl:variable name="linkend" select="@linkend" />
    <i><xsl:value-of select="//*[@id = $linkend]/@xreflabel" /></i>
  </xsl:template>

</xsl:stylesheet>
