<% String var= null; %>

<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<% ResultSet myResultSet =null; %>
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
String myQuery = "SELECT name FROM counties_texas_gcs order by name";
myConnection = null;
myPreparedStatement = null;

Class.forName(driver).newInstance();
myConnection = DriverManager.getConnection(url,username,password);
myPreparedStatement = myConnection.prepareStatement(myQuery);
myResultSet = myPreparedStatement.executeQuery();
  
%>

   
    <h2>Select County</h2><br>
            
    <select onchange="sendInfo1()" id="drops">
    <%  while(myResultSet.next()){ %>
    <option><%= myResultSet.getString(1)%></option>
    <% } %>
    </select>
    </body>

       
<script>
var request;  
function sendInfo1()  
{  
    var selected_value=document.getElementById('drops').value;
   // alert("before getdetails "+selected_value);
    var url="./getdetails.jsp?val="+selected_value;  

    if(window.XMLHttpRequest){  
        request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
      request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  

    try  
    {  
        request.onreadystatechange=getInfo1;  
        request.open("GET",url,true);  
        request.send();  
    }  
    catch(e)  
    {  
        alert("Unable to connect to server");  
    }  
}  

function getInfo1(){  
    if(request.readyState==4){ 
        if(request.status == 200) {
             val=request.responseText;  
             //alert(val);
            changLatLong(val);           
        }
        else {
           alert("Error during AJAX call. Please try again. Status -" + xmlhttp.status);
        }
    
    }  
}  
 function changLatLong(val) {

        var stg = val;
        var a = stg.split(":");

        var minlon = parseFloat(a[1]);
        var minlat = parseFloat(a[2]);
        var maxlon = parseFloat(a[3]);
        var maxlat = parseFloat(a[4]);

        var extent = [minlon, minlat, maxlon, maxlat];

        map.getView().fit(extent, map.getSize());
}
			
 </script>  
       
<%
    }
catch(ClassNotFoundException e){e.printStackTrace();}
catch (SQLException ex)
{
out.print("SQLException: "+ex.getMessage());
out.print("SQLState: " + ex.getSQLState());
out.print("VendorError: " + ex.getErrorCode());
}
%>
