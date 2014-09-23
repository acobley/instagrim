<%-- 
    Document   : upload
    Created on : Sep 22, 2014, 6:31:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>File Upload</h1>
        <form method="POST" enctype="multipart/form-data" action="Image">
  File to upload: <input type="file" name="upfile"><br/>

  <br/>
  <input type="submit" value="Press"> to upload the file!
</form>
    </body>
</html>
