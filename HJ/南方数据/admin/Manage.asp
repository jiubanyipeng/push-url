<%@language=vbscript codepage=936 %>
<!--#include file="Conn.asp"-->
<!--#include file="Admin.asp"-->
<!-- #include file="Inc/Head.asp" -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="151" align="center" valign="top"> <table width="150" height="100%" border="0" cellpadding="0" cellspacing="0" class="HeaderTdStyle">
        <tr> 
          <td align="center" valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td align="center">ϵͳ����</td>
              </tr>
            </table>
            <table width="100%" height="90%" border="0" cellpadding="0" cellspacing="0" class="MenuBg">
              <tr> 
                <td align="center" valign="top"><br> <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="16%"><img src="../Img/Left_1.gif" width="28" height="11"></td>
                      <td width="84%" height="20"><font color="#FFFF00">ϵͳ����</font></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_Admin.asp"><font color="#FFFF00">����Ա����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage_backup.asp"><font color="#FFFF00">���ݿⱸ��</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="Manage.asp"><font color="#FFFF00">ϵͳ����</font></a></td>
                    </tr>
                  </table>
                  <table width="90%" border="0" cellpadding="0" cellspacing="0">
                    <tr> 
                      <td width="34%" height="20" align="right"><img src="../Img/Left_1_1.gif" width="29" height="16"></td>
                      <td width="66%" valign="bottom"><a href="UploadFileManage.asp"><font color="#FFFF00">�ϴ��ļ�����</font></a></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td width="525" align="center" valign="top"> 
      <div align="center"><br>
        <br>
        <table width="87%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>�Ϸ�������ҵͨ�ý�վϵͳ V2.0 <br>
              <br>
              �Ϸ�������ҵ��վ����ϵͳ V2.0��������:<br>
              1.�����ļ�����ϵͳ;<br>
              2.������̨��½����;<br>
              3.����ǰ��̨��½ϵͳ��ȫ��;<br>
              4.��̨��½������֤��;<br>
              5.������֯�ṹ�ĺ�̨����;<br>
              6.�������з��ֵ�С����;<br>
              7.������ǰ̨�ͺ�̨�������;<br>
              8.����ҳ��; 
              <p> ʹ��˵��:</p>
              <p>�Ϸ�������ҵ��վ����ϵͳ V2.0<br>
                ��̨��Ҫ�������£�<br>
                һ��ϵͳ��������Ա����������������Ա���޸Ĺ���Ա���룻���ݿⱸ�ݣ�Ϊ��֤�������ݰ�ȫ��ϵͳ���������ݿⱸ�ݹ��ܣ��ϴ��ļ��������������Ӳ�Ʒʱ�ϴ���ͼƬ�������ļ��� 
                <br>
                ������ҵ��Ϣ���������޸���ҵ�ĸ�����Ϣ�����ܡ� <br>
                ������Ʒ������Ʒ��������޸Ĺ�����Ʒ����޸��Լ���Ʒ����ˡ�<br>
                �ġ��������ģ��ɷ������Ӹ����ļ����������ͼ����ĵ����ļ������ء�<br>
                �塢���������鿴��������ϸ��Ϣ���������� <br>
                ������Ա�����鿴�޸�ɾ����Ա���ϣ��������������ܡ������߸���Ա���ţ� <br>
                �ߡ����Ź����ִܷ����С�����ţ�������������Ŀ�����ơ� <br>
                �ˡ����Թ���������Ϣ������ע���Ա�����ԣ�ע���Ա�����Կ����߻ظ���δע���Ա��ʹ�����߷��Ź��ܸ��ڴ𸴡� <br>
                �š��������������޸���ҵ������Ŀ����Ϣ�������޸���ҵ������Ŀ����Ϣ�� <br>
                ʮ���˲Ź��������޸���Ƹ��Ϣ���˲Ų�����Ŀ����ӦƸ���� <br>
                ʮһ��Ӫ�����磺�޸�Ӫ��������Ŀ����Ϣ�� <br>
                ʮ����������������޸��µ��顣 <br>
                ʮ�����ʼ��б������ʼ��б����߷����ʼ��б� <br>
                ʮ�ġ��������ӣ������޸��������ӡ�<br>
                <br>
                ��<br>
                *******************************************************<br>
                *�� �Ϸ�������ҵͨ�ý�վϵͳ V2.0 <br>
                *�� ��ϵ��ʽ��QQ:635495 MSN:jxhwq@hotmail.com E-mail:<a href="mailto:hdz2008@@163.com">hdz2008@163.com</a><br>
                * ��Tel:0791-6274752 8059439 13065161861<br>
                *�� ��ʾǰ̨:<a href="http://china.0791idc.com" target="_blank">http://china.0791idc.com</a> 
                <br>
                *�� ��ʾ��̨:<a href="http://china.0791idc.com/admin" target="_blank">http://china.0791idc.com/admin</a><br>
                *�� �û�����admin�������룺0791idc<br>
                *******************************************************</p>
              </td>
          </tr>
        </table>
      </div></td>
  </tr>
</table>
<!-- #include file="Inc/Foot.asp" -->