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
                    <td><a  class="footer"><a href="/Instagrim">Home Page</a></td>
                    <td><a href="/Instagrim/Login">Login</a></td>
                </tr>
            </table>
        </nav>
       <div id = "RegisterForm">
        <article>
            <h3>Sign Up!</h3>
            <form method="POST"  action="Register">
                <input type="text" name="firstname" placeholder="Firstname" pattern=".{1,10}" required title="Enter Firstname">
                <input type="text" name="secondname" placeholder="Surname" pattern=".{1,10}" required title="Enter Surname">
                <input type="text" name="email" placeholder="Email address" pattern=".{1,20}" required title="Enter Email">
                <input type="text" name="username" placeholder="Username" pattern=".{4,10}" required title="4 to 10 characters">
                <input type="password" name="password" placeholder="Password" pattern=".{4,10}" required title="4 to 10 characters">
                
                <br/>
                <input type="submit" value="Register" class="RegisterBtn"> 
            </form>

        </article>
           </div>
        <footer>
            
        </footer>
    </body>
</html>
