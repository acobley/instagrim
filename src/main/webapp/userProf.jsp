<%-- 
    Document   : userProf
    Created on : 21-Oct-2014, 18:11:14
    Author     : Shaun Smith
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
    </head>
    <body>
    <h1>InstaGrim ! </h1>
    <h2>Your world in Black and White</h2>   
        
        
  <% 
      java.util.LinkedList<UserProfile> userInfo = (java.util.LinkedList<UserProfile>) request.getAttribute("userInfo"); 
      
      if (userInfo == null){
      
  %>
   <p> No Profile Found </P>
   <li class="footer"><a href="/Instagrim">Home</a></li>
   
   <% }
      else 
      {
       UserProfile user = (UserProfile) userInfo.get(0);
       String userLog = user.getLogin();
       String firstName = user.getfName();
       String lastName = user.getsName();
      
    %>
       <h2> Profile of: <%=userLog%> </h2> 
       <p>First Name:<%=firstName%> </p>
       <p>Last Name:<%=lastName%> </p>
       
       <% if (user.getUUID() != null) 
       {
           
       }
       %>
        
       <a href="/Instagrim/Image/<%=user.getUUID()%>" ><img src="/Instagrim/Thumb/<%=user.getUUID()%>"></a><br/>
       <li><a href="/Instagrim/editProfInfo/<%=user.getLogin()%>"> Edit your Profile Information </a></li>
      
       <% 
        
       }
       %>
       
       
       
       
      
   
     
     
     
     
   
    
     
     
     
       

     

 
       
 
 
 
 
    </body>
</html>
