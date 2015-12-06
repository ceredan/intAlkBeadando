<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% if (request.getParameter("login")!=null) 
{
if (
   request.getParameter("userid")!=null &&
  !request.getParameter("userid").equals("") &&
   request.getParameter("password")!=null) { %>
   
   <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/qbxo6s"
        user="root"  password="krosszmotor"/>
   <sql:query var="lekerdezes" 
              dataSource="${snapshot}">
    select * from FELHASZNALOK where userid='${param.userid}' and  
      password='${param.password}'
   </sql:query>
      <c:choose>
        <c:when test="${lekerdezes.rowCount ne 0}">
    <%
        session.setAttribute("validuser", 
        request.getParameter("userid"));
   %> 
        <jsp:forward page="main.jsp"/> 
        </c:when>
        <c:otherwise>
             <jsp:forward page="login.jsp">
        <jsp:param name="error" 
             value="Hibás jelszó/felhasznalói név"/>
    </jsp:forward>   
        </c:otherwise>
      </c:choose> 
<% 
} else {
    %> 
    <jsp:forward page="login.jsp">
        <jsp:param name="error" 
             value="Hiányzó jelszó/felhasználói név"/>
    </jsp:forward>
  <%
  }}
else if (request.getParameter("logout")!=null) {
        session.invalidate();
    %>
     <jsp:forward page="login.jsp"/>  
 <% }
else if (request.getParameter("registration")!=null) {

 if (
   request.getParameter("userid")!=null &&
  !request.getParameter("userid").equals("") &&
   request.getParameter("password")!=null) {
 }
}
%>

