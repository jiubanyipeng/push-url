<%
dim Name
Name=replace(session("Name"),"'","")
if Name="" then
	call CloseConn()
	response.redirect "login.asp"
end if
%>