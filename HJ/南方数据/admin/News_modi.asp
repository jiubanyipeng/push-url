<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<%
if request("no")="modi" then
newsid=request("newsid")
title=request("title")
BigClassName=request("BigClassName")
SmallClassName=request("SmallClassName")
	mContent = trim(Request.form("cnWords")) 
	mContent = Replace(mContent,"<script","<sscript") 
	mContent = Replace(mContent,"/script>","/scripts>")
	mContent = Replace(mContent,"/script >","/scripts>")
	mimageNum = Request.form("imageNum")
	firstImageName = trim(Request.form("editFirstImageName"))
user=request("user")
ok=request("ok")

set rs=server.createobject("adodb.recordset")
sql="select * from NEWS where id="&newsid
rs.open sql,conn,1,3
rs("title")=title
rs("content")=mcontent
rs("user")=user
rs("BigClassName")=BigClassName
rs("SmallClassName")=SmallClassName
if ok<>"" then rs("ok") = ok
if mimageNum<>"" then rs("imageNum") = mimageNum 
if firstImageName<>"" then rs("firstImageName") = firstImageName
rs.update
rs.close
set rs=nothing
response.write "<script language='javascript'>" & chr(13)
		response.write "alert('新闻修改成功！');" & Chr(13)
		response.write "window.document.location.href='News_Manage.asp';"&Chr(13)
		response.write "</script>" & Chr(13)
Response.End
end if%>
<%
dim rs
dim sql
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from SmallClass_New order by SmallClassID asc"
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
    document.addNEWS.SmallClassName.length = 1; 
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.addNEWS.SmallClassName.options[document.addNEWS.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }    
function CheckForm()
{
     document.addNEWS.cnWords.value = document.frames.cnEditBox.getHTML(true);     
     document.addNEWS.imageNum.value = document.frames.cnEditBox.document.all("editImageNum").value;
     document.addNEWS.editFirstImageName.value = document.frames.cnEditBox.document.all("editFirstImageName").value;

	if (document.addNEWS.title.value.length == 0) {
		alert("新闻标题没有填写.");
		document.addNEWS.title.focus();
		return false;
	}
		if (document.addNEWS.user.value.length == 0) {
		alert("新闻发布人没有填写");
		document.addNEWS.user.focus();
		return false;
	}
	return true;
}
</script>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><% 
newsid=request("id")
Set rso=Server.CreateObject("ADODB.RecordSet") 
sql="select * from NEWS where  id="&newsid
rso.Open sql,conn,1,1
if rso.eof and rso.bof then
response.Write("没有记录")
else
%> 
      <table  width="90%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <form name="addNEWS" method="post" action="News_modi.asp?no=modi" onSubmit="return CheckForm();">
          <tr align="center"> 
            <td class="back_southidc" height="30" colspan="2"><font color="#0000FF"><strong>修改新闻</strong></font></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td width="22%" height="24" align="right"><font color="#FF0000">*</font>新闻标题：</td>
            <td width="78%" valign="top">　 
              <input name="title" type="text" class="input" value="<%=rso("title")%>" size="30"></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="24" align="right"><font color="#FF0000">*</font>新闻类别：</td>
            <td valign="top"> 　 
              <%			
        sql = "select * from BigClass_New"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%> <select name="BigClassName" onChange="changelocation(document.addNEWS.BigClassName.options[document.addNEWS.BigClassName.selectedIndex].value)" size="1">
                <%
		    do while not rs.eof
			%>
                <option <% if rs("BigClassName")=rso("BigClassName") then response.Write("selected") end if%> value="<%=trim(rs("BigClassName"))%>"><%=trim(rs("BigClassName"))%></option>
                <%
		        rs.movenext
    	    loop
		end if
        rs.close
			%>
              </select> <select name="SmallClassName">
                <option value="" <%if rso("SmallClassName")="" then response.write "selected"%>>不指定小类</option>
                <%
			sql="select * from SmallClass_New where BigClassName='" & rso("BigClassName") & "'" 
			rs.open sql,conn,1,1 
			if not(rs.eof and rs.bof) then  
				do while not rs.eof %>
                <option <% if rs("SmallClassName")=rso("SmallClassName") then response.Write("selected") end if%> value="<%=rs("SmallClassName")%>"><%=rs("SmallClassName")%></option>
                <%
			    	rs.movenext
				loop
			end if
	        rs.close
			%>
              </select> </td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td align="right" valign="top"><font color="#FF0000">*</font>新闻内容：</td>
            <td valign="top"> 
              <IFRAME STYLE="border: none" NAME=cnEditBox src="EditBox.asp?newsId=<%=newsId%>" WIDTH=100% HEIGHT=330></IFRAME></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="24" align="right"><font color="#FF0000">*</font>发布人：</td>
            <td valign="top">　 
              <input name="user" type="text" class="input" size="30" value="<%=rso("user")%>"> 
            </td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="24" align="right">是否设为首页图片新闻：</td>
            <td>　 
              <input type="radio" value="True" <%if rso("ok")=True then Response.Write "checked"%>  name="ok">
              是 
              <input type="radio" value="False" <%if rso("ok")=False then Response.Write "checked"%> name="ok">
              否 　<font color="#FF0000">选择此项时请注意文章中是否添加有图片 ！</font></td>
          </tr>
          <tr align="center" bgcolor="#ECF5FF"> 
            <td height="35" colspan="2"> 
              <input type="submit" name="Submit" value="提交" class="input"> 
              <input type="hidden" name="newsId" value="<%=newsId%>">
              　 
              <input type="reset" name="Submit2" value="重置" class="input"> 
              <!--获取EditBox的内容-->
              <input name=cnWords type=hidden ID="cnWords" value=""> <input name=imageNum type=hidden ID="imageNum" value="<%=mImageNum%>"> 
              <input name=editFirstImageName type=hidden ID="editFirstImageName" value="">
              <!--获取EditBox的内容-->
            </td>
          </tr>
        </form>
      </table>
      <% End If
rso.close
set rso=nothing
 %></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->