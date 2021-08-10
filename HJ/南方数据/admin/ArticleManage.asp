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
strFileName="ArticleManage.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "&SpecialName=" & SpecialName

Title=Trim(request("Title"))
ArticleID=Request("ArticleID")
BigClassName=Trim(request("BigClassName"))
SmallClassName=Trim(request("SmallClassName"))
SpecialName=trim(request("SpecialName"))

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

sql="select * from Product where ArticleID>0"
if session("purview")>4 then
	sql=sql & " and Editor='" & Session("admin") & "' and Passed=false"
end if
if Title<>"" then
	sql=sql & " and title like '%" & Title & "%' "
end if
if BigClassName<>"" then
	sql=sql & " and BigClassName='" & BigClassName & "' "
	if SmallClassName<>"" then
		sql=sql & " and SmallClassName='" & SmallClassName & "' "
	end if
else
	if SpecialName<>"" then
		sql=sql & " and SpecialName='" & SpecialName & "' "
	end if
end if
sql=sql & " order by articleid desc"
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
   if(confirm("确定要删除选中的产品吗？一旦删除将不能恢复！"))
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
                <td align="center">功能菜单</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">产品管理</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ClassManage.asp"><font color="#FFFF00">产品类别设置</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleManage.asp"><font color="#FFFF00">产品管理</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleAdd.asp"><font color="#FFFF00">添加产品</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleCheck.asp"><font color="#FFFF00">审核产品</font></a></td>
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
      <p align="center"><strong>产 品 管 理</strong></p>
      <table width="620" border="0" align="center" cellpadding="5" cellspacing="2" class="border">
        <tr class="title"> 
          <td bgcolor="#C0C0C0" height="25">|&nbsp; 
            <%
dim sqlBigClass,sqlSmallClass,rsBigClass,rsSmallClass,sqlSpecial,rsSpecial
sqlBigClass="select * from BigClass"
Set rsBigClass= Server.CreateObject("ADODB.Recordset")
rsBigClass.open sqlBigClass,conn,1,1
if rsBigClass.eof then 
	response.Write("还没有任何栏目，请首先添加栏目。")
end if
do while not rsBigClass.eof
	if rsBigClass("BigClassName")=BigClassName then
		response.Write("<a href='ArticleManage.asp?BigClassName=" & rsBigClass("BigClassName") & "'><font color='red'>" & rsBigClass("BigClassName") & "</font></a> | ")
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
		response.Write("<a href='ArticleManage.asp?BigClassName=" & rsBigClass("BigClassName") & "'>" & rsBigClass("BigClassName") & "</a> | ")
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
	sqlSmallClass="select * from SmallClass where BigClassName='" & BigClassName & "'"
	Set rsSmallClass= Server.CreateObject("ADODB.Recordset")
	rsSmallClass.open sqlSmallClass,conn,1,1
	if not (rsSmallClass.bof and rsSmallClass.eof) then
		response.write "<tr class='tdbg'><td bgcolor='#C0C0C0'>"
		do while not rsSmallClass.eof
			if rsSmallClass("SmallClassName")=SmallClassName then
				response.Write("&nbsp;<a href='ArticleManage.asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'><font color='red'>" & rsSmallClass("SmallClassName") & "</font></a>&nbsp;&nbsp;")
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
				response.Write("&nbsp;<a href='ArticleManage.asp?BigClassName=" & rsSmallClass("BigClassName") & "&SmallClassName=" & rsSmallClass("SmallClassName") & "'>" & rsSmallClass("SmallClassName") & "</a>&nbsp;&nbsp;")
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
      <form name="del" method="Post" action="ArticleDel.asp" onsubmit="return ConfirmDel();">
        <table width="620" border="0" cellpadding="0" cellspacing="2">
          <tr> 
            <td height="25" bgcolor="#CCCCCC"><a href="ArticleManage.asp">&nbsp;产品管理</a> 
              &gt;&gt; 
              <%
if request.querystring="" then
	response.write "所有产品"
else
	if request("Query")<>"" then
		if Title<>"" then
			response.write "名称中含有“<font color=blue>" & Title & "</font>”的产品"
		else
			response.Write("所有产品")
		end if
 	else
		if BigClassName<>"" then
			response.write "<a href='ArticleManage.asp?BigClassName=" & BigClassName & "'>" & BigClassName & "</a>&nbsp;&gt;&gt;&nbsp;"
			if SmallClassName<>"" then
				response.write "<a href='ArticleManage.asp?BigClassName=" & BigClassName & "&SmallClassName=" & SmallClassName & "'>" & SmallClassName & "</a>"
			else
				response.write "所有小类"
			end if
		end if
		if SpecialName<>"" then
			response.write "<font color=red>[专题]</font> " & SpecialName
		end if
	end if
end if
%>
            </td>
            <td width="150" bgcolor="#CCCCCC">&nbsp;
            <%
  	if rs.eof and rs.bof then
		response.write "共找到 0 个产品</td></tr></table>"
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
		response.Write "共找到 " & totalPut & " 个产品"
%>
            </td>
          </tr>
        </table>
        <%		
	    if currentPage=1 then
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
        	else
	        	currentPage=1
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,false,"个产品"
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
            <td width="47" height="25" align="center"><strong>选中</strong></td>
            <td width="28"  height="25" align="center" bgcolor="#C0C0C0"><strong>ID</strong></td>
            <td width="82" align="center" bgcolor="#C0C0C0"><strong>产品编号</strong></td>
            <td width="231" align="center" bgcolor="#C0C0C0" ><strong>产品名称</strong></td>
            <td width="68" align="center" ><strong>加入时间</strong></td>
            <td width="68" align="center" ><strong>审核情况</strong></td>
            <td width="80" align="center" ><strong>操作</strong></td>
          </tr>
          <%do while not rs.eof%>
          <tr class="tdbg"> 
            <td width="47" height="22" align="center" bgcolor="#C0C0C0"> <input name='ArticleID' type='checkbox' onclick="unselectall()" id="ArticleID" value='<%=cstr(rs("articleID"))%>'> 
            </td>
            <td width="28" align="center" bgcolor="#E3E3E3"><%=rs("articleid")%></td>
            <td width="82" align="center" bgcolor="#E3E3E3"><%=rs("Product_Id")%></td>
            <td bgcolor="#E3E3E3">&nbsp;<a href="../ArticleShow.asp?ArticleID=<%=rs("articleid")%>" target="_blank"><%=rs("title")%></a></td>
            <td width="68" align="center" bgcolor="#E3E3E3"><%= FormatDateTime(rs("UpdateTime"),2) %></td>
            <td width="68" align="center" bgcolor="#E3E3E3"> 
              <%if rs("Passed")=true then%>
              已审核 
              <%else%>
              <font color="#FF0000">未审核</font> 
              <%end if%>
            </td>
            <td width="80" align="center" bgcolor="#E3E3E3"> 
              <a href="ArticleModify.asp?ArticleID=<%=rs("articleid")%>">修改</a> 
              <a href="ArticleDel.asp?ArticleID=<%=rs("ArticleID")%>&Action=Del" onclick="return ConfirmDel();">删除</a> 
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
              选中本页显示的所有产品</td>
            <td><input name="submit" type='submit' value='删除选定的产品' <%if session("purview")>=3 and session("purview")<=4 and PurviewChecked=False then response.write "disabled"%>> 
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
          <form name="searchsoft" method="get" action="ArticleManage.asp">
            <td height="30"> <strong>查找产品：</strong> 
              <input name="Title" type="text" class=smallInput id="Title3" size="20" maxlength="50"> 
              <input name="Query" type="submit" id="Query" value="查 询">
              &nbsp;&nbsp;请输入产品名称。如果为空，则查找所有产品。</td>
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