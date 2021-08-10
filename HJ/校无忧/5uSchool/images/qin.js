// JavaScript Document
function setTab(name,hover,show,n){
 for(i=1;i<=n;i++){
  var menu=document.getElementById(name+i);
  var con=document.getElementById("con_"+name+i);
  menu.className=i==hover?"hover":"";
  con.style.display=i==show?"block":"none";
 }
}
