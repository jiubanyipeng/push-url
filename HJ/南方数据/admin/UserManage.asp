<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="Inc/Function.asp"-->
<%
dim strFileName
const MaxPerPage=20
dim totalPut,CurrentPage,TotalPages
dim rs, sql
strFileName="UserManage.asp"

if request("page")<>"" then
    currentPage=cint(request("page"))
else
	currentPage=1
end if

Set rs=Server.CreateObject("Adodb.RecordSet")
sql="select * from [User] order by UserID desc"
rs.Open sql,conn,1,1
%>
<script language=javascript>
function ConfirmDel()
{
   if(confirm("ȷ��Ҫɾ�����û���"))
     return true;
   else
     return false;
}
</script>
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="150" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">���ܲ˵�</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">��Ա����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UserManage.asp"><font color="#FFFF00">ע���Ա����</font></a></td>
                    </tr>
                  </table>
                  
                </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top">
	<br>
      <br>
      <br>
      <br>
<%
  	if rs.eof and rs.bof then
		response.write "Ŀǰ���� 0 ��ע���û�"
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
	    if currentPage=1 then
        	showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
        	showContent
        	showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
   	 	else
   	     	if (currentPage-1)*MaxPerPage<totalPut then
         	   	rs.move  (currentPage-1)*MaxPerPage
         		dim bookmark
           		bookmark=rs.bookmark
        		showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
            	showContent
            	showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
        	else
	        	currentPage=1
        		showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
           		showContent
           		showpage strFileName,totalput,MaxPerPage,true,true,"���û�"
	    	end if
		end if
	end if

sub showContent
   	dim i
    i=0
%>
      <table width="550" border="0" align="center" cellpadding="0" cellspacing="2" class="border">
        <tr bgcolor="#C0C0C0" class="title"> 
          <td width="30" height="25" align="center"><strong> ���</strong></td>
          <td width="59" height="25" align="center"><strong> �û���</strong></td>
          <td width="29" height="25" align="center"><strong> �Ա�</strong></td>
          <td width="87" height="25" align="center"><strong>Email</strong></td>
          <td width="185" height="25" align="center"><strong>��˾����</strong></td>
          <td width="39" height="25" align="center"><strong> ״̬</strong></td>
          <td width="104" height="25" align="center" bgcolor="#C0C0C0"><strong> 
            ����</strong></td>
        </tr>
        <%do while not rs.EOF %>
        <tr bgcolor="#E3E3E3" class="tdbg"> 
          <td height="22" align="center"><%=rs("UserID")%></td>
          <td align="center"><%=rs("username")%></td>
          <td align="center"> 
            <%if rs("Sex")=1 then
	    response.write "��"
	  else
	    response.write "Ů"
	  end if%>
          </td>
          <td><a href="Sendmail.asp?email=<%=rs("email")%>"><%=rs("email")%></a></td>
          <td> <%=rs("Comane")%> </td>
          <td align="center"> 
            <%
	  if rs("LockUser")=true then
	  	response.write "������"
	  else
	  	response.write "����"
	  end if
	  %>
          </td>
          <td align="center"><a href="UserModify.asp?UserID=<%=rs("UserID")%>">�޸�</a>&nbsp; 
            <%if rs("LockUser")=False then %>
            <a href="UserLock.asp?Action=Lock&UserID=<%=rs("UserID")%>">����</a> 
            <%else%>
            <a href="UserLock.asp?Action=CancelLock&UserID=<%=rs("UserID")%>">����</a> 
            <%end if%>
            &nbsp;<a href="UserDel.asp?UserID=<%=rs("UserID")%>" onClick="return ConfirmDel();">ɾ��</a></td>
        </tr>
        <%
	i=i+1
	if i>=MaxPerPage then exit do
	rs.movenext
loop
%>
      </table>  
<%
end sub 
%>
    </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
<%
rs.Close
set rs=Nothing
call CloseConn()  
%>