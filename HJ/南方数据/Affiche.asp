<!--#include file="Inc/conn.asp"-->
<!--#include file="inc/ubbcode.asp"-->
<%
dim ID
dim sqlAnnounce
dim rsAnnounce
dim AnnounceNum
dim ChannelID
ID=Trim(request("ID"))
sqlAnnounce="select * from affiche where ID=" & Clng(ID)
sqlAnnounce=sqlAnnounce & " order by ID Desc"
Set rsAnnounce= Server.CreateObject("ADODB.Recordset")
rsAnnounce.open sqlAnnounce,conn,1,1
%>
<html>
<head>
<title>本站公告</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
a:active { text-decoration: none; color: #0000FF}
a:hover { text-decoration: none; color: #FF0000}
a:link { text-decoration: none; color: #0000FF}
a:visited { text-decoration: none; color: #990000}
BODY { text-decoration: none; font-size: 12px}
TABLE { text-decoration: none; font-size: 12px}
</style>
<link href="Admin_STYLE.CSS" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<table cellspacing=0 cellpadding=0 border=0 align="center" width="334">
  <tbody>
    <tr> 
      <td colspan=4><img height=9 src="Images/nw_bt.gif" width=332 
    border=0></td>
    </tr>
    <tr> 
      <td width="24" valign="top" background="Images/nw_lt2.gif">&nbsp;</td>
      <td width=286 rowspan="2" valign=top noWrap> <%
if rsAnnounce.bof and rsAnnounce.eof then 
	response.write "<p>&nbsp;&nbsp;没有通告或找不到指定的通告</p>" 
else 
	AnnounceNum=rsAnnounce.recordcount
	dim i
	do while not rsAnnounce.eof
		response.Write "<p align='center'>" & rsAnnounce("title") & "</p><p align='left'>" & ubbcode(dvHTMLEncode(rsAnnounce("Content"))) & "</p><p align='right'>" & "&nbsp;&nbsp;<br>" & FormatDateTime(rsAnnounce("Time"),1) & "</p>"
		rsAnnounce.movenext
		i=i+1
		if i<AnnounceNum then response.write "<hr>"
	loop	
end if  
%> </td>
      <td width="11" rowspan="2">&nbsp;</td>
      <td width="13" rowspan="2" background="Images/nw_rt.gif">&nbsp;</td>
    </tr>
    <tr> 
      <td background="images/nw_lt2.gif">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan=4><img height=9 src="images/nw_bt.gif" width=332 
    border=0></td>
    </tr>
  </tbody>
</table>
</body>
</html>
<%
rsAnnounce.close
set rsAnnounce=nothing
call CloseConn()
%>