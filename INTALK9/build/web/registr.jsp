
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <script src="js/sweetalert.js"></script>
                    <script>
                        function swal2(){swal("Sikeres regisztráció!", "", "success")}
                    </script>
    </head>
    <body onload="swal2()">
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/qbxo6s"
        user="root"  password="krosszmotor"/>
<sql:update var="bevitel" dataSource="${snapshot}">
    INSERT INTO FELHASZNALOK (userid, password, name1)
    VALUES ('${param.userid}', 
            '${param.password}',
            '${param.name1}')
</sql:update>

      <h4> A bejelentkezéshez kattinson 
             <a href="login.jsp">
                   ide</a></h4>
    </body>
 </html>