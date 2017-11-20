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
</style>
</head>
<body id="login">
	
	
	<div id="logincon">
	<div id="loginform">
	<img src="/resources/images/loginformlogo.png" alt="logo" style="margin-left:3px;"/>
	
	<form action="/login/login" method="post" name="loginform" class="loginform">
		
		<table class="logintable">
		<tr>
			<td>
			<p style="text-align:left;">아이디를 입력하세요.</p>

	<input type="text" id="id" name="id" class="inputbox" required>

		</tr>
		<tr>
			<td><span id="capslock" style="float:left; position:absolute; left:115px; top:310px; width:auto; bottom:0px; display:none; color:#42a5be;">&nbsp;
				<b>CapsLock</b> 키가 눌려있습니다.&nbsp;</span>
				<p style="text-align:left;">비밀번호를 입력하세요.</p>
				<input type="password" name="pass" class="inputbox"
					onkeypress="caps_lock(event)" required></td>
				</tr>
				<tr>
					<td style="text-align:right; padding:20px 0px;" >

			<input id="idSaveCheck" type="checkbox" name="remember" value="remember" class="checkbox">

			<span style="font-family:Nanum Gothic, sans-serif; font-size:13px; color:#838383;"> 아이디 기억</span></td>

				</tr>
				<tr>
					<td><input type="image" src="/resources/images/loginbtn.png" name="Submit" value="Submit" style="margin-top:20px;"><br/>
					<br/><a href="/account/clickWrap.jsp">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="/account/findPassword.jsp">비밀번호를 잃어버렸나요?</a></td>
				</tr>
				<tr>
					<td style="padding-top:40px;"><a href="javascript:location.href='/index.jsp'" style="color:#58595a;">돌아가기</a></td>
				</tr>
			</table>
		</form>
	</div><!--end loginform-->
	</div><!--end logincon-->
	
	
	<input id="msg" type="hidden" value="${request.msg }"/>
	
    <script src="/account/js/loginForm.js"></script>
</body>
</html>