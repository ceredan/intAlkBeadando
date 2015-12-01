<%-- 
    Document   : main
    Created on : 2015.11.05., 10:24:55
    Author     : fszabina
--%>
<% 
 if (session.getAttribute("validuser")!=null)
 {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
    </head>
    <body>
        <h1>
        Üdvözlöm
         <%=session.getAttribute("validuser")%>!</h1>
    
        <form method="post" action="check.jsp">
            Város: 
            <input type="text" name="city"><br/>
            <h1> <%=session.getAttribute("validuser")%>, az általad beírt városhoz tartozó irányítószám: <%=session.getAttribute("zipnumber")%>
            </h1>
                <input type="submit"
                   name="search" value="Keres"/><br/>
        </form>
         
         
         
         
         
         <a href="check.jsp?logout=yes">
           Kijelentkezés</a>
    </body>
</html>
<% } else { %>
<jsp:forward page="login.jsp"/>
<% } %>