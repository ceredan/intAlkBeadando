<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<% 
 if (session.getAttribute("validuser")!=null) {
%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main</title>
            <link href="bootstrap.css" rel="stylesheet">
            <link href="indexstyle.css" rel="stylesheet">
    </head>
    <body>
        <h1>
        Üdvözlöm
         <%=session.getAttribute("validuser")%>!</h1>
    
        <form method="post" action="ellenoriz.jsp">
            Város keresése: 
            <input  type="text" name="city" id="city"><br/>
                <input type="submit" onclick="setLocal()"
                   name="search2" value="Keres"/><br/>
        </form>
         <script type="text/javascript">
             function setLocal(){
                    localStorage.setItem('city',document.getElementById('city').value)
             }
        </script>
          <c:if test="${! empty param.error2}">
        <h4 class="sr-only">
            ${param.error2}
        </h4>        
    </c:if>
         
         
         <a href="check.jsp?logout=yes">
           Kijelentkezés</a>
    </body>
</html>
<% } else { %>
<jsp:forward page="login.jsp"/>
<% } %>