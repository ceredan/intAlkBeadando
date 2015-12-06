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
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
  
    
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var geocoder;
  var map;
  var address = localStorage.getItem('city');;
  console.log(address);

  function initialize() {
      console.log('call?');
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
    mapTypeControl: true,
    mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
    navigationControl: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    if (geocoder) {
      geocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
          map.setCenter(results[0].geometry.location);

            var infowindow = new google.maps.InfoWindow(
                { content: '<b>'+address+'</b>',
                  size: new google.maps.Size(150,50)
                });

            var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                map: map, 
                title:address
            }); 
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
            });

          } else {
            alert("No results found");
          }
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }
  }
  var geocoder2;
  var map2;
  var address2 = localStorage.getItem('zip');;
  
  
    console.log('call?');
    geocoder2 = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 8,
      center: latlng,
    mapTypeControl: true,
    mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
    navigationControl: true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map2 = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    if (geocoder) {
      geocoder.geocode( { 'address': address2}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
          map2.setCenter(results[0].geometry.location);

            var infowindow = new google.maps.InfoWindow(
                { content: '<b>'+address+'</b>',
                  size: new google.maps.Size(150,50)
                });

            var marker = new google.maps.Marker({
                position: results[0].geometry.location,
                map: map, 
                title:address
            }); 
            google.maps.event.addListener(marker, 'click', function() {
                infowindow.open(map,marker);
            });

          } else {
            alert("No results found");
          }
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
      });
    }
</script>

    
    </head>
    <body onload="initialize()" style="height:1000px;width:1000px"> 
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
 <div id="map_canvas" style="width:100%; height:100%">
</body>
</html>