<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>   
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <table>
                <tr>
                    <td><a href="/Instagrim/Upload">Upload </a></td>
                    <%
                        
                        LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                        if (lg != null) {
                            String UserName = lg.getUsername();
                            if (lg.getlogedin()) {
                    %>

                    <td><a href="/Instagrim/Images/<%=lg.getUsername()%>">My Pics</a></td>
                    <%}
                            }else{
                                %>
                                
                    <td><a href="/Instagrim/Register">Register</a></td>
                    <td><a href="/Instagrim/Login">Login</a></td>
                <%
                                        
                            
                    }%>
                </tr>
            </table>
        </nav>
        <footer>
            <ul>
               
            </ul>
        </footer>
                <div class="grid"> 
  
                    <img src = "http://lorempixel.com/300/250/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/200/100/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/350/200/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/200/300/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/400/500/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/300/300/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/310/420/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/430/500/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/200/200/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/300/300/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/120/200/" alt="image" class="grid-item">
                    <img src = "http://lorempixel.com/320/120/" alt="image" class="grid-item">
                    </div>
                <script src ="FrontPage.js">
                    </script>
                    
                <script>
                    window.onload = () => {
                        let gridElement = document.querySelector(".grid");
                        window.ms = new Masonry(gridElement, {
                            "itemSelector": '.grid-item',
                            "percentPosition": true
                        })
                        ms.masonry();
                    };
                    </script>
    </body>
</html>
