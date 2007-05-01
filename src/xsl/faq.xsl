<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="faqs">
    <div class="qa-index">
      <xsl:apply-templates select="faq" mode="index" />
    </div>

    <xsl:apply-templates select="faq" />
  </xsl:template>

  <xsl:template match="faq">
    <div class="qa">
      <div class="q"><a style="color: black" name="{@id}"><xsl:apply-templates select="question" /></a></div>
      <div class="a"><xsl:apply-templates select="answer" /></div>
    </div>
  </xsl:template>

  <xsl:template match="faq" mode="index">
    <a href="#{@id}"><xsl:apply-templates select="question" /></a><br />
  </xsl:template>
</xsl:stylesheet>
