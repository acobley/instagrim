<%-- 
    Document   : editinfo
    Created on : 24-Oct-2014, 15:12:40
    Author     : Shaun Smith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Information</title>
    </head>
    <body>
        <h1>Edit Profile</h1>
        <%
          java.util.LinkedList<UserProfile> userInfo = (java.util.LinkedList<UserProfile>) 
          request.getAttribute("userInfo");      
          LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
          
          if (userInfo != null){
          UserProfile user = (UserProfile) userInfo.get(0);
          
          if(user.getLogin().compareTo(lg.getUsername()) == 0) 
          {
        %>
        
         <form method="POST"  action="editProfInfo">
                <ul>
                    <li>User Name <input type="text" name="username" value = "<%=user.getLogin()%>" readonly="readonly"></li>
                    <li>First Name <input type="text" name="First Name" value = "<%=user.getfName()%>"</li> 
                    <li>Second Name <input type="text" name="Last Name" value = "<%=user.getsName()%>"</li>
                </ul>
                <br/>
                <input type="submit" value="Update"> 
        <% }
          else 
          { %>
          <p> Invalid user </p>
           <% 
           }
           %>
       <% 
          } 
       
       %>

         
        
        
        
    </body>
</html>
