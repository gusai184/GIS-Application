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
        //out.println("<html>sss"+str+"</html>");
        String query = "select * from counties_texas_gcs where name = ? ";                     
        myPreparedStatement = myConnection.prepareStatement(query);
        myPreparedStatement.setString(1,str);
        myResultSet = myPreparedStatement.executeQuery();
        myResultSet.next();
        minx = myResultSet.getString("minx");
        miny = myResultSet.getString("miny");
        maxx = myResultSet.getString("maxx");
        maxy = myResultSet.getString("maxy");
        out.print(str+":"+minx+":"+miny+":"+maxx+":"+maxy);       
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
