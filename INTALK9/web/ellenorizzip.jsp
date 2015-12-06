<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.sql.*"%>


<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
  var geocoder;
  var map;
  var address = localStorage.getItem('eredmeny')+'Hungary';;
  console.log(address);

  function initialize() {
      console.log('call?');
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 10,
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
</script>
<script type="text/javascript">
             function setLocal(){
                    localStorage.setItem('eredmeny2',this.text)
    }
        </script>
    </head>
    <body onload="initialize()" style="height:1000px;width:1000px">
            <%
        session.setAttribute("resultss", 
        request.getParameter("kereses"));
            %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/qbxo6s"
        user="root"  password="krosszmotor"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from php_zip where city = '<%= session.getAttribute("resultss")%>' OR zip = '<%= session.getAttribute("resultss")%>';
            </sql:query>
            <table border="1" width="100%">
<tr>
   <th>ID</th>
   <th>ZIP</th>
   <th>CITY</th>
   <th>Kerület</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
    <td><c:out value="${row.id}"/></td>
    <td><a onclick="localStorage.setItem('eredmeny2',this.text)" href="zoomresult.jsp"><c:out value="${row.zip}"/></a></td>
   <td><c:out value="${row.city}"/></td>
   <td><c:out value="${row.district}"/></td>
</tr>
</c:forEach>
</table>
<div id="map_canvas" style="width:100%; height:100%"></div>
    </body>
</html>