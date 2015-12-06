<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : 2015.11.05., 10:24:35
    Author     : fszabina
--%>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/qbxo6s"
        user="root"  password="krosszmotor"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            localStorage.clear();
            </script>
            <link href="bootstrap.css" rel="stylesheet">
            <link href="indexstyle.css" rel="stylesheet">
    </head>
    <body>
        
        <form method="post" class="form-signin" action="check.jsp">
            <h2 class="form-signin-heading">Üdvözöljük!</h2>
            <label for="userid" class="sr-only">Felhasznalói név: </label>
            <input type="text" name="userid" id="userid" class="form-control" placeholder="Felhasználói név"><br/>
            <label for="password" class="sr-only">Jelszó:</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="Jelszó"><br/>
            <input type="submit" class="btn btn-lg btn-primary btn-block" 
                   name="login" value="Belép"/> 
            <a href="register.jsp" class="btn btn-lg btn-info btn-block">
                Regisztráció
            </a>
        </form>
    
    <c:if test="${! empty param.error}">
        <h4><span class="label label-danger">
            ${param.error}
            </span> </h4>     
    </c:if>
    </body>
</html>
