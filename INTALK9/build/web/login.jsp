<%-- 
    Author     : csoport4
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        
<sql:setDataSource 
    var="snapshot" 
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/qbxo6s"
    user="root"
    password="krosszmotor"/><%-- BEJELENTKEZES ADATOK PLS DO NOT OPEN --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bejelentkező oldal</title>
            <script>
            localStorage.clear(); <%-- Törlése a l.storagenek--%>
            </script>
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/indexstyle.css" rel="stylesheet">
    </head>
    <body>
        
        <form method="post" class="form-signin" action="check.jsp">
            <h2 class="form-signin-heading">Üdvözöljük!</h2>
            <label for="userid" class="sr-only">Felhasznalói név: </label>
            <input type="text" name="userid" id="userid" class="form-control" placeholder="Felhasználói név"><br/>
            <label for="password" class="sr-only">Jelszó:</label>
            <input type="password" name="password" id="password" class="form-control" placeholder="Jelszó"><br/>
            <input type="submit" class="btn btn-lg btn-primary btn-block" name="login" value="Belép"/> 
            <a href="register.jsp" class="btn btn-lg btn-info btn-block">Regisztráció</a>
        </form>
    
    <c:if test="${! empty param.error}">
        <h4><span class="label label-danger">
            ${param.error}
            </span> </h4>     
    </c:if>
    </body>
</html>
