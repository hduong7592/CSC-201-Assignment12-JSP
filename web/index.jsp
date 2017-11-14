<%--
  Created by IntelliJ IDEA.
  User: hieuduong
  Date: 11/13/17
  Time: 10:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Convert Hex to Decimal</title>
  <script>
      function validateForm(){
          var val1 = document.forms["myForm"]["value1"].value;
          if(val1 == ""){
              alert("Value is required!");
              document.forms["myForm"]["value1"].focus();
              return false;
          }
      }
  </script>
</head>
<body>
<br>
/**<br>
* Create by hieuduong on 11/13/17<br>
*<br>
* CSC 201 - Assignment 12<br>
* Problem 12.6:<br>
*<br>
* (NumberFormatException) Listing 6.8 implements the hex2Dec(String<br>
* hexString) method, which converts a hex string into a decimal number.<br>
* Implement the hex2Dec method to throw a NumberFormatException if the<br>
* string is not a hex string.<br>
*/<br>
  <br>
  <br>
  <form name="myForm" action="index.jsp" method="post" onsubmit="return validateForm()">
    <table align="center" style="width: 400px;">
      <tr>
        <td style="width: 150px; text-align: left;">
          String Value:
        </td>
        <td>
          <input type="text" value="" id="1" name="value1">
        </td>
      </tr>
      <tr>
        <td colspan="2" style="text-align: center">
          <input type="submit" value="Submit">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>


<%
  class Data{
    public Data(){

    }

    /**
     * Convert to Hex method
     */
    public int convertToHex(String hex){

      int value = Integer.parseInt(hex, 16);
      int decimalValue = 0;
      for (int i = 0; i < hex.length(); i++) {
        char hexChar = hex.charAt(i);
        decimalValue = decimalValue * 16 + hexCharToDecimal(hexChar);
      }
      return decimalValue;
    }

    /**
     * Get value of hex char
     * @param ch
     * @return
     */
    private int hexCharToDecimal(char ch) {
      if(ch >= 'A' && ch <= 'F')
        return 10 + ch - 'A';
      else // ch is '0', '1', ..., or '9'
        return ch - '0';

    }


  }

  String hex = "";
  try{
      hex = request.getParameter("value1").toString().toUpperCase();

      try {
        int value = Integer.parseInt(hex, 16);

        Data data = new Data();
        out.print("<table style='width:400px;' align='center'><tr><td style='text-align:center;'>Decimal value is: " + data.convertToHex(hex)+"</td></tr></table>");

      } catch (NumberFormatException ex) {
        out.print("<table style='width:400px;' align='center'><tr><td style='text-align:center;'>"+ hex + " is not a hex value</td></tr></table>");
      }
  }
  catch (Exception ex){
      //out.print(ex.toString());
  }




%>
