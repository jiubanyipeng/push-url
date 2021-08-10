<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <form name="form1"> <tr>
      <td align="center"> 
        <select name="menu1" onChange="MM_jumpMenu('parent',this,0)" style="width:142px" class="f1">
          <option value="#" selected>请选择其它产品</option>
<%
if BigClassName="" then
  BigClassName=rs("BigClassName")
end if
    
set rslist=Server.CreateObject("Adodb.RecordSet")
sqlist="Select * from product where BigClassName='"&BigClassName&"' order by ID DESC"
rslist.open sqlist,conn,1,1
do while not rslist.eof
if rslist.eof then exit do
%>  
<option value="ProductShow.asp?id=<%=rslist("ID")%>"><%=rslist("Title")%> </option>
<%
rslist.movenext
loop
rslist.close
%>
</select>
      </td>
  </tr></form>
</table>
