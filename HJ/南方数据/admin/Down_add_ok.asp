<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!--#include file="Inc/Head.asp" -->
<!--#include file="Inc/Function.asp"-->
<%
title=request("title")
BigClassName=request("BigClassName")
SmallClassName=request("SmallClassName")
	mContent = trim(Request.form("cnWords")) 
	mContent = Replace(mContent,"<script","<sscript") 
	mContent = Replace(mContent,"/script>","/scripts>")
	mContent = Replace(mContent,"/script >","/scripts>")
	mimageNum = Request.form("imageNum")
	firstImageName = trim(Request.form("editFirstImageName"))
System=request("System")
Softclass=request("Softclass")
PhotoUrl=request("PhotoUrl")
DownloadUrl=request("DownloadUrl")
FileSize=request("FileSize")

if PhotoUrl="" then
	PhotoUrl=null
end if

if FileSize="" then
	FileSize=null
end if

set rs=server.createobject("adodb.recordset")
sql="select * from Download where (id is null)"
rs.open sql,conn,1,3
rs.addnew
rs("title")=title
rs("BigClassName")=BigClassName
rs("SmallClassName")=SmallClassName
rs("content")=mcontent
rs("System")=System
rs("Softclass")=Softclass
rs("PhotoUrl")=PhotoUrl
rs("DownloadUrl")=DownloadUrl
rs("FileSize")=FileSize

if mimageNum<>"" then rs("imageNum") = mimageNum 
if firstImageName<>"" then rs("firstImageName") = firstImageName
rs.update
rs.close
set rs=nothing
conn.close  
set conn=nothing
if founderr=true then
  call WriteErrMsg()
else   
  response.write "<script language='javascript'>" & chr(13)
  response.write "alert('下载提交成功！');" & Chr(13)
  response.write "window.document.location.href='Down_Manage.asp';"&Chr(13)
  response.write "</script>" & Chr(13)
  Response.End
end if  
%>
