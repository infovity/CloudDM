<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.io.IOException"%>
<%@ page import = "java.io.InputStream"%>
<%@ page import = "java.util.Enumeration"%>
<%@ page import = "java.util.Properties"%>
<%@ page import = "java.io.FileInputStream"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    </head>
    <body><center>
<table border="1">
<tr>
<th>Infovity Template</th>
<th>Fusion Template*</th>
</tr>
<%

Properties prop = new Properties();
	InputStream input = null;
 
	try {
 
		String filename = "C:\\Transform\\Mapping.txt";
                // FileInputStream filename = new FileInputStream("C:\\Transform\\Mapping.properties");
                //String filename = request.getServletContext().getRealPath("/Transform/Mapping.properties");
               // InputStream filename = this.getClass().getResourceAsStream("/Entities/Mapping.properties");
		prop.load(new FileInputStream(filename));
                
                /*
                input = getClass().getClassLoader().getResourceAsStream(filename);
		if (input == null) {
			System.out.println("Sorry, unable to find " + filename);
                        
			return;
		}

		prop.load(input);
  */
		Enumeration<?> e = prop.propertyNames();
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			String value = prop.getProperty(key);
                        //String key1 = key.replace("$out.0.","" );
                        //String value1 = value.replace("$in.0.","");
                        //String value2 = value1.replace(";","");
			System.out.println("Key : " + key  + ", Value : " + value);
                        //String str = "$out.0.Midpoint";
                        
                        int n = key.indexOf(".0.");
                        int k = value.indexOf(".0.");
                        String keytrim = key.substring(n+3);
                        if( k < 0 ){
                        String valuetrim = value.replace(";","");
                        %>
                     <tr><td><%=valuetrim.replace("'","")%></td><td><%=keytrim%></td></tr>
                     <%
                              //System.out.print("This is if statement");
                           }
                      else     
                      {
                        String valuetrim = value.substring(k+3);
                        String valuetrim1 = valuetrim.replace(";","");
                       // String res = str.substring(2);
                       // System.out.println("kkkkk:" +value.indexOf(".0."));
                        //System.out.println("keytrim:" +keytrim);
                       // System.out.println("valuetrim:" +valuetrim);
                       // System.out.println("Key1 : " + key1.replace("$out.0."," " ) + ", Value1 : " + value1.replace("$in.0.","") );
                     %>
                     <tr><td><%=valuetrim1.replace("'","") %></td><td><%=keytrim%></td></tr>
                     <%
                     }
		}
 
	} catch (IOException ex) {
		ex.printStackTrace();
	} finally {
		if (input != null) {
			try {
				input.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
 
  
 

%>

</table>
</center>
<br><br><br><br><br>
<center><a href="confirmation.jsp"><input type="button" value="Next" name="nextbut" width="200" height="200"/></a></center>
<center>Wanted to modify the mapping   <a href="confirmation.jsp" target="body">Contact Us</a></center>
</body>
</html>