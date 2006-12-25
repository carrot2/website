<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="publication-group">
    <h2><xsl:value-of select="title" /></h2>

    <ol class="publication-list">
      <xsl:apply-templates select="paper|poster|thesis|custom" />
    </ol>
  </xsl:template>

  <xsl:template match="custom">
    <li>
      <xsl:apply-templates />
    </li>
  </xsl:template>

  <xsl:template match="paper">
    <li>
      <span class="authors"><xsl:value-of select="authors" /></span>:
      <span class="title"><xsl:value-of select="title" /></span>.
      <span class="where"><xsl:value-of select="where" /></span>
      <span class="links">
        <xsl:if test="@bibtex">
          <a href="{@bibtex}"><xsl:call-template name="bibtex" /></a>
        </xsl:if>
        <xsl:if test="@paper">
          <a href="{@paper}">Paper <xsl:call-template name="pdf" /></a>
        </xsl:if>
        <xsl:if test="@paper-local">
          <a href="{$carrot2.website.url}/publications/{@paper-local}">Paper <xsl:call-template name="pdf" /></a>
        </xsl:if>
        <xsl:if test="@slides">
          <a href="{@slides}">Conference slides <xsl:call-template name="pdf" /></a>
        </xsl:if>
        <xsl:apply-templates select="link" />
      </span>
    </li>
  </xsl:template>

  <xsl:template match="poster">
    <li>
      <span class="authors"><xsl:value-of select="authors" /></span>:
      <span class="title"><xsl:value-of select="title" /></span>.
      <span class="where"><xsl:value-of select="where" /></span>
      <span class="links">
        <xsl:if test="@poster">
          <a href="{@poster}">Poster <xsl:call-template name="jpg" /></a>
        </xsl:if>
        <xsl:apply-templates select="link" />
      </span>
    </li>
  </xsl:template>

  <xsl:template match="thesis">
    <li>
      <span class="authors"><xsl:value-of select="authors" /></span>:
      <span class="title"><xsl:value-of select="title" /></span>.
      <span class="where"><xsl:value-of select="where" /></span>
      <span class="links">
        <xsl:if test="@bibtex">
          <a href="{@bibtex}"><xsl:call-template name="bibtex" /></a>
        </xsl:if>
        <xsl:if test="@thesis">
          <a href="{@thesis}">Thesis <xsl:call-template name="pdf" /></a>
        </xsl:if>
        <xsl:if test="@thesis-local">
          <a href="{$carrot2.website.url}/publications/{@thesis-local}">Thesis <xsl:call-template name="pdf" /></a>
        </xsl:if>
        <xsl:apply-templates select="link" />
      </span>
    </li>
  </xsl:template>

  <xsl:template match="paper/link">
    <a href="{@href}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template name="bibtex">BibT<sub class="bt">E</sub>X</xsl:template>
  <xsl:template name="pdf"><img src="img/pdf.gif" alt="PDF" /></xsl:template>
  <xsl:template name="jpg"><img src="img/jpg.gif" alt="JPG" /></xsl:template>
</xsl:stylesheet>
