<%-- 
    Document   : communityprofiles
    Created on : 25-Oct-2014, 16:27:27
    Author     : Shaun Smith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Community Profiles</title>
    </head>
    <body>
        <h1>Community Profiles</h1>
        
        <%                                                                  
         java.util.LinkedList<UserProfile> userList = (java.util.LinkedList<UserProfile>) request.getAttribute("userInfo");
         
         
         if (userList == null)
         {
        
        %>
        <p> No profiles found! </p>
        <% }
         
         else {
            Iterator<UserProfile> iterator;
            iterator = userList.iterator();
            while (iterator.hasNext()) { 
                UserProfile user = (UserProfile) iterator.next();
            
        %>
        <div><a href="/Instagrim/Image/<%=user.getUUID()%>" ><img src="/Instagrim/Thumb/<%=user.getUUID()%>"width ="100" height ="100"></a></li>    
        <a href="/Instagrim/Profile/<%=user.getLogin()%>"> <%=user.getLogin()%>'s Profile </a> </div>
        <br> 
        <br>
        
        <%
         }
         }
        %>
     
       
    </body>
</html>
