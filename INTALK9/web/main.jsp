<%-- 
    Author     : csoport 4
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<% 
 if (session.getAttribute("validuser")!=null) {
%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<!DOCTYPE html>
<html>
    <head>
 <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
        <title>Main page</title>
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/indexstyle.css" rel="stylesheet">
    </head>
    <body>
        <h1>Udvozlom <%=session.getAttribute("validuser")%>!</h1>
            <form method="post" action="ellenorizzip.jsp">  
                <input  type="text" name="kereses" id="kereses"  placeholder="Irja be a keresett erteket"><br/>
                <input type ="submit" onclick="setLocal()" name="citysearch" value="keres"/><br/>
                    <%
                        session.setAttribute("resultss", 
                        request.getParameter("kereses"));
                    %> 
            </form>
        <script type="text/javascript">
             function setLocal(){
                localStorage.setItem('eredmeny',document.getElementById('kereses').value)
            }
        </script>
        
        <c:if test="${! empty param.error2}">
        <h4 class="sr-only">
            ${param.error2}
        </h4>        
        </c:if>
         
         <a href="check.jsp?logout=yes">
           Kijelentkezes</a>
    </body>
</html>
        <% } else { %>
        <jsp:forward page="login.jsp"/>
        <% } %>