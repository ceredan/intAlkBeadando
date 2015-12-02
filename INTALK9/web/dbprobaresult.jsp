<%@page import="java.sql.*"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
           
           selectVarosok = connection.prepareStatement("SELECT * from php_zip");
                
           
        }catch(SQLException e){
        e.printStackTrace();
        }
}

        public ResultSet getVarosok(){
            try {
                resultSet = selectVarosok.executeQuery();
            } catch(SQLException e){
                e.printStackTrace();
        }
            return resultSet;
        }
}
%>
<%
    Varosok varosok = new Varosok();
    ResultSet varosokresult = varosok.getVarosok();


%> <table border="1">
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


</body>
</html>
