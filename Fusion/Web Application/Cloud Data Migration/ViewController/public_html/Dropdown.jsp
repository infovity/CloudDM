<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://xmlns.oracle.com/adf/faces/rich" prefix="af"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ page import="au.com.bytecode.opencsv.CSVReader"%>
<%@ page import="au.com.bytecode.opencsv.CSVWriter"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.*"%>
<%@ page import="com.infovity.clouddm.model.LoaderTransformation"%>
<script language="javascript">
  
  //<!-- Javascript utility to download the Infovity Input Templates dynamically, based on Entity Selection --> 

function downloadUtil(downloadURL){
        window.open(downloadURL.value)
    return true;
}

</script>

<%        
        String filePath = request.getServletContext().getRealPath("/Entities/LoaderMapping.csv");

//System.out.println("AAAAAA Servlet path" + filePath);

    ArrayList <LoaderTransformation> allTransformations = LoaderTransformation.getAllLoaderTransformations(filePath);


%>
<script>
  function populate(location, infTemplate, fusionTemplate, infovityTemplateURL) {

      //  var s1 = document.getElementById(s1);
      //   var s2 = document.getElementById(s2);
      // alert (location.value + infTemplate);
      infTemplate.innerHTML = "";
      fusionTemplate.innerHTML = "";
      var infTemplateArray;
      var fusTemplateArray;
<% 
      for (LoaderTransformation trans : allTransformations) {
 %> 

          if (location.value == "<%=trans.getEntity()%>") {
              //  alert('inside ' + location.value);
              infTemplateArray = ["<%=trans.getInfovityVersion()%>|<%=trans.getInfovityVersion()%>"];
              fusTemplateArray = ["<%=trans.getFusionVersion()%>|<%=trans.getFusionVersion()%>"];
              infovityTemplateURL.value = "<%=trans.getInfovityTemplFileLocation() + "/" + trans.getInfovityTemplFileName()%>";
          }
 <% 
      }
 %> 
      for (var option in infTemplateArray) {
          var pair = infTemplateArray[option].split("|");
          var newOption = document.createElement("option");
          newOption.value = pair[0];
          newOption.innerHTML = pair[1];
          //     alert(pair[0] + pair[1]);
          infTemplate.options.add(newOption);
      }

      for (var option in fusTemplateArray) {
          var pair = fusTemplateArray[option].split("|");
          var newOption = document.createElement("option");
          newOption.value = pair[0];
          newOption.innerHTML = pair[1];
          fusionTemplate.options.add(newOption);
      }
  };
</script>
<%
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body>
        <form name="selectObjectForm" id="selectObjectForm" action="upload.jsp">
            <table width="400" height="400">
                <tr>
                    <td>Object</td>
                    <td>
                        <select name="loader"
                                onchange="populate(this, document.selectObjectForm.inf_template, document.selectObjectForm.fus_template, document.selectObjectForm.infovityTemplateURL )">
                            <option value=""></option>
                            <%
            for (LoaderTransformation trans : allTransformations) {
                
        %>
                            <option value="<%=trans.getEntity()%>">
                                <%=trans.getEntity()%>
                            </option>
                            <%
             }
        %>
                        </select>
                    </td>
                </tr>
                 
                <tr>
                    <td>Infovity Template</td>
                    <td>
                        <select name="inf_template"></select>
                    </td>
                </tr>
                 
                <tr>
                    <td>Fusion Version</td>
                    <td>
                        <select name="fus_template"></select>
                    </td>
                </tr>
                 
                <tr>
                    <td>Dont have our Template ?</td>
                    <td>
                        <!-- <input type="submit" onclick="window.open('InfovityTemplate/InfovityHCMWork StructuresV1 - Copy.xlsx')"
                           value="Download" name="downloadButton">   -->
                        <input type="button" onclick="window.open(document.selectObjectForm.infovityTemplateURL.value, '_blank')" value="Download"
                               name="downloadButton">
                        <input type="hidden" value="" name="infovityTemplateURL">

                    </td>
                </tr>
            </table>
            <table border="1" width="70" align="right">
                <tr>
                    <td>
                        <input type="submit" name="uploadPage" value="Next"/>
                        <a href="upload.jsp" target="body">Next</a>
                    </td>
                </tr>
            </table>
        </form>
         Wanted to migrate any other object &nbsp;&nbsp;&nbsp; 
        <a href="1stpage.jsp" target="body">Contact US</a>
    </body>
</html>