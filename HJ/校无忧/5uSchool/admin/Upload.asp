<!--#include file="inc/right.asp"--> 
<!--#include file="UPLOAD.INC"-->
<style type="text/css">
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
<%
dim arr(3)
dim upload,file,formName,formPath,iCount,filename,fileExt,i
set upload=new upload_5xSoft ''建立上传对象
						
formPath="../upload/"     '图片存放的路径：根目录下的ZuoPin文件夹       ''在目录后加(/)

	''列出所有上传了的文件
    for each formName in upload.file
      set file=upload.file(formName)
	  if file.filesize>0 then
      if file.filesize>1000000 then
		response.write "<font size=2>图片大小超过了限制[<a href=# onclick=history.go(-1)>重新上传</a>]</font>"
		response.end
      end if
	  fileExt=lcase(right(file.filename,4))
	  if fileExt<>".jpg" and fileExt<>".gif" and fileExt<>".bmp" and fileExt<>".png" then
         response.write "<font size=2>文件格式限制，仅支持gif,jpg,jpeg,png,bmp[<a href=# onclick=history.go(-1)>请重新上传</a>]</font>"
         response.end
      end if
	end if
    NewName = file.FileName
    fileNew = mid(NewName, InStrRev(NewName, ".") + 1)
			
	filename=year(now)&month(now)&day(now)&hour(now)&minute(now)&second(now)& "." & fileNew
	
    if file.FileSize>0 then         ''如果 FileSize > 0 说明有文件数据
       file.SaveAs Server.mappath(formpath&filename)   ''保存文件
       'response.write file.FilePath&file.FileName&"("&file.FileSize&") => "&formPath&File.FileName&"上传成功<br>"
       response.write "上传成功 <a href=# onclick=history.go(-1)>请返回</a>" 

	   end if
set file=nothing
next
set upload=nothing
Response.Write "<script>parent.add.pic.value='upload/"&FileName&"'</script>"
%>
