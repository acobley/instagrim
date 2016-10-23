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
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
    </head>
    <body>
        <h1>InstaGrim ! </h1>
        <h2>Your world in Black and White</h2>
        <nav>
            <table>
                <tr>
                <td><a href="/Instagrim">Home Page</a></td>
                <td><a class="nav"><a href="/Instagrim/Profile">Profile Page</a></td>
                </tr>          
            </table>
        </nav>
 
       <div id="UploadForm">
        <article>
            <h3>File Upload</h3>
            <form method="POST" enctype="multipart/form-data" action="Image">
                File to upload: <input type="file" name="upfile"><br/>

                <br/>
                <input type="submit" value="Upload" class="UploadBtn">
            </form>

        </article>
               </div>
        <footer>
            
        </footer>
    </body>
</html>
