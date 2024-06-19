#<%-- 
    Document   : login
    Created on : Mar 21, 2023, 12:48:06 AM
    Author     : Rik(^_^)
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function validLogin(){
                if(document.form.userName.value==""){
                    alert("Please enter Login Name.");
                    document.loginform.userName.focus();
                    return false;
                }
                if(document.form.password.value==""){
                    alert("Please enter Password.");
                    document.loginform.password.focus();
                    return false;
                }
                alert("Welcome User");
                return true;
            }
        </script>
    </head>
    <body>
    <center>
        <form name=" form " method =" post" onsubmit ="return validLogin();">
            <table width="" border="0" style="background-color:red;">
                <tr>
                    <td colspan=2 align ="center " style ="font-weight: bold; font-size:20pt;" align=" center">User Login</td>
                </tr>
                <tr>
                    <td style =" font-size:12pt;" align =" center ">Login Name:</td>
                    <td><input type="text" name ="userName" value=""></td>
                </tr>
                <tr>
                    <td style =" font-size:12pt;" align =" center ">Login Password :</td>
                    <td><input type="password" name ="password" value=""></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type ="submit" name="Submit" value="Login"></td>
                    
                </tr>
            </table>
        </form>
    </center>
    </body>
</html>
