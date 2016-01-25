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
        <meta name="author" content="Paweł Najuch" />
        <link type="text/css" href="zad2.css" rel="stylesheet" />
        <script src="jquery-2.2.0.min.js"></script>   
        <script src="jquery.canvasjs.min.js"></script>
        <script src="myScript.js"></script>    
        <script >
          var data = [] ; 
          <xsl:apply-templates select="root/data1" mode="js" />
        </script>
        <script >
          var data2 = [] ; 
          <xsl:apply-templates select="root/data2" mode="js" />
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
                  <th>ID</th>
                  <th>Województwo</th>
                  <th>Miasto</th>
                  <th>Liczba ludności</th>
                </tr>
                <xsl:apply-templates select="root/data1" mode="html" />
              </table>
            </div>
            <div class="right">
              <div id="chartContainer" style="height:300px; width: 100%;"></div>
            </div>
            <div class="left">
              <form name="form" id="myForm">
                <table>
                  <tr>
                    <td><label for="wojewodztwo">Województwo:</label></td>
                    <td><input type="text" id="wojewodztwo" name="wojewodztwo" /></td>
                  </tr>
                  <tr>
                    <td><label for="miasto">Miasto:</label></td>
                    <td><input type="text" id="miasto" name="miasto" /></td>
                  </tr>
                  <tr>
                    <td><label for="ludnosc">Ludność:</label></td>
                    <td><input type="text" id="ludnosc" name="ludnosc" /></td>
                  </tr>
                  <tr>
                    <td><span id="data"><input type="button" value="Zapisz" onclick="fn_save()" /></span></td>
                    <td><span id="response"></span></td>
                  </tr>
                   <tr>
                    <td><span id="data2"><input type="button" value="Usuń" onclick="fn_delete()"/></span></td>
                    <td><input type="text" id="idToDelete" name="idToDelete"  placeholder="Podaj ID do usunięcia"  /></td>
                  </tr>
                </table>
              </form>
            </div>
          </div>
        </div>
        <div>
          <div class="container">
            <table class="data">
              <tr>
                <th>ID</th>
                <th>Województwo</th>
                <th>Liczba ludności</th>
              </tr>
              <xsl:apply-templates select="root/data2" mode="html" />
            </table>
            <div id="chartContainer2" style="height:300px; width: 100%;"></div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="root/data1" mode="html" >
    <xsl:for-each select="region" >
      <xsl:sort select="id" />
      <tr>
        <td class="lp" >
          <xsl:value-of select="id" />
        </td>
        <td class="name" >
          <xsl:value-of select="name" />
        </td>
        <td class="town" >
          <xsl:value-of select="town" />
        </td>
        <td class="val" >
          <xsl:value-of select="value" />
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="root/data2" mode="html" >
    <xsl:for-each select="region2" >
      <xsl:sort select="id" />
      <tr>
        <td class="lp" >
          <xsl:value-of select="id" />
        </td>
        <td class="name" >
          <xsl:value-of select="name" />
        </td>
        <td class="val" >
          <xsl:value-of select="value" />
        </td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="root/data1" mode="js" >
    <xsl:for-each select="region" >
     data.push ( { y: <xsl:value-of select="value" /> , label: '<xsl:value-of select="town" />'  } ) ;
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="root/data2" mode="js" >
    <xsl:for-each select="region2" >
     data2.push ( { y: <xsl:value-of select="value" /> , label: '<xsl:value-of select="name" />'  } ) ;
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
