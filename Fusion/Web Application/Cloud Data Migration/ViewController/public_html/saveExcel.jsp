<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@ page import="com.infovity.clouddm.model.LoaderTransformation"%>


<%
System.out.println("save Excel file Page");
	 
	 String saveFile="";
	 String contentType=request.getContentType();
	 response.setContentType("text/html");
	 PrintWriter pw=response.getWriter();
	 
	 if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0))
		{ 
		DataInputStream in = new DataInputStream(request.getInputStream()); 
		int formDataLength = request.getContentLength(); 
		byte dataBytes[] = new byte[formDataLength]; 
		int byteRead = 0; 
		int totalBytesRead = 0; 
		while(totalBytesRead < formDataLength)
		{ 
		byteRead = in.read(dataBytes, totalBytesRead,formDataLength); 
		totalBytesRead += byteRead;
		} 
		String file = new String(dataBytes);
		//System.out.println("file :"+file);
		saveFile = file.substring(file.indexOf("filename=\"") + 10); 
		saveFile = saveFile.substring(0, saveFile.indexOf("\n")); 
		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\"")); 
		int lastIndex = contentType.lastIndexOf("="); 
		String boundary = contentType.substring(lastIndex + 1,contentType.length()); 
		int pos; 
		pos = file.indexOf("filename=\""); 
		pos = file.indexOf("\n", pos) + 1; 
		pos = file.indexOf("\n", pos) + 1; 
		pos = file.indexOf("\n", pos) + 1; 
		int boundaryLocation = file.indexOf(boundary, pos) - 4; 
		int startPos = ((file.substring(0, pos)).getBytes()).length; 
		int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length; 
		//File ff = new File(saveFile);

                LoaderTransformation trans = (LoaderTransformation) session.getAttribute("SelectedLoaderTransformation");
		
		String inputFileDir = request.getServletContext().getRealPath("") + trans.getInputFileLocation() ;
		System.out.println("file name " + inputFileDir);
                
                trans.setInputFileName(saveFile);
                
                File inputFile = new File(inputFileDir);
                if(!inputFile.exists()) {
                    inputFile.mkdirs();
                } 
                
		FileOutputStream fileOut = new FileOutputStream(inputFileDir + trans.getInputFileName(), false); 
		fileOut.write(dataBytes, startPos, (endPos - startPos)); 
		fileOut.flush(); 
		fileOut.close();
		
		//String filename ="D:/"+saveFile;
		
		//FileOutputStream fileOut1 = new FileOutputStream(filename);   
        //fileOut1.write(dataBytes, startPos, (endPos - startPos));   
        //fileOut1.flush();   
        //fileOut1.close();
		//File f=new File(filename);
		
	   // System.out.println("location :"+f);		
		%>
		<table style='font-family:Arial;font-size:10px' align='center' width='50%' height='30%' border='1'>
		<tr><td>
		<table width='100%' align='center'><tr><td><b>YOU HAVE SUCCESSFULLY SAVE THE FILE INTO FOLLOWING LOCATION</b> 
		 <%=inputFileDir %>
		</td></tr>
		<tr><td>&nbsp;</td></tr><tr><td align='center'>
		<b><a href='javascript: history.back(-1)'>Back</a></b></td></tr></table>
		</td></tr>
		</table>
		
		<%
		}
	 else
	 {
		 %>
		 <table style='font-family:Arial;font-size:12px' align='center'  width='50%' height='30%' border='1'>
	     <tr><td>
	     <table align='center' width='100%'><tr><td><b>THE FILE NOT SAVED.</b> 
	     </td></tr><tr><td>&nbsp;</td></tr><tr><td align='center'>
	     <b><a href='javascript: history.back(-1)'>Back</a></b></td></tr></table>
	     </td></tr>
	     </table>
         <%
	 }
%>    
