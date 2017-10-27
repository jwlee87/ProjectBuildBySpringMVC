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
.para {padding: 10%; border: 1px white; background-color: #00B0AD; font-weight: bold; color:white;}
.para:hover {background-color: #01817F; color: #D9FFF2;}
</style>
</head>
<body id="login">
	
	
	<div id="logincon">
	<div id="loginform">
	<a href="/account/findPassword.jsp"><img src="/resources/images/loginformlogo.png" alt="logo" style="margin-left:3px;"/></a>
	
	<!-- 아이디 비밀번호 분기 -->
	<table id="choiceBtn" style="width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td width="150px;"><span id="idBtn" class="para" style="border-style: solid;">아이디 찾기</span></td>
			<td width="150px;"><span id="pwBtn" class="para" style="border-style: solid;">비밀번호 찾기</span></td>
		</tr>
	</table>
	
	<!-- 이메일주소로 아이디 찾기 -->
	
	<table class="idTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
	<tr>
		<td><input type="email" id="emailById" name="email" class="inputbox" placeholder="이메일 주소를 입력하세요." required>
		</td>
	</tr>
	<tr style="height: 100px;">
		<td><span id="findId"
		class="para" style="border-style: solid; padding: 3%;">아이디 찾기</span></td>
	</tr>
	</table>
	
	<table class="idTable" style="width: 400px; margin: 0 auto; text-align: center;">
		<tr><td><p id="nCrtEmail" style="display: none;">일치하는 이메일주소가 없습니다.</p></td></tr>
		<tr><td><p id="nCrtId" style="display: none;">일치하는 아이디가 없습니다.</p></td></tr>
		<tr><td><p id="nCrtMember" style="display: none;">입력하신 정보가 부정확합니다.</p></td></tr>
	</table>
	<!-- 아이디와 이메일 주소로 비밀번호 찾기 -->
	
	<!-- 비번 찾기 테이블 -->
	<table class="pwTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
	
	<tr>
		<td>
		<input type="text" id="id" name="id" class="inputbox" placeholder="아이디를 입력하세요." required>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr>
		<td><input type="email" id="email" name="email" class="inputbox" placeholder="이메일 주소를 입력하세요." required>
		</td>
	</tr>
	<tr>
		<td style="height: 100px;"><a href="javascript:newPwById();" style="text-decoration: none;"><span class="para" style="border-style: solid; padding: 3%;">인증메일 전송</span></a></td>
	</tr>
	</table>
	
	<!-- keyTable -->
	<table id="keyTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td><p>해당 이메일로 인증번호를 전송했습니다.</p><input type="text" id="authKey" name="authKey" class="inputbox"
			 placeholder="인증번호를 입력하세요." required></input></td>
		</tr>
		<tr style="height: 100px;">
			<td><span id="checkEmail" class="para" style="border-style: solid; padding: 3%;">인증하기</span></td>
		</tr>
	</table>
	
	<!-- keyTable -->
	<table id="keyTable2" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td><p>해당 이메일로 인증번호를 전송했습니다.</p><input type="text" id="authKey2" name="authKey" class="inputbox"
			 placeholder="인증번호를 입력하세요." required></input></td>
		</tr>
		<tr style="height: 100px;">
			<td><span id="checkKeyPwChg" class="para" style="border-style: solid; padding: 3%;">인증하기</span></td>
		</tr>
	</table>
	
	
	<!-- 새 비밀번호 설정 페이지 -->
	<form id="changePw" action="/login/newPw" method="post" class="loginform">
	<table id="newPwTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td><p>새로운 비밀번호를 설정해주세요.</p>
			<p id="nCrtNewPw" style="display: none;"><span style="color: red;">패스워드가 일치하지 않습니다.</span></p>
			<input type="password" id="newPw" name="pass" class="inputbox"
			 placeholder="비밀번호를 입력하세요." required></input></td>
		</tr>
		<tr>
			<td><input type="password" id="newPwCheck" class="inputbox"
			 placeholder="비밀번호를 확인" required></input></td>
		</tr>
		<tr style="height: 100px;">
			<td><span id="checkPw" class="para" style="border-style: solid; padding: 3%;">다음</span></td>
		</tr>
	</table>
	</form>
	
	
	<!-- 아이디 체크 결과 -->
	<table id="findIdRst" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td colspan="2"><p>회원님의 아이디는<span id="fId" style="font-weight: bold;">
			</span> 입니다.</p></td>
		</tr>
		<tr></tr><tr></tr><tr></tr>
		<tr>
			<td width="150px;"><a href="/account/loginForm.jsp" style="text-decoration: none;"><span class="para" style="border-style: solid;">로그인</span></a></td>
			<td width="150px;"><a href="javascript:void(0)"
			onclick="fpb();" style="text-decoration: none;">
			<span id="pwBtn" class="para" style="border-style: solid;">비밀번호 찾기</span></a></td>
		</tr>
	</table>
	
	<!-- 돌아가기 버튼 -->
	<table style="width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td style="padding-top:40px;"><a href="javascript:location.href='/account/loginForm.jsp'" style="color:#58595a;">로그인 화면으로 돌아가기</a></td>
		</tr>
		<tr>
			<td>
			<input type="hidden" name="" value="" />
			</td>
		</tr>
	</table>
		
	</div>
	</div>
	
	
	<input id="msg" type="hidden" value="${request.msg }"/>
	
<script type="text/javascript">

//아이디 비번 분기
$("#idBtn").on("click", function(){
	$("#choiceBtn").hide();
	$(".idTable").show();
})
$("#pwBtn").on("click", function(){
	alert("pwBtn click");
	$("#choiceBtn").hide();
	$("#findIdRst").hide();
	$(".pwTable").show();
})

function fpb(){
	$("#choiceBtn").hide();
	$("#findIdRst").hide();
	$(".pwTable").show();
}

//아이디찾기 ajax 처리
$("#findId").on("click", function(){
	
	var email = $("#emailById").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/ajaxId"
		, data: {email:email}
		, dataType: "json"
		, success: function(data){
			if( data.check == "true" ){
				$("#keyTable").show();
				$(".idTable").hide();
			} else {
				$("#nCrtEmail").show();
			}
		}
		, error: function(){
		
		}
	});
})

//아이디 비밀번호로 새로운 비밀번호 설정 ajax 처리
function newPwById(){
	
	var data = {};
	data["id"] = $("#id").val();
	data["email"] = $("#email").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/ajaxId"
		, data: data
		, dataType: "json"
		, success: function(data){
			if( data.check == "true" ){
				$(".pwTable").hide();
				$("#keyTable2").show();
			} else
			if ( data.check == "nCrtId"){
				$("#nCrtId").show();
			} else
			if ( data.check == "nCrt"){
				$("#nCrtMember").show();
				alert("not correct id and email")
			} else {
				$("#nCrtMember").show();
			}
		}
	})
}

//이메일 키 체크
$("#checkEmail").on("click", function(){
	
	var data = {}
	data["authKey"] = $("#authKey").val();
	//var authKey = $("#authKey").val();
	data["email"] = $("#emailById").val();
	//var email = $("#email").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/checkKey"
		, data: data
		, dataType: "json"
		, success: function(data){
			console.log(data.type);
			if( data.type == "true" ){
				$("#findIdRst").show();
				$("#keyTable").hide();
				$("#fId").html(data.memberId);
			} else if( data.type == "false"){
				alert("인증번호가 일치하지 하지 않습니다.");
			}
		}
		, error: function(){
			
		}
	});
})

//이메일 키 체크
$("#checkKeyPwChg").on("click", function(){
	
	var data = {}
	data["authKey"] = $("#authKey2").val();
	data["email"] = $("#emailById").val();
	data["id"] = $("#id").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/checkKeyForChgPw"
		, data: data
		, dataType: "json"
		, success: function(data){
			console.log(data.type);
			if( data.type == "true" ){
				$("#keyTable2").hide();
				$("#newPwTable").show();
			} else if( data.type == "false"){
				alert("인증번호가 일치하지 하지 않습니다.");
			}
		}
		, error: function(){
			
		}
	});
})

$("#checkPw").on("click", function(){
	if( $("#newPw").val() == $("#newPwCheck").val() ){
		$("#nCrtNewPw").hide();
		idSubmit();
	} else {
		$("#nCrtNewPw").show();
	}
})

//폼 섬밋 날리는 fnc
function idSubmit(){
	$("#changePw").submit();
	alert("변경되었습니다.")
}

</script>
</body>
</html>