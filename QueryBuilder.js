    var request;  
    function sendInfo()  
    {//1  alert("hi");
        document.getElementById("dd_1").disabled = true;
        document.getElementById("submit").disabled = false;
        var selected_value=document.getElementById('dd_1').value;
        document.getElementById("textbox").value += "[" +selected_value +"]";
        
        if(selected_value == "Counties")
        {            
            document.getElementById("pbutton").style.visibility = "visible";
        }
        
        document.getElementById("equ").style.visibility= 'visible';
        document.getElementById("notequ").style.visibility= 'visible';
        
       
        var url="./getValueFordd_2.jsp?val="+selected_value;  

        if(window.XMLHttpRequest){  
            request=new XMLHttpRequest();  
        }  
        else if(window.ActiveXObject){  
          request=new ActiveXObject("Microsoft.XMLHTTP");  
        }  

        try  
        {  
            
            request.onreadystatechange=getInfo;  
            request.open("GET",url,true);  
            request.send();  
        }  
        catch(e)  
        {  
            alert("Unable to connect to server");  
        }  
    }  

function getInfo(){  
    if(request.readyState==4){ 
        if(request.status == 200) {
            val=request.responseText;  
           // alert(val);
              document.getElementById("spinner").style.visibility = "hidden";
            console.log(val);
            setdd_2Value(val); 
           
        }
        else 
        {
           alert("Error during AJAX call. Please try again. Status -" + request.status);
        }    
    }  
}
var stg;
function setdd_2Value(stg)
{
     var a = stg.split(":");
     var selectbox = document.getElementById("dd_2");
     for(i = selectbox.options.length - 1 ; i >= 0 ; i--)
     {
        selectbox.remove(i);
     }
     
    
     var i;
     for (i = 0; i < a.length-1;i++)
     {
        var option = document.createElement("option");     
        option.text = a[i];
        selectbox.add(option);
     }
}

function dd_2changed()
{
    var len = document.getElementById("dd_1").length;
    if(len != 1)
        document.getElementById("andbutton").style.visibility= 'visible';
    
        
    document.getElementById('submit').disabled = false;
    
    var selected_value=document.getElementById('dd_2').value;   
    var s = document.getElementById("textbox").value;
    
    if(s.charAt(s.length - 3)=="=")
        document.getElementById("textbox").value = s.replace(/]$/, "")  + selected_value + "]";
    else
        document.getElementById("textbox").value = s.replace(/]$/, ",")  + selected_value + "]";
    
   
}
function executeQuery()
{     
    //CLEAR ALL LAYERS
    alert("Query Sumbitted..."); 
    document.getElementById("spinner").style.visibility = "visible";
    var layers = map.getLayers().getArray();               
    for(var i=layers.length-1;i>=0;i--)
        map.removeLayer(layers[i]);
    map.addLayer(untiled);
        
    var selected_value=document.getElementById('dd_2').value;   
    var queries = document.getElementById("textbox").value;
    var query_array = queries.split(" AND ");
    //alert(query_array.length);
    for(var i=0;i<query_array.length;i++)
    {
        //alert(query_array[i]);    
        var s = String(query_array[i]);
        s = s.slice(1,-1);
       // alert(s);
        var token,operator;
        
        if(s.indexOf(" = ") >= 0)
        {
            operator = "=";
            token = s.split(/ = |,/);
        } 
        else if(s.indexOf(" != ")>=0)
        {
            operator = "!=";
            token = s.split(/ != |,/); 
        }
        else if(s.indexOf(" <= ")>=0)
        {
            var count = (s.match(/<=/g) || []).length;
          
            if(count == 2)
            {
                operator = "Between";
                token = s.split(/ <= /);
            }
            else
            {
                operator = "<=";            
                token = s.split(/ <= |,/);
            }
        }
        else if(s.indexOf(" >= ")>=0)
        {
            operator = ">=";
            token = s.split(/ >= |,/);
        }

        console.log(token);
        var filter;
        var filer_query,names="";
        for(var j=1;j<token.length;j++)
        {
            names += "'"+token[j]+"', ";
        }
        names = names.slice(0,-2);

        if(operator=="=")        
        {

                filter = "[name IN ("+names+")]";
                
                if(token[0]=="Roads")
                {
                    var f ="";
                    for(var j=1;j<token.length;j++)
                    {
                        f += " name LIKE '%"+token[j]+"%' or";
                    }
                    f = f.slice(0,-3);

                    filter = "["+f+"]";
                }
                console.log(filter);

        }
        else if(operator=="!=")
        {
                
                filter = "[name not IN ("+names+")]";
                
                 if(token[0]=="Roads")
                {
                    var f ="";
                    for(var j=1;j<token.length;j++)
                    {
                        f += " name NOT LIKE '%"+token[j]+"%' or";
                    }
                    f = f.slice(0,-3);

                    filter = "["+f+"]";
                }
                console.log(filter);

             
        }
        else if(operator == "<=")
        {
                var no = names.slice(1,-1);
                no = Number(no);
                //alert(no);
                filter = "["+s.replace("Population","pop1999")+"]";               
                console.log(filter);
        }
        else if(operator == ">=")
        {
            
                var no = names.slice(1,-1);
                no = Number(no);
                //alert(no);
                filter = "["+s.replace("Population","pop1999")+"]";
                console.log(filter);
                
        }
        else if(operator == "Between")
        {
                var min = Number(token[0]);
                var max = Number(token[2]);
                filter = "[" + "pop1999" + " >= " + min +" AND pop1999" + " <= " + max +"]";
                console.log(filter);
        }

        if(token[0] == "Rivers")
        {        
             var river_layer = new ol.layer.Tile({
              visible: true,
              source: new ol.source.TileWMS({
                url: 'http://localhost:8080/geoserver/texas/wms',
                params: {'FORMAT': format, 
                         'VERSION': '1.1.1',
                         tiled: true,
                      STYLES: '',
                      LAYERS: 'texas:texas_river_layer',
                   tilesOrigin: -106.62978153842352 + "," + 25.83768060315076,
                   'CQL_FILTER': filter
                }
              })
            });

            map.addLayer(river_layer);

        }
        else if(token[0] == "Airport")
        {        
            var airport_layer = new ol.layer.Tile({
              visible: true,
              source: new ol.source.TileWMS({
                url: 'http://localhost:8080/geoserver/texas/wms',
                params: {'FORMAT': format, 
                         'VERSION': '1.1.1',
                         tiled: true,
                      STYLES: '',
                      LAYERS: 'texas:airports_points_gcs',
                   tilesOrigin: -104.837738037109 + "," + 25.8537502288818,
                   'CQL_FILTER':filter
                }
              })
            });
             map.addLayer(airport_layer);
        }
        else if(token[0] == "Roads")
        {
          var road_layer = new ol.layer.Tile({
            visible: true,
            source: new ol.source.TileWMS({
              url: 'http://localhost:8080/geoserver/texas/wms',
              params: {'FORMAT': format, 
                       'VERSION': '1.1.1',
                       tiled: true,
                    STYLES: 'texas:texas_road_style',
                    LAYERS: 'texas:texas_roads_gcs',
                 tilesOrigin: -106.715774536133 + "," + 25.7923145294189,
                 'CQL_FILTER':filter
              }
            })
          });  
          map.addLayer(road_layer);
        }
        if(token[0] == "Counties" || token[1] == "Population" || token[0]=="Population")
        {
            alert("filter is "+filter);
            var countie_layer = new ol.layer.Image({
            source: new ol.source.ImageWMS({
              ratio: 1,
              url: 'http://localhost:8080/geoserver/texas/wms',
              params: {'FORMAT': format,
                       'VERSION': '1.1.1',  
                    STYLES: '',              
                    LAYERS: 'texas:counties_texas_gcs',
                     'CQL_FILTER':filter
              }
            })
            });      
            var layers = map.getLayers().getArray();               
            
            map.removeLayer(untiled);            
            map.getLayers().insertAt(0, countie_layer);

        }   
    }
        document.getElementById("spinner").style.visibility = "hidden";
       
}
       


var both_button = false;
function buttonclicked(x)
{
    var stg = document.getElementById("textbox").value;   
     
    if(x == " AND ")
    {
        var selected_value=document.getElementById('dd_1').value;
        var selected_index= document.getElementById('dd_1').selectedIndex;
        var len = document.getElementById("dd_1").length;
        document.getElementById("textbox").value = stg + " AND ";
        document.getElementById("dd_1").disabled = false;
        document.getElementById("andbutton").style.visibility = 'hidden';
        document.getElementById("ddlist2").style.visibility = 'hidden';
        document.getElementById('submit').disabled = true;
        document.getElementById('dd_1').selectedIndex = -1;
        document.getElementById('dd_1').remove(selected_index);
        document.getElementById("ptb1").style.visibility = 'hidden';
        document.getElementById("ptb2").style.visibility = 'hidden';
       
    } 
    else if(x == " = " || x == " != ")
    {  
        document.getElementById("textbox").value = stg.replace(/]$/, "")  + x + "]";
       
        document.getElementById("ddlist2").style.visibility = 'visible';
        document.getElementById("equ").style.visibility = 'hidden';
        document.getElementById("notequ").style.visibility = 'hidden';
        document.getElementById("pbutton").style.visibility = "hidden";
         document.getElementById('submit').disabled = true;
    }
    else if(x == "Population")
    {
        document.getElementById("pbutton").style.visibility = "hidden";
        document.getElementById("equ").style.visibility = 'hidden';
        document.getElementById("notequ").style.visibility = 'hidden';
        document.getElementById("pgroup").style.visibility = 'visible';
        document.getElementById("textbox").value = document.getElementById("textbox").value.replace("Counties","Population");
        document.getElementById('submit').disabled = true;
    }
    else if(x == " <= ")
    {
        document.getElementById("textbox").value = stg.replace(/]$/, "")  + x + "]";
        document.getElementById("pgroup").style.visibility = "hidden";
        document.getElementById("ptb2").style.visibility = "visible";
        document.getElementById('submit').disabled = true;
    }
    else if(x == " >= ")
    {
        document.getElementById("textbox").value = stg.replace(/]$/, "")  + x + "]";
        document.getElementById("pgroup").style.visibility = "hidden";
        document.getElementById("ptb1").style.visibility = "visible";
        document.getElementById('submit').disabled = true;
    }
    else if(x == "Both")
    {
        //document.getElementById("textbox").value = stg.replace(/]$/, "")  + " Between " + "]";
        document.getElementById("pgroup").style.visibility = "hidden";
        document.getElementById("ptb1").style.visibility = "visible";
        document.getElementById("ptb2").style.visibility = "visible";
        both_button = true;
    }
}

function resetQueryBuilder()
{
    //change visibilty of qyery builder elements
    document.getElementById("ddlist2").style.visibility = 'hidden';
    document.getElementById("equ").style.visibility = 'hidden';
    document.getElementById("notequ").style.visibility = 'hidden';
    document.getElementById("andbutton").style.visibility = 'hidden';
    document.getElementById('ptb1').style.visibility = 'hidden';
    document.getElementById('ptb2').style.visibility = 'hidden';
    document.getElementById('pgroup').style.visibility = 'hidden';
    document.getElementById('dd_1').disabled = false;
    document.getElementById('dd_1').selectedIndex = -1;
    document.getElementById('ptb1').value = "";
    document.getElementById('ptb2').value = "";
    both_button = false;
    var layers = map.getLayers().getArray();               
    for(var i=layers.length-1;i>=0;i--)
        map.removeLayer(layers[i]);
    map.addLayer(untiled);
        
    document.getElementById("textbox").value = "";
    
    var ddl = document.getElementById('dd_1');
    ddl.innerHTML = "";
    var option1 = document.createElement("option");
    var option2 = document.createElement("option");
    var option3 = document.createElement("option");
    var option4 = document.createElement("option");
    option1.text = "Counties";
    option2.text = "Airport";
    option3.text = "Rivers";
    option4.text = "Roads";
    ddl.add(option1);
    ddl.add(option2);
    ddl.add(option3);
    ddl.add(option4);
    return;
};
function tb1Changed(){
    var newvalue;
    var no= document.getElementById('ptb2').value;
   
    var stg = document.getElementById("textbox").value;   
    if(both_button)
    {
         var index = stg.indexOf("Population");
         newvalue = stg.slice(0,index+10) + " <= " + no + "]";
    }
    else{
        var index = stg.indexOf("<=");
        newvalue = stg.slice(0,index+3) + no + "]";
    }
        document.getElementById("textbox").value = newvalue;
     var text = document.getElementById("ptb2").value;   
     if(no=="" || (both_button && text==""))
     {
         document.getElementById("submit").disabled = true;
         document.getElementById("andbutton").style.visibility = "hidden";
     }
     else
     {
         document.getElementById("submit").disabled = false;
         document.getElementById("andbutton").style.visibility = "visible";
     }
    return;
}


function tb2Changed(){
    var no= document.getElementById('ptb1').value;
    console.log(no);
    var stg = document.getElementById("textbox").value;
    var newvalue;
    if(both_button)
    {
         var index = stg.indexOf("Population");
         var poststg = stg.slice(index,stg.length);
         newvalue = "[ "+no + " <= " + poststg;
    }
    else
    {
        var index = stg.indexOf(">=");
        newvalue = stg.slice(0,index+3) + no + "]";
    }
    document.getElementById("textbox").value = newvalue;
    var text = document.getElementById("ptb2").value;
    if(no=="" || (both_button && text==""))
     {
         document.getElementById("submit").disabled = true;
         document.getElementById("andbutton").style.visibility = "hidden";
     }
     else
     {
         document.getElementById("submit").disabled = false;
         document.getElementById("andbutton").style.visibility = "visible";
     }
    return true;
}
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}