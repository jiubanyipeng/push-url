<%@ LANGUAGE="VBScript" %>
<!--#include file="Inc/Conn.asp" -->
<%
Id=Session("username")
set Rs = Server.CreateObject("ADODB.recordset")
sql="select * from User where username='"&Id&"'"
rs.open sql,conn,1,1
%>
<HTML><HEAD><TITLE>��Ʒ����</TITLE>
<meta name="Author" content="heweiqun">
<meta name="Contact" content="hdz2008@163.com">
<meta name="Copyright" content="southidc.net">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="Inc/Css.css" rel="stylesheet" type="text/css">
<SCRIPT language=javascript>
function FORM1_onsubmit()
{
if (document.FORM1.Comane.value.length==0)
{
alert("��������ȷ�Ĺ�˾���ơ�");
document.FORM1.Comane.focus();
return false;
}
if (document.FORM1.Somane.value.length==0)
{
alert("��������ȷ���ջ������֡�");
document.FORM1.Somane.focus();
return false;
}
if (document.FORM1.Add.value.length==0)
{
alert("��������ȷ���ջ���ַ��");
document.FORM1.Add.focus();
return false;
}
if (document.FORM1.Zip.value.length==0)
{
alert("��������ȷ���������롣");
document.FORM1.Zip.focus();
return false;
}
if (document.FORM1.Phone.value.length==0)
{
alert("��������ȷ����ϵ�绰��");
document.FORM1.Phone.focus();
return false;
}
if (document.FORM1.Email.value.length==0)
{
alert("��������ȷ����ϵE-mail��");
document.FORM1.Email.focus();
return false;
}
}
</SCRIPT>
</HEAD>
<BODY bgcolor="#D9D9D9" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<DIV align=center>
<br>
<FORM language=javascript name=FORM1 onsubmit="return FORM1_onsubmit()"
action=ment2.asp method=post>
<INPUT type=hidden value=<%=rs("username")%> name=username>
    <TABLE width=95% align="center" cellPadding=4 cellSpacing=1 bgColor=#666666>
      <TBODY>
        <TR vAlign=top bgColor=#999999> 
          <TD height="22"  colSpan=2> <p align="center"><font color="#FFFFFF">�������--(��һ��)�ջ�����Ϣ</font></p></TD>
        </TR>
        <TR bgColor=#eeeeee> 
          <TD  width=259 bgColor=#F0FCFF height=3 align="right"> <p align="center">�� 
              �ţ�</p></TD>
          <TD  width=679 height=3 bgcolor="#F0FCFF"> <p> 
              <%=rs("username")%>
            </p></TD>
        </TR>
        <TR bgColor=#eeeeee> 
          <TD bgColor=#F0FCFF height=3 align="right"><div align="center">��˾���ƣ�</div></TD>
          <TD  width=679 height=3 bgcolor="#F0FCFF"><INPUT maxLength=16 size=13 value="<%=rs("Comane")%>"
name=Comane style="font-size: 14px"></TD>
        </TR>
        <tr> 
          <TD  width=259 bgColor=#F0FCFF height=7 align="right"> <p align="center">�ջ��ˣ�</p></TD>
          <TD  width=679 height=7 bgcolor="#F0FCFF"> <p> 
              <INPUT maxLength=16 size=36 value="<%=rs("Somane")%>"
name=Somane style="font-size: 14px" >
            </p></TD>
        </tr>
        <tr> 
          <TD  width=259 bgColor=#F0FCFF height=7 align="right"> <p align="center">�ջ���ַ��</p></TD>
          <TD  width=679 height=7 bgcolor="#F0FCFF"> <p> 
              <INPUT maxLength=16 size=13 value="<%=rs("Add")%>"
name=Add style="font-size: 14px">
            </p></TD>
        </tr>
        <tr> 
          <TD  width=259 bgColor=#F0FCFF height=7 align="right"> <p align="center">�������룺</p></TD>
          <TD  width=679 height=7 bgcolor="#F0FCFF"> <p> 
              <INPUT maxLength=16 size=23 value="<%=rs("Zip")%>"
name=Zip style="font-size: 14px">
            </p></TD>
        </tr>
        <tr> 
          <TD  width=259 bgColor=#F0FCFF height=3 align="right"> <p align="center">��ϵ�绰��</p></TD>
          <TD  width=679 height=3 bgcolor="#F0FCFF"> <p> 
              <INPUT maxLength=16 size=32 value="<%=rs("Phone")%>"
name=Phone style="font-size: 14px">
            </p></TD>
        </tr>
        <tr> 
          <TD align="right" bgColor=#F0FCFF> <div align="center">��ϵ���棺</div></TD>
          <TD  width=679 bgcolor="#F0FCFF"><INPUT maxLength=16 size=32 value="<%=rs("Fox")%>"
name=Fox style="font-size: 14px"></TD>
        </tr>
        <tr> 
          <TD align="right" bgColor=#F0FCFF><div align="center">��ϵE-mail��</div></TD>
          <TD  width=679 bgcolor="#F0FCFF"><INPUT maxLength=16 size=32 value="<%=rs("Email")%>"
name=Email style="font-size: 14px"></TD>
        </tr>
        <TR vAlign=top bgColor=#F0FCFF> 
          <TD  colSpan=2 > <p align="center">�������޸���������</TD>
        </TR>
        <TR bgColor=#999999> 
          <TD height="22"  colSpan=2> <DIV align=center> 
              <p align="center"> 
                <input type="button" value="��һ��" name="B4" onclick="javascript:window.history.go(-1)">
                &nbsp;&nbsp; 
                <INPUT type=submit size=3 value=��һ�� name=Submit2>
            </DIV></TD>
        </TR>
      </TBODY>
    </TABLE>
</FORM></DIV></BODY></HTML>
<%
rs.close
conn.close
%>