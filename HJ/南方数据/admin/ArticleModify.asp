<%@language=vbscript codepage=936 %>
<!--#include file="Admin.asp"-->
<!--#include file="Conn.asp"-->
<!--#include file="../Inc/Ubbcode.asp"-->
<!--#include file="Inc/Function.asp"-->
<!-- #include file="Inc/Head.asp" -->
<body>
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
                      <td width="84%" height="20"><font color="#FFFF00">��Ʒ����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ClassManage.asp"><font color="#FFFF00">��Ʒ�������</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleManage.asp"><font color="#FFFF00">��Ʒ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleAdd.asp"><font color="#FFFF00">��Ӳ�Ʒ</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="ArticleCheck.asp"><font color="#FFFF00">��˲�Ʒ</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="862" align="center" valign="top"> <br>
      <br> <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="9"> <img border="0" src="../../0791idc/Images/top_1.gif" width="59" height="20"></td>
          <td width="731" background="../../0791idc/Images/top_2.gif">��</td>
          <td width="10"> <img border="0" src="../../0791idc/Images/top_3.gif" width="36" height="20"></td>
        </tr>
      </table>
      <table width="600" height="69" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" bordercolorlight="#57801A" bordercolordark="#57801A" style="border-collapse: collapse">
        <tr> 
          <td width="100%" background="../../0791idc/Images/bg1.gif" height="26"> 
            <p align="center">�Բ�������ʵ���ҳ���ð�û���ṩ��Ҫ����õķ�������ϵ���ǣ�</td>
        </tr>
        <tr> 
          <td width="100%" height="41" valign="top"> ����<br>
            ����<br> <br>
            ����ֻҪ��<font color="#FF0000"><strong>�Ϸ�����(<a href="http://www.0791idc.com">http://www.0791idc.com</a>)</strong></font>�����������(��������)��ҵ�ռ�Ŀͻ�����ѻ����ʽ��(�������еĹ���)��������һ֧���������һ���Ŀ����Ŷӣ������˶���л���µİ汾�Ƴ��� 
            <br>
            �����Ϸ�����Ϊ�����˺���ҵ�ṩרҵ��������վ���룬���ṩ�Ĵ��빦��ǿ��ͬʱΪ��������Ҫ�Ĺ��ܣ����������ṩ����ҵ�����У�����ϵͳ����ҵ���������ط���Ϣ�ۣ�����칫ϵͳ��רҵ����ϵͳ��רҵӰ��ϵͳ��רҵ��������ϵͳ������ϵͳ������Ӫ��ϵͳ�����Ϲ���ϵͳ��......<br> 
            <br>
            ����������ʾǰ̨��<a href="http://china.0791idc.com">http://china.0791idc.com</a> 
            <br> <br>
            ����������ʾ��̨��<a href="http://china.0791idc.com/admin">http://china.0791idc.com/admin</a><br> 
            <br>
            �����û�����admin �����룺0791idc<br> <p> �����������ǵ���վ��<a href="http://www.southidc.net">http://www.southidc.net</a> 
              �� <a href="http://www.0791idc.com">http://www.0791idc.com</a></p>
            <p>������ϵ��ʽ:QQ:635495 MSN:jxhwq@hotmail.com 
            <p> ����Email:<a href="mailto:hdz2008@@163.com">hdz2008@@163.com</a> 
              Tel:0791-6274752 8059439��13065161861<br>
              <br>
              �����Ϸ�����Ϊ����������ż�����������ҳ,רҵ�ĳ����ṩ,���ڻ�С� 
            <p><br>
          </td>
        </tr>
      </table>
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#111111" style="border-collapse: collapse">
        <tr> 
          <td width="4"> <img border="0" src="../../0791idc/Images/end_1.gif" width="7" height="17"></td>
          <td width="740" background="../../0791idc/Images/end_2.gif">��</td>
          <td width="6"> <img border="0" src="../../0791idc/Images/end_3.gif" width="7" height="17"></td>
        </tr>
      </table> </td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->
