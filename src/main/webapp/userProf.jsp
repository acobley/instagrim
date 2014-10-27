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
    <h1>InstaGrim!</h1>
    <h2>Your world in Black and White</h2>   
        
<%
     java.util.LinkedList<UserProfile> userInfo = (java.util.LinkedList<UserProfile>) request.getAttribute("userInfo");
      LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
     if (userInfo == null)
     {
%>   <p> No Profile Found </p>
     <li class="footer"><a href="/Instagrimss">Home</a></li>
<%   } 
     else
      {
       UserProfile user = (UserProfile) userInfo.get(0);
       String userLog = user.getLogin();
       String firstName = user.getfName();
       String lastName = user.getsName();
       String email = user.getEmail();
       String bio = user.getBio();
%>
       <h2>Profile of: <%=userLog%></h2> 
       <p>First Name: <%=firstName%></p>
       <p>Last Name: <%=lastName%></p>
       <p>Email: <%=email%></p>
       <p>Bio: <%=bio%></p>

       <%      if (user.getUUID() == null)
        {
%>       
        <img src="http://www.bensdiscountsupply.com/images/products/detail/black_thumbnail.jpg"width ="100" height ="100"></a>
        <br>
        <br>

<%
        }
             else{
%>
                <a href="/Instagrimss/Image/<%=user.getUUID()%>" ><img src="/Instagrimss/Thumb/<%=user.getUUID()%>"></a><br/>  
                <br>
                <br>
<%              }
                if(lg.getUsername()!= null && user.getLogin().compareTo(lg.getUsername())== 0)
                {
%>                  
                    <li><a href="/Instagrimss/upload.jsp">Edit your profile Picture</a></li>
                    <li><a href="/Instagrimss/Images/<%=user.getLogin()%>">Your Images</a></li>
                    <li><a href="/Instagrimss/editProfInfo/<%=user.getLogin()%>"> Edit your Profile Information </a></li>     
<%       
                }
                    else
                {
%>                
                    <li><a href="/Instagrimss/Images/<%=user.getLogin()%>"><%=user.getLogin()%>'s images</a></li>
                    <p> </p>
<%
                }
      }    
%>
 </body>
<footer>
            <ul>
                <li class="footer"><a href="/Instagrimss">Home</a></li>
                <li>&COPY; Shaun C</li>
            </ul>
</footer>
</html>
