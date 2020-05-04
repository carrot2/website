<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:param name="content-extension">xml</xsl:param>
  <xsl:param name="build.time"></xsl:param>
  <xsl:param name="copyright.year">2008</xsl:param>

  <xsl:param name="carrot2.website.url">https://project.carrot2.org</xsl:param>
  <xsl:param name="carrot2.webapp.url">https://search.carrot2.org</xsl:param>
  <xsl:param name="carrot2.webapp.results.url"><xsl:value-of select="$carrot2.webapp.url" />/#/search/web/</xsl:param>

  <xsl:param name="carrot-search.website.url">https://carrotsearch.com</xsl:param>
  <xsl:param name="carrot-search.webapp.url">https://search.carrotsearch.com</xsl:param>
  <xsl:param name="carrot-search.webapp.results.url"><xsl:value-of select="$carrot-search.webapp.url" />/#/search/web/</xsl:param>

</xsl:stylesheet>
