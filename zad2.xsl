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
     <meta name="author" content="Antoni Dydejczyk" />
     <link type="text/css" href="zad2.css" rel="stylesheet" />
     <script src="canvasjs.min.js">
     </script>
     <script >
	    var dd = [] ; 
	    <xsl:apply-templates select="root" mode="js" />
     </script>
     <script src="zad2.js">
     </script>
  </head>
  <body>   
  <br />
  <div class="left" >    
    <table class="data" >
      <tr>
        <th>Lp.</th><th>Produkt</th><th>Sprzedaz</th>
      </tr>
      <xsl:apply-templates select="root" mode="html" />
    </table>
  </div>
  <div class="right">
    <div id="chartContainer" style="height:300px; width: 100%;">

    </div>
  </div>
  </body>
</html> 
</xsl:template>

<xsl:template match="root" mode="html" >
  <xsl:for-each select="product" >
    <xsl:sort select="name" />
    <xsl:variable name="bIsEven" select="position() mod 2 = 0" />
    <tr>
      <xsl:if test="$bIsEven">
        <xsl:attribute name="class">evenRow</xsl:attribute>
      </xsl:if>
      <td class="lp" ><xsl:number /></td>
      <td class="name" ><xsl:value-of select="name" /></td>
      <td class="val" ><xsl:value-of select="value" /></td>
    </tr>
  </xsl:for-each>
</xsl:template>

<xsl:template match="root" mode="js" >
  <xsl:for-each select="product" >
     dd.push ( { y: <xsl:value-of select="value" /> , label: '<xsl:value-of select="name" />' } ) ;
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>

