<%-- 
    Document   : commentsPage
    Created on : 26-Oct-2014, 15:01:26
    Author     : Shaun Smith
--%>


<%@page import="java.util.List"%>
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
    
    LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
   
   
     if(lg.getlogedin()==true)
        {   
            String uuid = (String) request.getAttribute("pic");
%>    
            <a href="/Instagrimss/Image/<%=uuid%>"><img src="/Instagrimss/Thumb/<%=uuid%>"></a><br/>
<%
        }
     else {
%>    
            <p> not logged in! </p>
            <li class="footer"><a href="/Instagrimss">Home</a></li>
            
 <%}
     java.util.LinkedList<CommentStore> commentsList = (java.util.LinkedList<CommentStore>) request.getAttribute("commentList");
        if (commentsList == null){
 
 %>   
    <p> no comments </p>
<%
            }else{
                    Iterator<CommentStore> iterator;
                    iterator = commentsList.iterator();
                    
                        while (iterator.hasNext())
                        {
                            CommentStore c = (CommentStore) iterator.next();
                            String user = c.getUser();
                            String comment = c.getComments();
       
    
   
     
%>
                                        
    <p>   
        user:<li><a href="/Instagrimss/Profile/<%=user%>"> <%=user%> </a></li>
        comment:<%=comment%>
    </p>  
  
 <%                               
                        }                       
        }
 %>
 
 
<br/>


    <%
     String uuid = (String) request.getAttribute("pic");
    
    %>
    
                
                    <form method="POST"  action="Comments">
                        <ul>
                    <li>Pic ID: <input type="UUID"  name ="picid"  value ="<%=uuid%>" readonly="readonly"></li>
                    <li>User: <input type="text"  name ="user"  value ="<%=lg.getUsername()%>" readonly="readonly"></li>
                    <li>Comment: <input type="text" name="comment" value ="Enter a comment!"></li>
                        </ul>
                <br/>
                <input type="submit" value="Comment"> 
                    </form>
   </body> 
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrimss">Home</a></li>
            </ul>
        </footer>
</html>
