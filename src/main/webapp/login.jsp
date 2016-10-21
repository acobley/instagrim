<%-- 
    Document   : login.jsp
    Created on : Sep 28, 2014, 12:04:14 PM
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
                    <td><a href="/Instagrim">Home Page</a></td>
                    <td><a href="/Instagrim/Register">Register</a></td>
                </tr>
            </table>
        </nav>
       <div id = "LogInForm">
        <article>
            <h3>LOGIN</h3>
            <form method="POST"  action="Login">
                </label> <input type="text" name="username" placeholder="Username" pattern=".{4,10}" required title="Enter Username">
                </label> <input type="password" name="password" placeholder="Password" pattern=".{4,10}" required title="Enter Username">
                
                <br/>
                <input type="submit" value="Login" class="LogInButton"> 
            </form>

        </article>
       </div>
        <footer>
            <ul>
                
            </ul>
        </footer>
    </body>
</html>