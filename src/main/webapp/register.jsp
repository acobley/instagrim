<%-- 
    Document   : register.jsp
    Created on : Sep 28, 2014, 6:29:51 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <header>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <table>
                <tr>
                    <th><a  class="footer"><a href="/Instagrim">Home Page</a></th>
                </tr>
                <tr>
                    <th><a href="/Instagrim/Images/majed">Sample Images</a></th>
                </tr>
                <tr>
                    <th><a href="login.jsp">Login</a></th>
                </tr>
            </table>
        </nav>
       <div id = "RegisterForm">
        <article>
            <h3>Sign Up!</h3>
            <form method="POST"  action="Register">
                First Name    <input type="text" name="firstname">
                Second Name    <input type="text" name="secondname">
                Username <input type="text" name="username">
                Password <input type="password" name="password">
                
                <br/>
                <input type="submit" value="Register" class="RegisterBtn"> 
            </form>

        </article>
           </div>
        <footer>
            
        </footer>
    </body>
</html>
