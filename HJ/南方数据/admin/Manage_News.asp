<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim strFileName
const MaxPerPage=20
dim totalPut,CurrentPage,TotalPages
dim i,j
dim ArticleID
dim Title
dim sql,rs
dim BigClassName,SmallClassName,SpecialName
dim PurviewChecked
dim strAdmin,arrAdmin
PurviewChecked=false
strFileName="Manage_News.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "&SpecialName=" & SpecialName

BigClassName=Trim(request("BigClassName"))
SmallClassName=Trim(request("SmallClassName"))


if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * from news "
if BigClassName<>"" then
	sql=sql & "where BigClassName='" & BigClassName & "' "
	if SmallClassName<>"" then
		sql=sql & " and SmallClassName='" & SmallClassName & "' "
	end if
end if
sql=sql & " order by id desc"
Set rs= Server.CreateObject("ADODB.Recordset")
rs.open sql,conn,1,1
%>
<SCRIPT language=javascript>
function unselectall()
{
    if(document.del.chkAll.checked){
	document.del.chkAll.checked = document.del.chkAll.checked&0;
    } 	
}

function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.Name != "chkAll")
       e.checked = form.chkAll.checked;
    }
  }
function ConfirmDel()
{
   if(confirm("确定要删除选中的新闻吗？一旦删除将不能恢复！"))
     return true;
   else
     return false;
	 
}

</SCRIPT>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">系统管理</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">系统管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="admin_addinfo.asp">添加新闻内容</a><a href="Manage_Admin.asp"></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_news.asp">管理全部新闻</a><a href="Manage_backup.asp"></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="News_ClassManage.asp">管理新闻类别</a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <b> </b><br>
      <p align="center"><strong>新 闻 资 讯 管 理</strong></p>
      <table width="620" border="0" align="center" cellpadding="5" cellspacing="2" class="border">
        <tr class="title"> 
          <td bgcolor="#C0C0C0" height="25">|&nbsp; 
            <%
dim sqlBigClass,sqlSmallClass,rsBigClass,rsSmallClass,sqlSpecial,rsSpecial
sqlBigClass="select * from BigClass_new"
Set rsBigClass= Server.CreateObject("ADODB.Recordset")
rsBigClass.open sqlBigClass,conn,1,1
if rsBigClass.eof then 
	response.Write("还没有任何栏目，请首先添加栏目。")
end if
do while not rsBigClass.eof
	if rsBigClass("BigClassName")=BigClassName then
		response.Write("<a href='Manage_News.asp?BigClassName=" & rsBigClass("BigClassName") & "'><font color='red'>" & rsBigClass("BigClassName") & "</font></a> | ")
		if session("purview")=3 then
			strAdmin=rsBigClass("Admin")
			if Instr(strAdmin,"|")>0 then
				arrAdmin=split(strAdmin)
				for i=0 to ubound(arrAdmin)
					if trim(arrAdmin(i))=session("admin") then
						PurviewChecked=True
						exit for
					end if
				next
			else
				if trim(strAdmin)=session("Admin") then
					PurviewChecked=True
				end if
			end if
		end if
	else
		response.Write("<a href='Manage_News.asp?BigClassName=" & rsBigClass("BigClassName") & "'>" & rsBigClass("BigClassName") & "</a> | ")
	end if
	rsBigClass.movenext
loop
rsBigClass.close
set rsBigClass=nothing
%>
          </td>
        </tr>
        <%
if BigClassName<>"" then
	sqlSmallClass="select * from SmallClass_new where BigClassName='" & BigClassName & "'"
	Set rsSmallClass= Server.CreateObject("ADODB.Recordset")
	rsSmallClass.open sqlSmallClass,conn,1,1
	if not (rsSmallClass.bof and rsSmallClass.eof) then
		response.write "<tr class='tdbg'><td bgcolor='#C0C0C0'>"
		do while not rsSmallClass.eof
			if rsSmallClass("SmallClassName")=SmallClassName then
				response.Write("&nbsp;<a href='Manage_News.asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'><font color='red'>" & rsSmallClass("SmallClassName") & "</font></a>&nbsp;&nbsp;")
				if session("purview")=4 then
					strAdmin=rsSmallClass("Admin")
					if Instr(strAdmin,"|")>0 then
						arrAdmin=split(strAdmin)
						for i=0 to ubound(arrAdmin)
							if trim(arrAdmin(i))=session("admin") then
								PurviewChecked=True
								exit for
							end if
						next
					else
						if trim(strAdmin)=session("Admin") then
							PurviewChecked=True
						end if
					end if
				end if
			else
				response.Write("&nbsp;<a href='Manage_News.asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'>" & rsSmallClass("SmallClassName") & "</a>&nbsp;&nbsp;")
			end if
			rsSmallClass.movenext
		loop
		response.write "</td></tr>"
	end if
	rsSmallClass.close
	set rsSmallClass=nothing
end if
%>
      </table>
      <form name="del" method="Post" action="News_Del.asp" onsubmit="return ConfirmDel();">
        <table width="620" border="0" cellpadding="0" cellspacing="2">
          <tr> 
            <td height="25" bgcolor="#CCCCCC"><a href="Manage_News.asp">&nbsp;新闻资讯管理</a> 
              &gt;&gt; 
              <%
if request.querystring="" then
	response.write "所有新闻"
else
	if request("Query")<>"" then
		if Title<>"" then
			response.write "名称中含有“<font color=blue>" & Title & "</font>”的产品"
		else
			response.Write("所有新闻")
		end if
 	else
		if BigClassName<>"" then
			response.write "<a href='Manage_News.asp?BigClassName=" & BigClassName & "'>" & BigClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
			if SmallClassName<>"" then
				response.write "<a href='Manage_News.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "'>" & SmallClassName & "</a>"
			else
				response.write "所有小类"
			end if
		end if		
	end if
end if
%>
            </td>
            <td width="150" bgcolor="#CCCCCC">&nbsp;
            <%
  	if rs.eof and rs.bof then
		response.write "共找到 0 条新闻</td></tr></table>"
	else
    	totalPut=rs.recordcount
		if currentpage<1 then
       		currentpage=1
    	end if
    	if (currentpage-1)*MaxPerPage>totalput then
	   		if (totalPut mod MaxPerPage)=0 then
	     		currentpage= totalPut \ MaxPerPage
		  	else
		      	currentpage= totalPut \ MaxPerPage + 1
	   		end if

    	end if
		response.Write "共找到 " & totalPut & " 条新闻"
%>
            </td>
          </tr>
        </table>
        <%		
	    if currentPage=1 then
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,false,"条新闻"
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,false,"条新闻"
        	else
	        	currentPage=1
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,false,"条新闻"
	    	end if
		end if
	end if
%>
        <%  
sub showContent
   	dim i
    i=0
%>
        <table class="border" border="0" cellspacing="2" width="620" cellpadding="0" style="word-break:break-all">
          <tr bgcolor="#C0C0C0" class="title"> 
            <td width="36" height="25" align="center">选中</td>
            <td width="40"  height="25" align="center" bgcolor="#C0C0C0">ID</td>
            <td width="246" align="center" bgcolor="#C0C0C0" >新闻标题</td>
            <td width="81" align="center" bgcolor="#C0C0C0" >所属一级分类</td>
            <td width="76" align="center" bgcolor="#C0C0C0" >所属二级分类</td>
            <td width="57" align="center" >加入时间</td>
            <td width="68" align="center" >操作</td>
          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="36" height="22" align="center" bgcolor="#C0C0C0"> <input name='ID' type='checkbox' onclick="unselectall()" id="ID" value='<%=cstr(rs("ID"))%>'> 
            </td>
            <td width="40" align="center" bgcolor="#E3E3E3"><%=rs("id")%></td>
            <td  bgcolor="#E3E3E3"><a href="../Shownews.asp?ID=<%=rs("id")%>" target="_blank"><%=left(rs("title"),18)%></a></td>
            <td  bgcolor="#E3E3E3"><div align="center"><%=rs("BigClassName")%></div></td>
            <td  bgcolor="#E3E3E3"><div align="center"><%=rs("SmallClassName")%></div></td>
            <td align="center" bgcolor="#E3E3E3"><%= FormatDateTime(rs("infotime"),2) %> </td>
            <td width="68" align="center" bgcolor="#E3E3E3"> <a href="admin_infomodi.asp?ID=<%=rs("id")%>">修改</a> 
              <a href="admin_infodel.asp?ID=<%=rs("ID")%>&Action=Del" onclick="return ConfirmDel();">删除</a> 
            </td>
          </tr>
          <%
	i=i+1
	      if i>=MaxPerPage then exit do
	      rs.movenext
	loop
%>
        </table>
        <table width="620" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="250" height="30"><input name="chkAll" type="checkbox" id="chkAll" onclick=CheckAll(this.form) value="checkbox">
              选中本页显示的所有新闻</td>
            <td><input name="submit" type='submit' value='删除选定的新闻' <%if session("purview")>=3 and session("purview")<=4 and PurviewChecked=False then response.write "disabled"%>> 
              <input name="Action" type="hidden" id="Action" value="Del"></td>
          </tr>
        </table>
        <%
   end sub 
%>
      </form>
      <br> 
      <table width="620" border="0" cellpadding="0" cellspacing="0" class="border">
        <tr class="tdbg">
          <form name="searchsoft" method="get" action="Manage_News.asp">
            <td height="30"> <strong>查找新闻：</strong> 
              <input name="Title" type="text" class=smallInput id="Title3" size="20" maxlength="50"> 
              <input name="Query" type="submit" id="Query" value="查 询">
              &nbsp;&nbsp;请输入新闻名称。如果为空，则查找所有新闻。</td>
          </form>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
rs.close
set rs=nothing  
call CloseConn()
%>