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

  <!-- Carrot2 -->
  <xsl:template match="c2">Carrot<sup>2</sup></xsl:template>

  <!-- Application suite -->
  <xsl:template match="dcw"> Document Clustering Workbench</xsl:template>
  <xsl:template match="dcs"> Document Clustering Server</xsl:template>
  <xsl:template match="ja"> Java API</xsl:template>
  <xsl:template match="wa"> Web Application</xsl:template>
  <xsl:template match="man"> User and Developer Manual</xsl:template>

  <!-- Version strings -->
  <xsl:template match="version-head"><xsl:value-of select="$carrot2.version.head" /></xsl:template>
  <xsl:template match="version-stable"><xsl:value-of select="$carrot2.version.stable" /></xsl:template>

  <!-- Links to various resources -->
  <xsl:template name="dist-url">
    <xsl:param name="release" />
    <xsl:choose>
      <xsl:when test="$release = 'stable'"><xsl:value-of select="$stable.dist.url" /></xsl:when>
      <xsl:when test="$release = 'legacy'"><xsl:value-of select="$legacy.dist.url" /></xsl:when>
      <xsl:otherwise><xsl:value-of select="$head.dist.url" /></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="dist-link">
    <xsl:variable name="url">
      <xsl:call-template name="dist-url">
        <xsl:with-param name="release" select="@release" />
      </xsl:call-template>
    </xsl:variable>
    <a href="{$url}">
      <xsl:copy-of select="@class" />
      <xsl:copy-of select="@target" />
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template name="dist-base">
    <xsl:param name="node-name" />
    <xsl:choose>
      <xsl:when test="contains($node-name, 'workbench')"><xsl:value-of select="$carrot2.workbench.base" /></xsl:when>
      <xsl:when test="contains($node-name, 'dcs')"><xsl:value-of select="$carrot2.dcs.base" /></xsl:when>
      <xsl:when test="contains($node-name, 'manual')"><xsl:value-of select="$carrot2.manual.base" /></xsl:when>
      <xsl:when test="contains($node-name, 'webapp')"><xsl:value-of select="$carrot2.webapp.base" /></xsl:when>
      <xsl:when test="contains($node-name, 'java-api')"><xsl:value-of select="$carrot2.java-api.base" /></xsl:when>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="dist-version">
    <xsl:param name="node-name" />
    <xsl:param name="release" />
    -<xsl:choose><xsl:when test="$release = 'head'"><xsl:value-of select="$carrot2.version.head" /></xsl:when><xsl:otherwise><xsl:value-of select="$carrot2.version.stable" /></xsl:otherwise></xsl:choose>
  </xsl:template>

  <xsl:template name="dist-extension">
    <xsl:param name="node-name" />
    <xsl:param name="wm" />
    <xsl:param name="os" />
    <xsl:choose>
      <xsl:when test="contains($node-name, 'webapp')">.war</xsl:when>
      <xsl:otherwise>.zip</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="dist-file">
    <xsl:param name="node-name" />
    <xsl:param name="wm" />
    <xsl:param name="os" />
    <xsl:param name="arch">x86</xsl:param>
    <xsl:param name="release" />

    <xsl:variable name="dist.url">
      <xsl:call-template name="dist-url">
        <xsl:with-param name="release" select="$release" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="dist.base">
      <xsl:call-template name="dist-base">
        <xsl:with-param name="node-name" select="$node-name" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="dist.version">
      <xsl:call-template name="dist-version">
        <xsl:with-param name="node-name" select="$node-name" />
        <xsl:with-param name="release" select="$release" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="dist.extension">
      <xsl:call-template name="dist-extension">
        <xsl:with-param name="node-name" select="$node-name" />
        <xsl:with-param name="wm" select="$wm" />
        <xsl:with-param name="os" select="$os" />
      </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="platform">
      <xsl:if test="contains($node-name, 'workbench')">-<xsl:value-of select="concat($os, '.', $wm, '.', $arch)" /></xsl:if>
    </xsl:variable>
    <xsl:value-of select="concat($dist.url, '/', $dist.base, $platform, normalize-space($dist.version), $dist.extension)" /> 
  </xsl:template>

  <xsl:template match="manual-download-link|workbench-download-link|dcs-download-link|webapp-download-link|java-api-download-link">
    <xsl:variable name="dist.file">
      <xsl:call-template name="dist-file">
        <xsl:with-param name="node-name" select="local-name()" />
        <xsl:with-param name="wm" select="@wm" />
        <xsl:with-param name="os" select="@os" />
        <xsl:with-param name="release" select="@release" />
        <xsl:with-param name="arch"><xsl:choose><xsl:when test="@arch"><xsl:value-of select="@arch" /></xsl:when><xsl:otherwise>x86</xsl:otherwise></xsl:choose></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>
    <a href="{$dist.file}">
      <xsl:copy-of select="@class" />
      <xsl:copy-of select="@target" />
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="manual-download-refresh|workbench-download-refresh|dcs-download-refresh|webapp-download-refresh|java-api-download-refresh">
    <xsl:variable name="dist.file">
      <xsl:call-template name="dist-file">
        <xsl:with-param name="node-name" select="local-name()" />
        <xsl:with-param name="wm" select="@wm" />
        <xsl:with-param name="os" select="@os" />
        <xsl:with-param name="release" select="@release" />
        <xsl:with-param name="arch"><xsl:choose><xsl:when test="@arch"><xsl:value-of select="@arch" /></xsl:when><xsl:otherwise>x86</xsl:otherwise></xsl:choose></xsl:with-param>
      </xsl:call-template>
    </xsl:variable>

    <meta http-equiv="refresh" content="0;url={$dist.file}" />
  </xsl:template>

  <xsl:template match="manual-link">
    <xsl:variable name="anchor"><xsl:if test="@section">#<xsl:value-of select="@section" /></xsl:if></xsl:variable>
    <xsl:variable name="dist.url">
      <xsl:call-template name="dist-url">
        <xsl:with-param name="release" select="@release" />
      </xsl:call-template>
    </xsl:variable>
    <a>
      <xsl:copy-of select="@class" />
      <xsl:copy-of select="@target" />
      <xsl:attribute name="href"><xsl:value-of select="concat($dist.url, '/manual/index.html', $anchor)" /></xsl:attribute>
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="javadoc-link">
    <xsl:variable name="url">
      <xsl:call-template name="dist-url">
        <xsl:with-param name="release" select="@release" />
      </xsl:call-template>
    </xsl:variable>
    <a href="{$url}/javadoc/{@extension}">
      <xsl:copy-of select="@class" />
      <xsl:copy-of select="@target" />
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="carrot2-webapp-link">
    <a href="{$carrot2.webapp.url}{@extension}"><xsl:copy-of select="@class" /><xsl:copy-of select="@target" /><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="carrot2-webapp-results-link">
    <a href="{$carrot2.webapp.results.url}{@query}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="carrot2-website-link">
    <a href="{$carrot2.website.url}/{@extension}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="carrot2-source-link">
    <xsl:variable name="suffix"><xsl:if test="not(@dir)">?r=trunk</xsl:if></xsl:variable>
    <xsl:variable name="branch">/<xsl:if test="not(@branch)">trunk</xsl:if><xsl:if test="@branch"><xsl:value-of select="@branch" /></xsl:if></xsl:variable>
    <a href="http://fisheye3.atlassian.com/browse/carrot2{$branch}/{@extension}{$suffix}">
      <xsl:copy-of select="@class" />
      <xsl:copy-of select="@target" />
      <xsl:apply-templates />
    </a>
  </xsl:template>

  <xsl:template match="carrot-search-webapp-link">
    <a href="{$carrot-search.webapp.url}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="carrot-search-webapp-results-link">
    <a href="{$carrot-search.webapp.results.url}{@query}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="carrot-search-website-link">
    <a href="{$carrot-search.website.url}/{@extension}"><xsl:apply-templates /></a>
  </xsl:template>
  
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

  <!-- Release note info boxes -->
  <xsl:template match="release-info">
    <xsl:choose>
      <xsl:when test="@version = $carrot2.version.stable">
        <div class="side other-releases">
          <span class="newest">
            This is the newest release
          </span>
          <br /><span class="all-notes"><a class="small" href="release-notes.{$content-extension}">Previous releases</a></span>
        </div>
      </xsl:when>
      
      <xsl:otherwise>
        <div class="side other-releases">
          <span class="newer">
            Newer release: <a href="{concat('release-', $carrot2.version.stable, '-notes.', $content-extension)}">Carrot<sup>2</sup> v<xsl:value-of select="$carrot2.version.stable" /></a>
          </span>
          <br /><span class="all-notes"><a class="small" href="release-notes.{$content-extension}">All releases</a></span>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="stable-release-notes-link">
    <a href="{concat('release-', $carrot2.version.stable, '-notes.', $content-extension)}">
      <xsl:apply-templates />
    </a>
  </xsl:template>
</xsl:stylesheet>
