<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="mozilla-plugin-script">
    <script type="text/javascript" language="javascript"><xsl:text disable-output-escaping="yes"><![CDATA[<]]></xsl:text>!--
        function addEngine()
        {
            if ((typeof window.sidebar == "object") <xsl:text disable-output-escaping="yes"><![CDATA[&&]]></xsl:text> (typeof window.sidebar.addSearchEngine == "function"))
            {
                window.sidebar.addSearchEngine(
                    "<xsl:value-of select="$carrot2.website.url" />/mozilla/carrot2.src",  /* engine URL */
                    "<xsl:value-of select="$carrot2.website.url" />/mozilla/carrot2.gif",  /* icon URL */
                    "Carrot2",                                             /* engine name */
                    "Web" );                                               /* category name */
            }
            else
            {
                alert("Mozilla M15 or later is required to add a search engine.");
            }
        }
    //--<xsl:text disable-output-escaping="yes">></xsl:text> </script>
  </xsl:template>

</xsl:stylesheet>
