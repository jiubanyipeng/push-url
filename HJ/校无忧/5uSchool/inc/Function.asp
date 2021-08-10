<%
'首页
function ShowNotice(Cid,Num)
  dim rsNotice,sqlNotice
  set rsNotice=server.createobject("adodb.recordset")
  sqlNotice="select top "&Num&" * from Article where Cid="&Cid&" order by id desc"
  rsNotice.open sqlNotice,conn,1,1
  if not rsNotice.eof then
  do while not rsNotice.eof
	response.write "<tr height=24><td align=middle width=20>·</td><td align=left width=220><a href=""Article.asp?id="&rsNotice("id")&""" target=""_blank"">"&(left(rsNotice("title"),17))&"</a></li></td></tr>"
  rsNotice.movenext
  loop 
  else
	response.write "<li> 正在更新中... </li>"
  end if
  rsNotice.close
  set rsNotice=nothing
end function

function ShowNews(Cid,Num)
  dim rsNews,sqlNews
  set rsNews=server.createobject("adodb.recordset")
  sqlNews="select top "&Num&" * from Article where Cid="&Cid&" order by id desc"
  rsNews.open sqlNews,conn,1,1
  do while not rsNews.eof
	response.write "<li><span>"&rsNews("addtime")&"</span> <a href=""Article.asp?id="&rsNews("id")&""" target=""_blank"">"&left(rsNews("title"),25)&"</a></li>"
  rsNews.movenext
  loop 
  rsNews.close
  set rsNews=nothing
end function

function NewsPic(Num)
  dim rsNewsPic,sqlNewsPic
  set rsNewsPic=server.createobject("adodb.recordset")
  sqlNewsPic="select top "&Num&" * from Article where pic<>'' order by id desc"
  rsNewsPic.open sqlNewsPic,conn,1,1
  do while not rsNewsPic.eof
	response.write "<li><a href=""Article.asp?id="&rsNewsPic("id")&""" target=""_blank""><img src='"&rsNewsPic("pic")&"' width=""298"" height=""220"" border=""0"" alt='"&rsNewsPic("title")&"'></a></li>"
  rsNewsPic.movenext
  loop 
  rsNewsPic.close
  set rsNewsPic=nothing
end function

function ShowArticle(Cid,Num)
  dim rsArticle,sqlArticle
  set rsArticle=server.createobject("adodb.recordset")
  sqlArticle="select top "&Num&" * from Article where Cid="&Cid&" order by id desc"
  rsArticle.open sqlArticle,conn,1,1
  if not rsArticle.eof then
  do while not rsArticle.eof
	response.write "<li> <a href=""Article.asp?id="&rsArticle("id")&""" target=""_blank"">"&(left(rsArticle("title"),17))&"</a></li>"
  rsArticle.movenext
  loop 
  else
	response.write "<li> 正在更新中... </li>"
  end if
  rsArticle.close
  set rsArticle=nothing
end function

function ShowPic(Cid,Num)
  dim rsPic,sqlPic
  set rsPic=server.createobject("adodb.recordset")
  sqlPic="select top "&Num&" * from School order by id desc"
  rsPic.open sqlPic,conn,1,1
  do while not rsPic.eof
	response.write "<td><a href=""SchoolView.asp?id="&rsPic("id")&""" target=""_blank""><img src='"&rsPic("pic")&"' width=""210"" height=""140"" border=""0"" alt='"&rsPic("title")&"'></a><br><a href=""SchoolView.asp?id="&rsPic("id")&""" class=""style01"" target=""_blank"">"&left(rsPic("title"),16)&"</a></td>"
  rsPic.movenext
  loop 
  rsPic.close
  set rsPic=nothing
end function

function ShowPic2(Cid,Num)
  dim rsPic,sqlPic
  set rsPic=server.createobject("adodb.recordset")
  sqlPic="select top "&Num&" * from Teacher order by id desc"
  rsPic.open sqlPic,conn,1,1
  do while not rsPic.eof
	response.write "<td><a href=""TeacherView.asp?id="&rsPic("id")&""" target=""_blank""><img src='"&rsPic("pic")&"' width=""140"" height=""140"" border=""0"" alt='"&rsPic("title")&"'></a><br><a href=""TeacherView.asp?id="&rsPic("id")&""" class=""style01"" target=""_blank"">"&left(rsPic("title"),16)&"</a></td>"
  rsPic.movenext
  loop 
  rsPic.close
  set rsPic=nothing
end function

function ShowLink(Cid)
  dim rsLink,sqlLink
  set rsLink=server.createobject("adodb.recordset")
  sqlLink="select * from Link where yn="&Cid&" order by id asc"
  rsLink.open sqlLink,conn,1,1
  do while not rsLink.eof
	response.write "<option value="&rsLink("url")&">"&rsLink("title")&"</option>"
  rsLink.movenext
  loop 
  rsLink.close
  set rsLink=nothing
end function

'类别
function ShowSort(tid)
  dim rsSort,sqlSort
  set rsSort=server.createobject("adodb.recordset")
  sqlSort="select * from SClass where tid="&tid&" order by id desc"
  rsSort.open sqlSort,conn,1,1
  do while not rsSort.eof
	response.write "<li> <a href=""Sort.asp?id="&rsSort("id")&""">"&rsSort("cname")&"</a></li>"
  rsSort.movenext
  loop 
  rsSort.close
  set rsSort=nothing
end function

function X5uLocation(cid)
  dim rsLocation,sqlLocation
  set rsLocation=server.createobject("adodb.recordset")
  sqlLocation="select cname from SClass where id="&cid&""
  rsLocation.open sqlLocation,conn,1,2
	response.write ""&rsLocation("cname")&""
  rsLocation.close
  set rsLocation=nothing
end function

function X5uKeywords(cid)
  dim rsKeywords,sqlKeywords
  set rsKeywords=server.createobject("adodb.recordset")
  sqlKeywords="select keywords from SClass where id="&cid&""
  rsKeywords.open sqlKeywords,conn,1,2
	response.write ""&rsKeywords("keywords")&""
  rsKeywords.close
  set rsKeywords=nothing
end function

function X5uDescription(cid)
  dim rsDescription,sqlDescription
  set rsDescription=server.createobject("adodb.recordset")
  sqlDescription="select description from SClass where id="&cid&""
  rsDescription.open sqlDescription,conn,1,2
	response.write ""&rsDescription("description")&""
  rsDescription.close
  set rsDescription=nothing
end function

function SortArticle(cid,Num)
  dim rsSort,sqlSort
  set rsSort=server.createobject("adodb.recordset")
  sqlSort="select * from SClass where tid="&Cid&" order by id desc"
  rsSort.open sqlSort,conn,1,1
  if not rsSort.eof then
    do while not rsSort.eof
	  response.write "<li><b><a href=""Sort.asp?id="&rsSort("id")&""">"&rsSort("cname")&"</a></b> &nbsp;&nbsp;&nbsp;&nbsp;<a href=""Sort.asp?id="&rsSort("id")&""">更多 ></a></li>"
    dim rsSortArticle,sqlSortArticle
    set rsSortArticle=server.createobject("adodb.recordset")
    sqlSortArticle="select top "&Num&" * from Article where Cid="&rsSort("id")&" order by id desc"
    rsSortArticle.open sqlSortArticle,conn,1,1
    if not rsSortArticle.eof then
     do while not rsSortArticle.eof
	  response.write "<li><span>"&rsSortArticle("addtime")&"</span> <a href=""Article.asp?id="&rsSortArticle("id")&""" target=""_blank"">"&left(rsSortArticle("title"),17)&"</a></li>" 
	  rsSortArticle.movenext
     loop 
    else
	  response.write "<li> 正在更新中... </li>"
    end if
    rsSortArticle.close
    set rsSortArticle=nothing
    rsSort.movenext
    loop 
    rsSort.close
    set rsSort=nothing
  else
    set rsSortArticle=server.createobject("adodb.recordset")
    sqlSortArticle="select * from Article where Cid="&Cid&" order by id desc"
    rsSortArticle.open sqlSortArticle,conn,1,1
    if not rsSortArticle.eof then
    proCount=rsSortArticle.recordcount
	rsSortArticle.PageSize=15
     if not IsEmpty(Request("ToPage")) then
	    ToPage=CInt(Request("ToPage"))
		if ToPage>rsSortArticle.PageCount then
		   rsSortArticle.AbsolutePage=rsSortArticle.PageCount
		   intCurPage=rsSortArticle.PageCount
		elseif ToPage<=0 then
		   rsSortArticle.AbsolutePage=1
		   intCurPage=1
		else
		   rsSortArticle.AbsolutePage=ToPage
		   intCurPage=ToPage
		end if
	 else
		rsSortArticle.AbsolutePage=1
		intCurPage=1
	 end if
	 intCurPage=CInt(intCurPage)
	 For i = 1 to rsSortArticle.PageSize
	 if rsSortArticle.eof then     
	 Exit For 
	 end if
	  response.write "<li><span>"&rsSortArticle("addtime")&"</span> <a href=""Article.asp?id="&rsSortArticle("id")&""" target=""_blank"">"&left(rsSortArticle("title"),17)&"</a></li>" 
	rsSortArticle.movenext
    next
'分页显示	
      if intCurPage=1 then 
       response.write "<span>首页 | 上一页 | 第<font color=#ff0000>"&intCurPage&"</font>页 | <a href=""Sort.asp?id="&Cid&"&ToPage="&intCurPage+1&""">下一页</a> | <a href=""Sort.asp?id="&Cid&"&ToPage="&rsSortArticle.PageCount&""">末页</a>"
	  else if intCurPage=rsSortArticle.PageCount then
       response.write "<a href=""Sort.asp?id="&Cid&""">首页</a> | <a href=""Sort.asp?id="&Cid&"&ToPage="&intCurPage-1&""">上一页</a> | 第<font color=#ff0000>"&intCurPage&"</font>页 | 下一页 | 末页"
	  else
	   response.write "<a href=""Sort.asp?id="&Cid&""">首页</a> | <a href=""Sort.asp?id="&Cid&"&ToPage="&intCurPage-1&""">上一页</a> | 第<font color=#ff0000>"&intCurPage&"</font>页 | <a href=""Sort.asp?id="&Cid&"&ToPage="&intCurPage+1&""">下一页</a> | <a href=""Sort.asp?id="&Cid&"&ToPage="&rsSortArticle.PageCount&""">末页</a>"
	  end if
	  end if
       response.write " 共 <font color=#ff0000>"&rsSortArticle.PageCount&"</font> 页 <font color=#ff0000>"&proCount&"</font> 条</span>"
    else
	  response.write "<li> 正在更新中... </li>"
    end if
    rsSortArticle.close
    set rsSortArticle=nothing
'    response.Redirect("List.asp?id="&Cid&"")
  end if
end function
%>     