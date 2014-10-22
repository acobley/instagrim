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
       
        <h1> hello world </h1>
        
  <% java.util.LinkedList<String> userInfo = (java.util.LinkedList<String>) 
          
        request.getAttribute("userInfo"); 
        String username = userInfo.getFirst();
     
            
  %>
       
   <%=username%>
 
    </body>
</html>
