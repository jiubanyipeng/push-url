<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass order by SmallClassID asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    

function AddItem(strFileName){
  document.myform.IncludePic.checked=true;
  document.myform.DefaultPicUrl.value=strFileName;
  document.myform.DefaultPicList.options[document.myform.DefaultPicList.length]=new Option(strFileName,strFileName);
  document.myform.DefaultPicList.selectedIndex+=1;
  if(document.myform.UploadFiles.value==''){
	document.myform.UploadFiles.value=strFileName;
  }
  else{
    document.myform.UploadFiles.value=document.myform.UploadFiles.value+"|"+strFileName;
  }
}

function CheckForm()
{
  if (editor.EditMode.checked==true)
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerText;
  else
	  document.myform.Content.value=editor.HtmlEdit.document.body.innerHTML; 

  if (document.myform.Title.value=="")
  {
    alert("产品名称不能为空！");
	document.myform.Title.focus();
	return false;
  }
  if (document.myform.Product_Id.value=="")
  {
    alert("产品编号不能为空！");
	document.myform.Key.focus();
	return false;
  }
  
  if (document.myform.Content.value=="")
  {
    alert("产品内容不能为空！");
	editor.HtmlEdit.focus();
	return false;
  }
  return true;  
}

</script>
<!-- #include file="Inc/Head.asp" -->

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="862" align="center" valign="top"> <b><br>
      </b>
<form method="POST" name="myform" onSubmit="return CheckForm();" action="ProductSave.asp?action=add" target="_self">
        <table width="620" border="0" align="center" cellpadding="0" cellspacing="0" class="border">
          <tr align="center"> 
            <td class="tdbg"> <table width="100%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
                <tr> 
                  <td class="back_southidc" height="22" colspan="2" align="right" bgcolor="#A4B6D7"><div align="center"><b>添 
                      加 产 品</b> </div></td>
                </tr>
                <tr> 
                  <td width="150" height="22" align="right" bgcolor="#A4B6D7">所属类别：</td>
                  <td bgcolor="#E3E3E3"> <strong> 
                    <%
        sql = "select * from BigClass"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%>
                    <select name="BigClassName" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">
                      <option selected value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                      <%
			dim selclass
		    selclass=rs("BigClassName")
        	rs.movenext
		    do while not rs.eof
			%>
                      <option value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                      <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
                    </select>
                    <select name="SmallClassName">
                      <option value="" selected>不指定小类</option>
                      <%
			sql="select * from SmallClass where BigClassName='" & selclass & "'"
			rs.open sql,conn,1,1
			if not(rs.eof and rs.bof) then
			%>
                      <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                      <% rs.movenext
				do while not rs.eof%>
                      <option value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                      <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
                      <%
			ranNum=int(9*rnd)+10
			iddata=month(now)&day(now)&hour(now)&minute(now)&second(now)&ranNum
			%>
                    </select>
                    </strong></td>
                </tr>
                <tr> 
                  <td width="150" height="22" align="right" bgcolor="#A4B6D7">产品编号：</td>
                  <td bgcolor="#E3E3E3"> <strong> 
                    <input name="Product_Id" type="text"
           id="Product_Id2" value="<%=iddata%>" size="10" maxlength="10">
                    <font color="#FF0000">*产品编号不可以相同，如你不能确定会重复，请勿改动他！</font></strong></td>
                </tr>
                <tr> 
                  <td width="150" height="21" align="right" bgcolor="#A4B6D7">产品名称：</td>
                  <td bgcolor="#E3E3E3"> <strong> 
                    <input name="Title" type="text"
           id="Title2" size="50" maxlength="80">
                    <font color="#FF0000">*</font></strong></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">产品进价：</td>
                  <td bgcolor="#E3E3E3"><strong> 
                    <input name="Buy_price" type="text"
           id="Buy_price" size="10" maxlength="80">
                    </strong></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">产品利润：</td>
                  <td bgcolor="#E3E3E3"><input name="Product_Gain" type="text"
           id="Product_Gain" size="10" maxlength="80"> <font color="#FF0000">*(输入产品的利润,如0.1为10%的利润)</font></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">规格：</td>
                  <td bgcolor="#E3E3E3"><input name="Spec" type="text"
           id="Title" size="20" maxlength="80"></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">单位：</td>
                  <td bgcolor="#E3E3E3"><input name="Unit" type="text"
           id="spec" size="20" maxlength="80"></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">备注：</td>
                  <td bgcolor="#E3E3E3"><input name="Memo" type="text"
           id="unit" size="50" maxlength="80"></td>
                </tr>
                <tr> 
                  <td width="150" height="22" align="right" valign="middle" bgcolor="#A4B6D7">产品说明：</td>
                  <td bgcolor="#E3E3E3"> </td>
                </tr>
                <tr bgcolor="#E3E3E3"> 
                  <td colspan="2" align="right" valign="middle"> <div align="left"> 
                      <textarea name="Content" style="display:none"></textarea>
                      <iframe ID="editor" src="../editor.asp" frameborder=1 scrolling=no width="620" height="405"></iframe>
                    </div></td>
                </tr>
                <tr> 
                  <td align="right" bgcolor="#A4B6D7">首页图片： 
                    <input name="IncludePic" type="hidden" id="IncludePic" value="yes"></td>
                  <td height="96" bgcolor="#E3E3E3"> <input name="DefaultPicUrl" type="text" id="DefaultPicUrl" value="img/nopic.gif" size="40" maxlength="120"> 
                    <br>
                    首页的图片,直接从上传图片中选择： 
                    <select name="DefaultPicList" id="select" onChange="DefaultPicUrl.value=this.value;">
                      <option selected>不指定首页图片</option>
                    </select> <input name="UploadFiles" type="hidden" id="UploadFiles2"> 
                  </td>
                </tr>
                <tr> 
                  <td width="150" height="22" align="right" bgcolor="#A4B6D7">已通过审核：</td>
                  <td bgcolor="#E3E3E3"> <input name="Passed" type="checkbox" id="Passed2" value="yes" checked>
                    是<font color="#0000FF">（如果选中的话将直接发布）</font></td>
                </tr>
                <tr> 
                  <td height="22" align="right" bgcolor="#A4B6D7">首页显示：</td>
                  <td bgcolor="#E3E3E3"><input name="Elite" type="checkbox" id="Passed" value="yes">
                    是<font color="#0000FF">（如果选中的话将在首页做为新产品显示）</font></td>
                </tr>
                <tr> 
                  <td width="150" height="22" align="right" bgcolor="#A4B6D7">录入时间：</td>
                  <td bgcolor="#E3E3E3"> <input name="UpdateTime" type="text" id="UpdateTime2" value="<%=now()%>" maxlength="50">
                    当前时间为：<%=now()%> 注意不要改变格式。</td>
                </tr>
              </table></td>
          </tr>
        </table>
        <div align="center">
          <p> 
            <input
  name="Add" type="submit"  id="Add" value=" 添 加 " onClick="document.myform.action='ProductSave.asp?action=add';document.myform.target='_self';">
            &nbsp; </p>
        </div>
      </form></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->