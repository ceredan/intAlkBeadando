<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : 2015.11.05., 10:24:35
    Author     : fszabina
--%>

<sql:setDataSource
    var="VALAKI"
    url="jdbc:derby://localhost:1527/Derbydb"
    driver="org.apache.derby.jdbc.ClientDriver"
    user="valaki"
    password="valaki"
    scope="application"
/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            localStorage.clear();
            </script>
    </head>
    <body>
        <h1>Üdvözöljük!</h1>
        <form method="post" action="check.jsp">
            Felhasznalói név: 
            <input type="text" name="userid"><br/>
            Jelszó: 
            <input type="password" name="password"><br/>
            <input type="submit"
                   name="login" value="Belép"/>   
        </form>
    
    <c:if test="${! empty param.error}">
        <h4 style="color:red">
            ${param.error}
        </h4>        
    </c:if>
    
        <h4>
            <a href="register.jsp">
                Regisztráció
            </a>
        </h4>    
    </body>
</html>
