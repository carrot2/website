<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="carrot2-sherlock-plugin-link">
    <a>
        <xsl:attribute name="href">javascript:addEngine("<xsl:value-of select="$carrot2.website.url" />/mozilla/carrot2.src", "<xsl:value-of select="$carrot2.website.url" />/mozilla/carrot2.gif", "Carrot2", "Web")</xsl:attribute>
        <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="carrot2-opensearch-plugin-link">
    <a>
        <xsl:attribute name="href">javascript:addOpenSearch("<xsl:value-of select="$carrot2.website.url" />/mozilla/carrot2.xml")</xsl:attribute>
        <xsl:apply-templates />
    </a>
  </xsl:template>

</xsl:stylesheet>
