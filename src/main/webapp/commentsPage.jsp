<%-- 
    Document   : commentsPage
    Created on : 26-Oct-2014, 15:01:26
    Author     : Shaun Smith
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Instagrim</h1>
        <h2>Comments</h2>
        
<% 
    java.util.LinkedList<Pic> commentsList = (java.util.LinkedList<Pic>) request.getAttribute("commentList");
    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
   
    if (commentsList == null)
    {
%>
<p> no image found </p>
<li class="footer"><a href="/Instagrim">Home</a></li>

<%
    }
    else
    {   
     Pic picComments = (Pic) commentsList.get(0);

%>    
<a href="/Instagrim/Image/<%=picComments.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=picComments.getSUUID()%>"></a><br/>
<%
    
    Set<String> comments = picComments.getComments();
    Iterator<String> iterator = comments.iterator();
    while (iterator.hasNext())
    {
        String comment = iterator.next();
%>
     <p><%=comment%></p>
<%
    }
    
%>
<br/>
<form method="POST"  action="Comments">
                <ul>
                    <li>Pic ID: <input type="UUID"  name ="picid"  value ="<%=picComments.getSUUID()%>" readonly="readonly"></li>
                    <li>Comment: <input type="text" name="comment" value ="Enter a comment!"></li>
                </ul>
                <br/>
                <input type="submit" value="Comment"> 
</form>
<%
    }
%>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </body>
</html>
