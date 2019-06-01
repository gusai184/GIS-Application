<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<% ResultSet myResultSet =null; %>
<% ResultSet myResultSet1 =null; %>
<% Connection myConnection = null;   %>
<% PreparedStatement myPreparedStatement;   %>
<% String minx,miny,maxx,maxy; %>


<% 
try {
String driver = "org.postgresql.Driver";
String url = "jdbc:postgresql://localhost:5432/texas";
String username = "postgres";
String password = "admin";
String myDataField = null;
myConnection = null;
myPreparedStatement = null;

Class.forName(driver).newInstance();
myConnection = DriverManager.getConnection(url,username,password);
if(request.getParameter("val")!=null){
        String str=request.getParameter("val");   
        String query;
     
     
        if(str.equals( "Counties"))
            query = "select name from counties_texas_gcs order by name";
        
        else if(str.equals("Airport"))                          
            query = "select distinct name from airports_points_gcs order by name";                                 
            
        else if(str.equals("Rivers"))
            query = "select distinct name from majorrivers_dd83 order by name";             
            
        else if(str.equals("Roads"))
            query = "select distinct name from texas_roads_gcs where name LIKE 'US Route ___' union select distinct name from texas_roads_gcs where name LIKE 'US Route __' union select distinct name from texas_roads_gcs where name LIKE 'US Route _' order by name"; 
        else 
        {
            out.println("Error occured : invalid input");
            return;
        }    
        
        myPreparedStatement = myConnection.prepareStatement(query);   
        myResultSet = myPreparedStatement.executeQuery();
        while(myResultSet.next())        
            out.print(myResultSet.getString(1)+":");        
        myConnection.close();
        
}
else
{
    out.println("else part");
}
}
catch(ClassNotFoundException e){e.printStackTrace();}
catch (SQLException ex)
{
out.print("SQLException: "+ex.getMessage());
out.print("SQLState: " + ex.getSQLState());
out.print("VendorError: " + ex.getErrorCode());
}
    
%>
