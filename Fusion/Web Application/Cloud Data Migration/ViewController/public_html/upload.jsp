<!DOCTYPE html>

<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="com.infovity.clouddm.model.LoaderTransformation"%>

<html>
  <head>
    <title>Upload Excel File</title>
    <style type="text/css">
     table
     {
      font-family:Arial;
      font-size:12px;
     }
    </style>
    <script language="JavaScript">
function check()
{
var x=document.getElementById("file").value;
if(x==null || x=="" || x.lastIndexOf(".xls")==-1)
{
alert("Please select the .xls file only");
return false;
}
}
</script>
    
  </head>
  <body><center>
   <table border="1" width="10%">
<tr><th>My PC</th></tr>
<tr><td>Box</td></tr>
<tr><td>FTP</td></tr>
<tr><td>Drop Box</td></tr></table>
<%
        String filePath = request.getServletContext().getRealPath("/Entities/LoaderMapping.csv");

    String selectedObject = request.getParameter("loader");
    String inputFileLocation = "";
    
    if (selectedObject != null) {
        ArrayList <LoaderTransformation> allTransformations = LoaderTransformation.getAllLoaderTransformations(filePath);
              for (LoaderTransformation trans : allTransformations) {
                  if (selectedObject.equals(trans.getEntity())) {
                         session.setAttribute("SelectedLoaderTransformation", trans);
                   }
              }
    } else {
        out.println("Go back to the previous screen and select the loader");
    }
%>
<input type="hidden" name="inputFileLocation" value="<%=inputFileLocation%>"/>

<form action="saveExcel.jsp" method="post" enctype="multipart/form-data" onSubmit="return check();">
    <table>
     <tr><td colspan="2"><center>Upload Excel File</center></td></tr>
     <tr><td>Choose File :</td><td><input type="file" name="file" id="file"/></td></tr>
     <tr><td>&nbsp;</td><td><input type="submit" value="upload"/></td></tr>
    </table>
    </form></center>
  </body>
</html>
