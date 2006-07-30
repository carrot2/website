<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:param name="divider" select="1" />

  <xsl:template match="/page">
<html style="height: 100%">
  <head>
    <title>Carrot2 - Open Source Search Results Clustering Engine</title>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <link rel="stylesheet" href="css/screen.css" />
  </head>

  <body style="height: 100%">
    <table style="width: 100%; height: 100%">
      <tr>
        <td colspan="2" style="padding-top: 47px">
          <div id="results-utils">
            <a href="http://www.carrot-search.com">About</a> |
            <a href="http://www.carrot-search.com">Demo</a> |
            <a href="http://www.carrot-search.com">Contect</a> |
            <a href="http://www.carrot-search.com">Carrot2 @ sf.net</a> |
            <a href="http://www.carrot-search.com">Carrot Search</a>
          </div>

          <img src="img/results-logo-os.gif" id="results-logo" />
          <img src="img/results-logo-text-os.gif" id="results-logo-text-os" />

          <table id="results-main">
            <tr>
              <td id="startup-main-top-outer-left" />
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td id="page-menu">
          <div id="menu-container">
            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">index.xml</xsl:with-param>
              <xsl:with-param name="text">Home</xsl:with-param>
              <xsl:with-param name="section">home</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Live demos</xsl:with-param>
              <xsl:with-param name="section">demo</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Download</xsl:with-param>
              <xsl:with-param name="section">download</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Architecture</xsl:with-param>
              <xsl:with-param name="section">algorithms</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Publications</xsl:with-param>
              <xsl:with-param name="section">algorithms</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Applications</xsl:with-param>
              <xsl:with-param name="section">license</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">authors.xml</xsl:with-param>
              <xsl:with-param name="text">Authors</xsl:with-param>
              <xsl:with-param name="section">authors</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Support</xsl:with-param>
              <xsl:with-param name="section">support</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="menu-link">
              <xsl:with-param name="url">#</xsl:with-param>
              <xsl:with-param name="text">Spin-off</xsl:with-param>
              <xsl:with-param name="section">spin-off</xsl:with-param>
            </xsl:call-template>
          </div>
        </td>

        <td id="page-content">
          <h1><xsl:apply-templates select="heading" /></h1>

          <div style="width: 650px; margin-right: auto; margin-top: 25px">
            <xsl:apply-templates select="content" />

          </div>
        </td>
      </tr>

      <tr>
        <td colspan="2">
          <div id="startup-main-bottom-outer"></div>

          <div class="copyright">
            &#169; 2002-2006 <a href="http://www.carrot-search.com" target="_blank">Carrot Search</a>, Stanislaw Osinski, Dawid Weiss
          </div>
        </td>
      </tr>
    </table>
  </body>
</html>
  </xsl:template>

  <xsl:template name="menu-link">
    <xsl:param name="url" />
    <xsl:param name="text" />
    <xsl:param name="section" />

    <a href="{$url}">
      <xsl:if test="/page/@section = $section">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <img src="img/info-menu-bullet.gif" class="menu-bullet" />&#160;<xsl:value-of select="$text" />
    </a>
  </xsl:template>

  <xsl:template name="menu-sublink">
    <xsl:param name="url" />
    <xsl:param name="text" />
    <xsl:param name="section" />

    <a href="{$url}" class="sublink">
      <xsl:if test="/page/@section = $section">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <xsl:value-of select="$text" />
    </a>
  </xsl:template>

  <xsl:template match="title" />

  <!-- Certain HTML elements -->
  <xsl:template match="p|table|tr|td|a|b|ul|ol|br|img|div|select|option|span|li|form|script|h1|h2|h3|sup">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
