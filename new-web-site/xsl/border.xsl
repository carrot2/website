<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:param name="content-extension">xml</xsl:param>

  <xsl:template match="/page">
<html style="height: 100%">
  <head>
    <title>Carrot2 - Open Source Search Results Clustering Engine</title>
    <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
    <link rel="stylesheet" href="css/screen.css" />
  </head>


  <body>
    <div id="results-utils">
      <a href="http://www.carrot-search.com">About</a> |
      <a href="http://www.carrot-search.com">Demo</a> |
      <a href="http://www.carrot-search.com">Contact</a> |
      <a href="http://www.carrot-search.com">Carrot2 @ sf.net</a> |
      <a href="http://www.carrot-search.com">Carrot Search</a>
    </div>

    <table id="heading"><tr><td><h1><xsl:apply-templates select="heading" /></h1></td></tr></table>
    
    <table style="height: 100%; width: 100%">
      <tr>
        <td>
          <table style="width: 100%; margin-top: 10px">
            <tr>
              <td id="logo" rowspan="5"><a href="/"><img src="img/carrot2-logo.gif" /></a></td>
            </tr>

            <tr>
              <td colspan="3" id="top-space" />
            </tr>

            <tr>
              <td colspan="2"><img src="img/top-stroke-1.gif" /></td>
              <td><img src="img/top-stroke-2.gif" /></td>
              <td id="top-stroke-bg"></td>
            </tr>

            <tr>
              <td><a href="/"><img src="img/carrot2-text.gif" /></a></td>
              <td><img src="img/top-header-1.gif" /></td>
              <td rowspan="2" colspan="2" id="top-header-space">
                <img src="img/top-header-2.gif" />
              </td>
            </tr>

            <tr>
              <td colspan="2"><a href="/"><img src="img/carrot2-tagline.gif" /></a></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr style="height: 100%">
        <td style="height: 100%">
          <table style="height: 100%; width: 100%">
            <tr style="height: 100%">
              <td style="width: 171px; vertical-align: top" id="left-space">
                <div id="menu">
                  <div style="margin-bottom: 15px">
                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">index</xsl:with-param>
                    <xsl:with-param name="text">Home</xsl:with-param>
                    <xsl:with-param name="section">home</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">demos</xsl:with-param>
                    <xsl:with-param name="text">Live demos</xsl:with-param>
                    <xsl:with-param name="section">demo</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">applications</xsl:with-param>
                    <xsl:with-param name="text">Applications</xsl:with-param>
                    <xsl:with-param name="section">applications</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">faq</xsl:with-param>
                    <xsl:with-param name="text">FAQ</xsl:with-param>
                    <xsl:with-param name="section">faq</xsl:with-param>
                  </xsl:call-template>
                  </div>

                  <div style="margin-bottom: 15px">
                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">download</xsl:with-param>
                    <xsl:with-param name="text">Download</xsl:with-param>
                    <xsl:with-param name="section">download</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">documentation</xsl:with-param>
                    <xsl:with-param name="text">Documentation</xsl:with-param>
                    <xsl:with-param name="section">documentation</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">publications</xsl:with-param>
                    <xsl:with-param name="text">Publications</xsl:with-param>
                    <xsl:with-param name="section">publications</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">license</xsl:with-param>
                    <xsl:with-param name="text">License</xsl:with-param>
                    <xsl:with-param name="section">license</xsl:with-param>
                  </xsl:call-template>
                  </div>

                  <div style="margin-bottom: 15px">
                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">architecture</xsl:with-param>
                    <xsl:with-param name="text">Architecture</xsl:with-param>
                    <xsl:with-param name="section">architecture</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">algorithms</xsl:with-param>
                    <xsl:with-param name="text">Algorithms</xsl:with-param>
                    <xsl:with-param name="section">algorithms</xsl:with-param>
                  </xsl:call-template>
                  </div>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">authors</xsl:with-param>
                    <xsl:with-param name="text">Authors</xsl:with-param>
                    <xsl:with-param name="section">authors</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">support</xsl:with-param>
                    <xsl:with-param name="text">Support</xsl:with-param>
                    <xsl:with-param name="section">support</xsl:with-param>
                  </xsl:call-template>

                  <xsl:call-template name="menu-link">
                    <xsl:with-param name="url">spin-off</xsl:with-param>
                    <xsl:with-param name="text">Spin-off</xsl:with-param>
                    <xsl:with-param name="section">spin-off</xsl:with-param>
                  </xsl:call-template>
                </div>
              </td>

              <td id="content">
                <div style="" id="content-inner">
                  <xsl:apply-templates select="content" />
                </div>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td>
          <table style="width: 100%">
            <tr>
              <td id="bottom-stroke-bg"></td>
              <td id="bottom-stroke-1"><img src="img/bottom-stroke-1.gif" /></td>
            </tr>
            
            <tr>
              <td id="copyright" colspan="2">&#169; 2002-2006 <a href="http://www.carrot-search.com" target="_blank">Carrot Search</a>, Stanislaw Osinski, Dawid Weiss</td>  
            </tr>
          </table>
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

    <a href="{$url}.{$content-extension}">
      <xsl:if test="/page/@section = $section">
        <xsl:attribute name="class">active</xsl:attribute>
      </xsl:if>
      <img src="img/menu-bullet.gif" class="menu-bullet" />&#160;<xsl:value-of select="$text" />
    </a>
  </xsl:template>

  <xsl:template match="a[@content]">
    <a href="{@content}.{$content-extension}"><xsl:apply-templates /></a>
  </xsl:template>

  <xsl:template match="title" />

  <!-- Certain HTML elements -->
  <xsl:template match="p|table|caption|tr|th|td|a|b|i|ul|ol|br|img|div|select|option|span|li|form|script|h1|h2|h3|sup|pre">
    <xsl:copy>
      <xsl:copy-of select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
