<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>uploadData</title>
    </head>
    
    <body>
    
            <h3>File Upload:</h3>
        Select a file to upload: <br />
        <form action="reviewMapping.jsp" method="post"
                                enctype="multipart/form-data">
        <input type="file" name="file" size="50" />
        <br />
        <input type="submit" value="Upload File" />
        </form>

    </body>
</html>