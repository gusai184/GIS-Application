<table  bgcolor="#9999ff">
    <tr ><td align="center" colspan="3"><h2>Query Builder</h2></td></tr>
    <tr><th>
         Field 
        <select onchange="sendInfo()" class="form-inline" id = "dd_1" size="5">                         
          <option value="Counties">Counties</option>
          <option value="Airport">Airport</option>
          <option value="Rivers">Rivers</option>
          <option value="Roads">Roads</option>

        </select>
        </th>

         <th align="right"  ><button class="btn btn-primary" onclick="buttonclicked(this.value)" id="equ" class="operator" value=" = " style="visibility:hidden">=</button>
            <button class="btn btn-primary" onclick="buttonclicked(this.value)" id="notequ" value=" != "  style="visibility:hidden">!=</button>
           <button  class="btn btn-primary" onclick="buttonclicked(this.value)" id="pbutton" value ="Population"  style="visibility:hidden">Population</button> 
         </th>



        <th style="visibility:hidden" id="ddlist2">
             Value
            <select class="form-inline" onchange="dd_2changed()" id="dd_2" size="6" visible="false">

            </select>
        </th>
       </tr>
       <tr>
            <td align="center" colspan="4" id = "spinner" style="visibility:hidden">
               <div class="spinner-border text-muted"></div>
                <div class="spinner-border text-primary"></div>
                <div class="spinner-border text-success"></div>
                <div class="spinner-border text-info"></div>
                <div class="spinner-border text-warning"></div>
                <div class="spinner-border text-danger"></div>
                
            </td>
        </tr>       
 
    <tr><td></td> <td align="center"><button class="btn btn-primary" onclick ="buttonclicked(this.value)" value=" AND " style = "visibility:hidden" id="andbutton">AND</button></td><td></td></tr>
    <tr><td></td><td align="right"><input type="number" id="ptb1"  placeholder="min Population"  type="number" style = "visibility:hidden" onkeypress="return isNumberKey(event)" onkeyup="tb2Changed()"/></td>
                <td align = "left"><input type="number" id="ptb2" placeholder="max Pupulation"  type="number" style = "visibility:hidden" onkeypress="return isNumberKey(event)"  onkeyup="tb1Changed()"/></td><td></td></tr>
    <tr><th></th><th id="pgroup" style="visibility:hidden"><button onclick="buttonclicked(this.value)" value=" <= "><=</button><button onclick="buttonclicked(this.value)" value=" >= " >>=</button><button  class="btn btn-primary" onclick="buttonclicked(this.value)" value="Both">Both</button></th><th></th></tr>
    <tr><td align="right">Query</td><td><textarea cols="80" rows="5" id="textbox"></textarea></td></tr>    
    <tr align="center"><td align="center"><button class="btn btn-primary" value="reset" onclick="resetQueryBuilder()">Reset</button></td>
                        <td align="center"><button class="btn btn-primary" value="submit" id="submit" onclick="executeQuery()" disabled="true">Submit</button></td>
    </tr>
    <script src="QueryBuilder.js"></script>	 
    </table>	 