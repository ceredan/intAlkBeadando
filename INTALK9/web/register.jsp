<%-- 
    Author     : csoport 4
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regisztráció</title>
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/indexstyle.css" rel="stylesheet">
            <script src="//code.jquery.com/jquery-1.11.3.js"></script>
            <link type="text/css" href="css/jquery.toastmessage.css" rel="stylesheet"/>
            <script type="text/javascript" src="js/jquery.js"></script>
            <script>
        function minimumPass() {
        $().toastmessage('showToast', {
            text     : "Kérlek minimum 4 karakterű jelszót adj meg",
            sticky   : false,
            position : 'top-left',
            type     : 'error',
            close    : null
            });}
        function validateForm() {
          var passvalid = _("password");
          
          if (passvalid.value.length < 4) 
          {
            minimumPass();
          }
          else {
             _("registr").submit();
          }        
        }
        function _(e){
          return document.getElementById(e);

        }    
            </script>
    </head>
    <body>    
        <form method="post" id="registr" class="form-signin" action="registr.jsp">
            <h2 class="form-signin-heading">Kérem adja meg a megfelelő adatokat a regisztárcióhoz!</h2>
            <input type="text" id="userid" name="userid" class="form-control" placeholder="Felhasználói név" ><br/>
            <input type="password" id="password" name="password" class="form-control" placeholder="Jelszó"><br/>
            <input type="text" name="name1" id="name1" placeholder="Teljes név" class="form-control"><br/>            
            <input type="button"
                   name="registration" onclick="validateForm()" class="btn btn-lg btn-info btn-block" 
                   value="Regisztráció"/>   
        </form>
    </body>
</html>
