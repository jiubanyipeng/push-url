<!--#include file="Inc/SysProduct.asp" -->
<!--#include file="inc/Skin_css.asp"-->
<!-- #include file="Head.asp" -->
<SCRIPT language=javaScript>
function CheckJob()
{
	if (document.form1.Quarters.value.length < 2 || document.form1.Quarters.value.length > 30){
		alert ("��ʾ��\n\nְλ������2-30��֮�䣡");
		document.form1.Quarters.focus();
		return false;
	}
	if (document.form1.Name.value.length < 2 || document.form1.Name.value.length > 16){
		alert ("��ʾ��\n\n����������2-16��֮�䣡");
		document.form1.Name.focus();
		return false;
	}
	if (document.form1.Birthday.value.length!=10){
		alert ("��ʾ��\n\n�������ڸ�ʽ���ԣ�");
		document.form1.Birthday.focus();
		return false;
	}
	if (document.form1.Stature.value.length != 3){
		alert ("��ʾ��\n\n��߸�ʽ���ԣ�");
		document.form1.Stature.focus();
		return false;
	}
	if (document.form1.Residence.value.length < 4 ||document.form1.Residence.value.length > 30 ){
		alert ("��ʾ��\n\n�������ڵ���4-30����֮�䣡");
		document.form1.Residence.focus();
		return false;
	}
	if (document.form1.Edulevel.value.length < 20 ){
		alert ("��ʾ��\n\n��������������20�����ϣ�");
		document.form1.Edulevel.focus();
		return false;
	}
	if (document.form1.Experience.value.length < 20 ){
		alert ("��ʾ��\n\n��������������20�����ϣ�");
		document.form1.Experience.focus();
		return false;
	}
	if (document.form1.Phone.value == "" || document.form1.Phone.value.length < 8){
		alert ("��ʾ��\n\n��ϵ�绰������8���ַ����ϣ�");
		document.form1.Phone.focus();
		return false;
	}

    if(document.form1.Email.value.length!=0)
     {
       if (document.form1.Email.value.charAt(0)=="." ||        
            document.form1.Email.value.charAt(0)=="@"||       
            document.form1.Email.value.indexOf('@', 0) == -1 || 
            document.form1.Email.value.indexOf('.', 0) == -1 || 
            document.form1.Email.value.lastIndexOf("@")==document.form1.Email.value.length-1 || 
            document.form1.Email.value.lastIndexOf(".")==document.form1.Email.value.length-1)
        {
         alert("Email��ַ��ʽ����ȷ��");
         document.form1.Email.focus();
         return false;
         }
      }
    else
     {
      alert("Email����Ϊ�գ�");
      document.form1.Email.focus();
      return false;
      }
 }
</SCRIPT>


<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="5" valign="top" bgcolor="#FFFFFF"></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#FFFFFF"><table width="746" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td class="tdbg_left"  width="190" height="179" valign="top" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�û���½ 
                </td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
              <tr> 
                <td height="10"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td> 
                        <% call ShowUserLogin() %>
                      </td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="5"></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="34" class="title_left">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�˲���Ƹ</td>
              </tr>
              <tr> 
                <td height="20"> <div align="center"><a href="HrDemand.asp">�� 
                    �� �� Ƹ</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
              <tr> 
                <td height="20"> <div align="center"><a href="HrPolicy.asp">�� 
                    �� �� ��</a></div></td>
              </tr>
              <TR> 
                <TD 
                            height=1 colspan="2" 
                            background=img/naSzarym.gif><IMG height=1 src="img/1x1_pix.gif" 
                              width=10></TD>
              </TR>
            </table></td>
          <td width="6"></td>
          <td valign="top"><table Class=border width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="206" valign="top"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td class="title_right" height="32">&nbsp;&nbsp;&nbsp;<img src="Images/smallbook.jpg" width="10" height="10">&nbsp;&nbsp;�� 
                        �� �� Ƹ</td>
                    </tr>
                  </table>
<%
function ChangeChr(str) 
   ChangeChr=replace(replace(replace(replace(str,"<","&lt;"),">","&gt;"),chr(13),"<br>")," ","&nbsp;") 
end function
%>
				  
	<%    
dim action,Quarters
Quarters=trim(request.QueryString("Quarters"))
action=trim(request.QueryString("action"))
	   
if action="add" then   
   Quarters=trim(request.Form("Quarters"))    
   Uname=trim(request.Form("Name"))
   Sex=trim(request.Form("Sex"))
   Marry=trim(request.Form("Marry"))
   Birthday=trim(request.Form("Birthday"))
   Stature=trim(request.Form("Stature"))
   School=trim(request.Form("School"))
   Studydegree=trim(request.Form("Studydegree"))
   Specialty=trim(request.Form("Specialty"))
   Gradyear=trim(request.Form("Gradyear"))	
   Residence=trim(request.Form("Residence"))
   Edulevel=trim(request.Form("Edulevel"))
   Edulevel=trim(ChangeChr(Edulevel))
   Experience=trim(request.Form("Experience"))
   Experience=trim(ChangeChr(Experience))
   Phone=trim(request.Form("Phone"))
   Mobile=trim(request.Form("Mobile"))
   Email=trim(request.Form("Email"))
   Add=trim(request.Form("Add"))
   Postcode=trim(request.Form("Postcode"))
   
   if School="" then
	School=null
   end if
   if Studydegree="" then
	Studydegree=null
   end if
   if Specialty="" then
	Specialty=null
   end if
   if Gradyear="" then
	Gradyear=null
   end if
   if Mobile="" then
	Mobile=null
   end if
   if Add="" then
	Add=null
   end if
   if Postcode="" then
	Postcode=null
   end if
 '=================================   
   set rs=server.createobject("adodb.recordset")
       sql="select * from HrDemandAccept where (id is null)" 
       rs.open sql,conn,1,3
       rs.addnew
	   rs("Quarters")=Quarters
	   rs("name")=Uname	 
	   rs("Sex")=Sex	 
	   rs("Marry")=Marry
	   rs("Birthday")=Birthday
	   rs("Stature")=Stature	
	   rs("School")=School
	   rs("Studydegree")=Studydegree
	   rs("Specialty")=Specialty
	   rs("Gradyear")=Gradyear   
	   rs("Residence")=Residence	  
	   rs("Edulevel")=Edulevel
	   rs("Experience")=Experience
	   rs("Phone")=Phone
	   rs("Mobile")=Mobile
	   rs("Email")=Email
	   rs("Add")=Add
	   rs("Postcode")=Postcode
       rs("Adddate")=date()
       rs.update
	   rs.close
	   set rs=nothing
response.write"<SCRIPT language=JavaScript>alert('���ļ����ύ�ɹ�������������ǻᾡ��֪ͨ������!');"
response.write"javascript:history.go(-2)</SCRIPT>"       
else
%>			  
				  
				  
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <TR vAlign=top > 
                      <TD  width="80%" height="18"> 
					  <form name="form1" method="post" onSubmit="return CheckJob()" action="HrDemandAccept.asp?action=add">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td><div align="center"></div></td>
                            </tr>
                          </table>
                          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
                            <tr> 
                              <%Quarters=request("Quarters")%>
                              <td width="76" bgcolor="#EAE8DB">
<div align="right"><font color=#000066>ְ����λ��&nbsp; </font></div></td>
                              <td width="474"><TABLE width="100%" border=0 cellpadding="2" cellspacing="1">
                                  <TBODY>
                                    <TR> 
                                      <TD width="19%" height="20" 
                                bgColor=#EAE8DB> 
                                        <input   name=Quarters  id=jobname   value="<%=Quarters%>" size="36">
                                        * </TD>
                                    </TR>
                                  </TBODY>
                                </TABLE></td>
                            </tr>
                            <tr> 
                              <td width="76" bgcolor="#f0f3f0">
<div align="right"><font color=#000066>�������ϣ�&nbsp;</font></div></td>
                              <td valign="top"><TABLE width="100%" border=0 cellpadding="2" cellspacing="1">
                                  <TBODY>
                                    <TR> 
                                      <TD width="19%" height="20" align=right 
                                bgColor=#f0f3f0>������</TD>
                                      <TD width="81%" bgColor=#f0f3f0><INPUT  name="Name">
                                        * </TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>�Ա�</TD>
                                      <TD bgColor=#f0f3f0><select id="Sex" name="Sex">
                                          <option value="��" selected>��</option>
                                          <option value="Ů">Ů</option>
                                        </select>
                                        *</TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>����״����</TD>
                                      <TD bgColor=#f0f3f0><SELECT id="Marry"   name="Marry">
                                          <OPTION value="δ��"  selected>δ��</OPTION>
                                          <OPTION  value="�ѻ�">�ѻ�</OPTION>
                                        </SELECT> </TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>�������ڣ�</TD>
                                      <TD bgColor=#f0f3f0><input name="Birthday">
                                        *�������ڣ��磺1978-04-24��</TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>��ߣ�</TD>
                                      <TD bgColor=#f0f3f0><INPUT name="Stature" id="stature" size="15" maxlength="3">
                                        *(cm)���磺�� 178��</TD>
                                    </TR>
                                    <TR>
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>��ҵԺУ��</TD>
                                      <TD bgColor=#f0f3f0><input name="School" size="40"></TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>ѧ����</TD>
                                      <TD bgColor=#f0f3f0><input name="Studydegree" size="30" maxlength="50"></TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>רҵ��</TD>
                                      <TD bgColor=#f0f3f0><input name="Specialty" size="30" maxlength="50"></TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>��ҵʱ�䣺</TD>
                                      <TD bgColor=#f0f3f0><input name="Gradyear" size="16"></TD>
                                    </TR>
                                    <TR> 
                                      <TD align=right bgColor=#f0f3f0 
                                height=20>�����أ�</TD>
                                      <TD bgColor=#f0f3f0><INPUT 
                                name=Residence id=Residence 
                                size=40 maxlength="50">
                                        *</TD>
                                    </TR>
                                  </TBODY>
                                </TABLE></td>
                            </tr>
                            <tr> 
                              <td width="76" bgcolor="#EAE8DB">
<div align="right"><font color=#000066>����������&nbsp;</font></div></td>
                              <td align="center"><TABLE width="100%" height=188 
                                border=0 align=center cellpadding="2" cellspacing="1">
                                  <TBODY>
                                    <TR bgcolor="#EAE8DB"> 
                                      <TD width="16%" 
height=21 bgcolor="#EAE8DB">&nbsp;ѧ��</TD>
                                      <TD width="22%">&nbsp;��ֹʱ��</TD>
                                      <TD width="22%">&nbsp;רҵ����</TD>
                                      <TD width="19%">&nbsp;֤��</TD>
                                      <TD width="21%">&nbsp;ѧУ����</TD>
                                    </TR>
                                    <TR vAlign=top bgColor=#EAE8DB> 
                                      <TD colSpan=5> 
                                        <TEXTAREA id=Edulevel name=Edulevel rows=12 cols=63></TEXTAREA><br>
                                        * �������������Ҫ������ĸ�ʽ�ͷ���ʱ���Ⱥ���д!</TD>
                                    </TR>
                                  </TBODY>
                                </TABLE></td>
                            </tr>
                            <tr> 
                              <td width="76" bgcolor="#f0f3f0">
<div align="right"><font color=#000066>����������&nbsp;</font></div></td>
                              <td><TABLE width="100%" height=188 
                                border=0 align=center cellpadding="2" cellspacing="1">
                                  <TBODY>
                                    <TR bgcolor="#f0f3f0"> 
                                      <TD width="25%" 
height=21>&nbsp;��ֹʱ��</TD>
                                      <TD width="25%">&nbsp;ְλ����</TD>
                                      <TD width="25%">&nbsp;����λ</TD>
                                      <TD width="25%">&nbsp;��������</TD>
                                    </TR>
                                    <TR vAlign=top bgColor=#f0f3f0> 
                                      <TD colSpan=4> 
                                        <TEXTAREA id=Experience name=Experience rows=12 cols=63></TEXTAREA><br>
                                        * �������������Ҫ������ĸ�ʽ�ͷ���ʱ���Ⱥ���д!</TD>
                                    </TR>
                                  </TBODY>
                                </TABLE></td>
                            </tr>
                            <tr> 
                              <td width="76" bgcolor="#EAE8DB">
<div align="right"><font color=#000066>��ϵ��ʽ��&nbsp;</font> </div></td>
                              <td><TABLE width="100%" border=0 cellpadding="2" cellspacing="1">
                                  <TBODY>
                                    <TR> 
                                      <TD height="20" align=right 
                                bgColor=#EAE8DB>��ϵ�绰��</TD>
                                      <TD width="80%" bgcolor="#EAE8DB"> 
                                        <INPUT name=Phone id=Phone size="25">
                                        * </TR>
                                    <TR> 
                                      <TD 
                                height=20 align=right bgColor=#EAE8DB>�ֻ����룺</TD>
                                      <TD bgColor=#EAE8DB>
<INPUT 
                                name=Mobile id=Mobile size="25">
                                      </TD>
                                    </TR>
                                    <TR> 
                                      <TD 
                                height=20 align=right bgColor=#EAE8DB>E-mail��ַ��</TD>
                                      <TD bgColor=#EAE8DB>
<INPUT 
                                name=Email id=Email size="25">
                                        *</TD>
                                    </TR>
                                    <TR> 
                                      <TD 
                                height=20 align=right bgColor=#EAE8DB>ͨ�ŵ�ַ��</TD>
                                      <TD bgColor=#EAE8DB>
<INPUT name=Add id=Add 
                               size=40></TD>
                                    </TR>
                                    <TR> 
                                      <TD 
                                height=20 align=right bgColor=#EAE8DB>�������룺</TD>
                                      <TD bgColor=#EAE8DB>
<INPUT 
                                name=Postcode id=Postcode size=10 maxLength=6></TD>
                                    </TR>
                                  </TBODY>
                                </TABLE></td>
                            </tr>
                            <tr> 
                              <td width="76">&nbsp;</td>
                              <td><div align="center">
                                  <input type="submit" name="submit8" value=" �ύ " >
                                  &nbsp;&nbsp; 
                                  <input type="reset" name="Submit8" value=" ���� ">
                                </div></td>
                            </tr>
                          </table>
                        </form></TD>
                    </TR>
                  </table> 
<% end if %> </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
</BODY></HTML>
