<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
    Author     : Administrator
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
                    <td><a class="nav"><a href="/Instagrim">Home Page</a></td>
                    <td><a class="nav"><a href="/Instagrim/Upload">Upload</a></td>
                    <td><a class="nav"><a href="/Instagrim/Logout">Logout</a></td>
                    <td><a class="nav"><a href="/Instagrim/Profile">Profile Page</a></td>
                </tr> 
            </table>
        </nav>
        
        <article>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
                } else {
                    Iterator<Pic> iterator;
                    iterator = lsPics.iterator();
                    while (iterator.hasNext()) {
                        Pic p = (Pic) iterator.next();

            %>
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img class="grid-item" src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a><br/>
            <%
                    }
                }
            %>
        </article>
        <footer>
            
            <ul>
                
            </ul>
        </footer>
    </body>
</html>
