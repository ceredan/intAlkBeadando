<%-- 
    Document   : register
    Created on : 2015.11.12., 10:16:04
    Author     : fszabina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Üdvözöljük!</h1>
        <form method="post" action="check.jsp">
            Felhasznalói név: 
            <input type="text" name="userid"><br/>
            Jelszó: 
            <input type="password" name="password"><br/>
            Valódi név: 
            <input type="text" name="name1"><br/>            
            
            <input type="submit"
                   name="registration" 
                   value="Regisztráció"/>   
        </form>
    </body>
</html>
