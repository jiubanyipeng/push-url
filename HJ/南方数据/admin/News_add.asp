<%@language=vbscript codepage=936 %>
<!--#include file="conn.asp"-->
<!--#include file="admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
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
    <td align="center" valign="top">
	<table width="90%" border="0" cellpadding="2" cellspacing="1" class="table_southidc">
        <form name="addNEWS" method="post" action="News_save.asp" onSubmit="return CheckForm();">
          <tr> 
            <td class="back_southidc" height="30" colspan="2" align="center">增加新闻</td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td width="100" height="25"><font color="#FF0000">*</font>新闻标题：</td>
            <td width="400"> 
              <input name="title" type="text" class="input" size="30"></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="25"><font color="#FF0000">*</font>新闻类别：</td>
            <td> 
              <%		
        sql = "select * from BigClass_New"
        rs.open sql,conn,1,1
		if rs.eof and rs.bof then
			response.write "请先添加栏目。"
		else
		%> <select name="BigClassName" onChange="changelocation(document.addNEWS.BigClassName.options[document.addNEWS.BigClassName.selectedIndex].value)" size="1">
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
              </select> <select name="SmallClassName">
                <option value="" selected>不指定小类</option>
                <%
			sql="select * from SmallClass_New where BigClassName='" & selclass & "'"
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
              </select></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="25" valign="top"><font color="#FF0000">*</font>新闻内容：</td>
            <td valign="top"> 
              <IFRAME STYLE="border: none" NAME=cnEditBox src="EditBox.asp" WIDTH=500 HEIGHT=400></IFRAME></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="25"><font color="#FF0000">*</font>发布人：</td>
            <td> 
              <input name="user" type="text" class="input" size="30"></td>
          </tr>
          <tr bgcolor="#ECF5FF"> 
            <td height="25">是否设为首页图片新闻：</td>
            <td> 
              <input type="radio" name="ok" value="true">
              是 
              <input name="ok" type="radio" value="false" checked>
              否 　<font color="#FF0000">选择此项时请注意文章中是否添加有图片 ！</font></td>
          </tr>
          <tr> 
            <td height="30" colspan="2" align="center" bgcolor="#ECF5FF"> 
              <input type="submit" name="Submit" value="提交" class="input">
              　 
              <input type="reset" name="Submit2" value="重置" class="input"> 
              <!--获取EditBox的内容-->
              <input name=cnWords type=hidden ID="cnWords" value=""> <input name=imageNum type=hidden ID="imageNum" value="<%=mImageNum%>"> 
              <input name=editFirstImageName type=hidden ID="editFirstImageName" value=""> 
              <!--获取EditBox的内容-->
            </td>
          </tr>
        </form>
        <tr> 
          <td height="30" colspan="2" align="center">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->