<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" 
    encoding="utf-8" 
    indent="no"
    doctype-system="about:legacy-compat" />
  <xsl:template match="/">
    <html>
      <head>
        <title>Zadanie 2 - WebService</title>
        <meta name="author" content="Dawid Hujdus" />
        <link type="text/css" href="zad2.css" rel="stylesheet" />
        <script src="jquery-2.2.0.min.js"></script>   
        <script src="jquery.canvasjs.min.js"></script>
        <!--script src="myScript.js"></script-->    
        <script >
          var data = [] ; 
          <xsl:apply-templates select="root/data1" mode="js" />
        </script>
        <script src="zad2.js"></script>   
      </head>
      <body>
        <br />
        <div>
          <div>
            <div class="left" >
              <table class="data" >
                <tr>
                  <th>Produkt</th>
                  <th>Wartość</th>
                </tr>
                <xsl:apply-templates select="root/data1" mode="html" />
              </table>
            </div>
            <div class="right">
              <div id="chartContainer" style="height:300px; width: 100%;"></div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="root/data1" mode="html" >
    <xsl:for-each select="region" >
      <xsl:sort select="id" />
      <tr>
        <td class="name" >
          <xsl:value-of select="name" />
        </td>
        <td class="value" >
          <xsl:value-of select="value" />
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="root/data1" mode="js" >
    <xsl:for-each select="region" >
     data.push ( { y: <xsl:value-of select="value" /> , label: '<xsl:value-of select="name" />'  } ) ;
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
