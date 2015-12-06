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
        <title>Regisztráció</title>
            <link href="bootstrap.css" rel="stylesheet">
            <link href="indexstyle.css" rel="stylesheet">
            <script src="//code.jquery.com/jquery-1.11.3.js"></script>
            <link type="text/css" href="jquery.toastmessage.css" rel="stylesheet"/>
            <script type="text/javascript" src="jquery.js"></script>
            <script>

        function emailValid() {
        $().toastmessage('showToast', {
            text     : "Hibás E-mail cím",
            sticky   : false,
            position : 'top-left',
            type     : 'error',
            close    : null
            });}
        function minimumPass() {
        $().toastmessage('showToast', {
            text     : "Kérlek minimum 4 karakterű jelszót adj meg",
            sticky   : false,
            position : 'top-left',
            type     : 'error',
            close    : null
            });}
        function confirmPass() {
        $().toastmessage('showToast', {
            text     : "A két megadott jelszónak egyeznie kell",
            sticky   : false,
            position : 'top-left',
            type     : 'error',
            close    : null
            });}
        function mailFrom() {
        $().toastmessage('showToast', {
            text     : "Az e-mail cím helyes, de javasoljuk más szolgáltató használatát pl.:Gmail, Hotmail, Yahoo",
            sticky   : false,
            position : 'top-left',
            type     : 'warning',
            close    : null
            });}
        function validateForm() {
          var mailvalid = _("userid")
          var passvalid = _("password");
          var passconfirm = _("name1");
          
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

        }    </script>
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
