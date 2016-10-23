<%-- 
    Document   : UsersProfile
    Created on : Oct 23, 2016, 9:20:20 PM
    Author     : Kolo
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
            <h1>InstaGrim ! </h1>
            <h2>Your world in Black and White</h2>
            <h3><a href="#">Hello, <%=request.getAttribute("firstname")%></a></h3> 
        </header>
        
        <nav>
            <table>
                <tr>
            <td><a  class="nav"><a href="/Instagrim">Home Page</a></td>
            <td><a class="nav"><a href="/Instagrim/Upload">Upload</a></td>
                <%
                    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                    if (lg != null) {
                        String UserName = lg.getUsername();
                        if (lg.getlogedin()) {
                        }
                    }
                %>
            <td><a href="/Instagrim/Images/<%=lg.getUsername()%>">My Pics</a></td>
            <td><a class="nav"><a href="/Instagrim/Logout">Logout</a></td>
                </tr>
            </table>
        </nav>
            
    <body>
        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                </tr>
                <tr>
                    <td><%=request.getAttribute("firstname")%></td>
                    <td><%=request.getAttribute("lastname")%></td>
                    <td><%=request.getAttribute("email")%></td>
                </tr>
    </body>
</html>
