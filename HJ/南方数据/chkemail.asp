<%
dim email
email=request.form("email")
if IsValidEmail(email) then
  if request("action")="退订" then
    response.redirect "del_email.asp?email="&email
  else
    response.redirect "add_email.asp?email="&email
  end if
else
  'response.write "无效的电子邮件格式，请按“后退”按钮，重填一个有效的Email"
  response.write"<SCRIPT language=JavaScript>alert('无效的电子邮件格式，请重填一个有效的Email！');"
  response.write"javascript:history.go(-1)</SCRIPT>"
end if


function IsValidEmail(email)

 dim names, name, i, c

 'Check for valid syntax in an email address.

 IsValidEmail = true
 names = Split(email, "@")
 if UBound(names) <> 1 then
   IsValidEmail = false
   exit function
 end if
 for each name in names
   if Len(name) <= 0 then
     IsValidEmail = false
     exit function
   end if
   for i = 1 to Len(name)
     c = Lcase(Mid(name, i, 1))
     if InStr("abcdefghijklmnopqrstuvwxyz_-.", c) <= 0 and not IsNumeric(c) then
       IsValidEmail = false
       exit function
     end if
   next
   if Left(name, 1) = "." or Right(name, 1) = "." then
      IsValidEmail = false
      exit function
   end if
 next
 if InStr(names(1), ".") <= 0 then
   IsValidEmail = false
   exit function
 end if
 i = Len(names(1)) - InStrRev(names(1), ".")
 if i <> 2 and i <> 3 then
   IsValidEmail = false
   exit function
 end if
 if InStr(email, "..") > 0 then
   IsValidEmail = false
 end if

end function
%>