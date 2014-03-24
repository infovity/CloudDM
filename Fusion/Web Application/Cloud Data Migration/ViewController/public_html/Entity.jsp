<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://xmlns.oracle.com/adf/faces/rich" prefix="af"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ page import="au.com.bytecode.opencsv.CSVReader"%>
<%@ page import="au.com.bytecode.opencsv.CSVWriter"%>
<%@ page import="com.google.common.collect.ArrayListMultimap"%>
<%@ page import="com.google.common.collect.Multimap"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.*"%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <style type="text/css">
body {
height: 100%;
width: 100%;
padding-left:50px;
margin: 0;
}
</style>
    </head>
    <body>
    <table border="1" width="35%">
  
<%

String filePath = request.getServletContext().getRealPath("/Entities/EntityList.csv");

//System.out.println("AAAAAA Servlet path" + filePath);

CSVReader reader = new CSVReader(new java.io.FileReader(filePath));
    		String [] nextLine;
                HashMap prd = new HashMap();
                int i = 0;
                // create multimap to store key and values
         java.util.Map <String, ArrayList> supportedObjects = new HashMap  <String, ArrayList>  ();
       //  Multimap<String, String> multiMap1 = ArrayListMultimap.create();
            	 reader.readNext();
                while ((nextLine = reader.readNext()) != null  )
                {
               
                //if(nextLine[2].equals("Y"))
                // {
                
                // put values into map
               // multiMap.put(nextLine[3], nextLine[0]);
                               // retrieve and display values
                System.out.println("Fetching Keys and corresponding [Multiple] Values \n");
                String productFamily = nextLine[3];
                System.out.println("productFamily :"+productFamily);
                Boolean prodFamilyExists = supportedObjects.containsKey(productFamily);
                System.out.println("value @"+prodFamilyExists +"and " +productFamily);
                   if  (!prodFamilyExists) {
                    System.out.println("value in =="+prodFamilyExists +"and " +productFamily);
                    supportedObjects.put(nextLine[3],new ArrayList());
                   
                   }
                   ArrayList values = supportedObjects.get(productFamily);
                   values.add(nextLine[0]);
                   System.out.println("values :" +values+ "and" +values.size() );

                }
                // get all the set of keys
                 Set <String> productFamilies = supportedObjects.keySet();
                 // iterate through the key set and display key and values
                 
                 for (String prodFamily : productFamilies) {
                  //if(nextLine[2].equals("Y"))
                // {
               
                 System.out.println("Key = " + prodFamily);
                 //System.out.println("length:" +prodFamily.size() );
                
                 %>
                 <tr><th><%=prodFamily %></th></tr>
                 <%
                  //myStringArray = supportedObjects.get(prodFamily);
                  ArrayList  a1 = supportedObjects.get(prodFamily);
                  for(int k =0;k<a1.size();k++)
                  {
                  System.out.println("K value" +a1.get(k));
                  %>
                  <tr><td><%=a1.get(k)%></td></tr>
                  <%
                  }
                //  } //
                 System.out.println("Values = " + supportedObjects.get(prodFamily) + "\n");
               //  keyvalues[] = supportedObjects.get(prodFamily);
                 
             }
                
                
                System.out.println ("===========================");
		
		
		// Try writing it back out as CSV to the console
		CSVReader reader2 = new CSVReader(new FileReader(filePath));
		List<String[]> allElements = reader2.readAll();
		StringWriter sw = new StringWriter();
		CSVWriter writer = new CSVWriter(sw);
		writer.writeAll(allElements);
		
		System.out.println("\n\nGenerated CSV File:\n\n");
		System.out.println(sw.toString());
    %>
    
    
    
    
    </table>

</body>
</html>