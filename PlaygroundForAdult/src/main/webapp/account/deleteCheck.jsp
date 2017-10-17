<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>어른들의 놀이터 - 어.이.터</title>
<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/resources/js/jquery.cookie.js" ></script>

<style>
body, html { font-size: 100%; 	padding: 0; margin: 0; background:#ffffff; height:100%;}
input  {border-color:#e4e4e4;}
#login {background:url("/resources/images/loginbackground.png"); height: 100%; background-position: center; background-repeat: no-repeat; background-size: cover;}
#logincon {width:942px; height: 100%; margin:0 auto; background-position: center; background-repeat: no-repeat; background-size: cover; background:#ffffff; border-left:1px solid #000000; border-right:1px solid #000000;}
#loginform {width:100%; height:auto; float:left; position:relative; margin-top:150px;}
.logintable {width:283px; height:auto; margin:0 auto; border-collapse:collapse;}
.logintable td {border-collapse:collapse; text-align:center;  font-family:"Nanum Gothic", sans-serif; font-size:14px; }
.logintable td p {font-family:"Nanum Gothic", sans-serif; font-size:14px; color:#4a4945; font-weight:bold;}
.logintable td a {font-family:"Nanum Gothic", sans-serif; font-size:13px; color:#838383; text-align:center;}
.inputbox {width:283px; padding:10px; background:#ededed;  -webkit-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1);-moz-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); border:none; border-radius: 5px;} 
.checkbox { position: relative; right: 3px; top: 2px; background:#ededed;  -webkit-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1);-moz-box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); box-shadow: 0px 0px 10px 0px rgba(128,128,128,1); border:none; border-radius: 5px;}
.paragraph {text-align: center;}
</style>
</head>
<body id="login">
	
	
	<div id="logincon">
	<div id="loginform">
	<img src="/resources/images/loginformlogo.png" alt="logo" style="margin-left:3px;"/>
	
	<div id="pcon" width="100%">
	<p class="paragraph"> 탈퇴시 모든 게임정보<span style="color:red;">(게임머니 포함)</span>가 사라집니다.</p>
	<p class="paragraph"> 삭제된 정보는 다시 되돌릴 수 없습니다.
	<p class="paragraph"> 그래도 탈퇴 하시겠습니까? </p>
	</div>
	</br>
	<div id="buttoncon" width="942px;">
		<a href="/login/deleteMember" style="margin-left: 30%;">
		<img id="deleteOkay" src="/resources/images/btn_yes.png"/></a>
		<a href="/index.jsp"><img id="deleteNo" src="/resources/images/btn_no.png"/></a>
	</div>
	
	</div><!--end loginform-->
	</div><!--end logincon-->
	
	
<script>

</script>	

</body>
</html>