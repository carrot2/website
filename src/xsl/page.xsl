<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:import href="params.xsl" />
  <xsl:import href="border.xsl" />
  <xsl:import href="publications.xsl" />
  <xsl:import href="faq.xsl" />
  <xsl:import href="tags.xsl" />

  <xsl:param name="carrot2.version.stable" />
  <xsl:param name="carrot2.version.head" />
  <xsl:param name="stable.dist.url" />
  <xsl:param name="stable.webapp.url" />
  <xsl:param name="head.dist.url" />
  <xsl:param name="head.webapp.url" />

  <xsl:param name="legacy.dist.url" />
  
  <xsl:param name="carrot2.java-api.base" />
  <xsl:param name="carrot2.csharp-api.base" />
  <xsl:param name="carrot2.cli.base" />
  <xsl:param name="carrot2.dcs.base" />
  <xsl:param name="carrot2.solr-compat.base" />
  <xsl:param name="carrot2.webapp.base" />
  <xsl:param name="carrot2.workbench.base" />
  <xsl:param name="carrot2.manual.base" />
  
  <xsl:strip-space elements="*"/>

  <xsl:output indent="yes" omit-xml-declaration="yes"
       doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
       doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
       media-type="application/xhtml+xml" encoding="UTF-8" />

</xsl:stylesheet>
