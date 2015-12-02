<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF8_hungarian_ci">
        <title>JSP Page</title>
        <style>
      #map {
        width: 500px;
        height: 400px;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
      function initialize() {
        var mapCanvas = document.getElementById('map');
        var mapOptions = {
          center: new google.maps.LatLng(47.4925, 19.0514),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions)
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    </head>
    <body> 
<%! 
public class Varosok {
String connectionUrl = "jdbc:mysql://localhost:3306/qbxo6s";
String userId = "root";
String password = "krosszmotor";

        Connection connection = null;
        PreparedStatement selectVarosok = null;
        ResultSet resultSet = null;
        
   
   public Varosok(){
       
        try
        {
            connection = DriverManager.getConnection(connectionUrl, userId, password);
           selectVarosok = connection.prepareStatement("SELECT * from php_zip where city = ?");
            
        }catch(SQLException e){
        e.printStackTrace();
        }
   }
        public ResultSet getVarosok(String varosoktext){
            try {
                selectVarosok.setString(1, varosoktext);
                resultSet = selectVarosok.executeQuery();
            } catch(SQLException e){
                e.printStackTrace();
        }
            return resultSet;
        }
}
%>
<%
       String varosnev= new String();
       if(request.getParameter("city") != null){
           varosnev = request.getParameter("city");
       }
        
    Varosok varosok = new Varosok();
    ResultSet varosokresult = varosok.getVarosok(varosnev);
%> 


<table border="1">
<tbody>
        <tr>
            <td>ID</td>
            <td>ZIP</td>
            <td>City</td>
            <td>District</td>
        </tr>
        <% while (varosokresult.next()) { %>
        <tr>
            <td><%= varosokresult.getInt("id")%></td>
            <td><%= varosokresult.getInt("zip")%></td>
            <td><%= varosokresult.getString("city")%></td>
            <td><%= varosokresult.getString("district")%></td>
        </tr>
        <% } %>
</tbody>
</table> 
<div id="map"></div>
  </body>
</html>