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
	<form id="idForm" action="/login/findId" method="post" class="loginform">
		<input type="hidden" name="email" />
	</form>
	
	<table class="idTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
	<tr>
		<td><p id="nCrtEmail" style="display: none;">일치하는 이메일주소가 없습니다.</p>
		<input type="email" id="email" name="email" class="inputbox" placeholder="이메일 주소를 입력하세요." required>
		</td>
	</tr>
	<tr style="height: 100px;">
		<td><span id="findId"
		class="para" style="border-style: solid; padding: 3%;">아이디 찾기</span></td>
	</tr>
	</table>
	
	<!-- 아이디와 이메일 주소로 비밀번호 찾기 -->
	<form id="pwForm" action="/login/findPw" method="post" class="loginform">
		<input type="hidden" name="id"/>
		<input type="hidden" name="email"/>
	</form>
	
	<table class="pwTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
	<tr>
		<td><input type="text" id="id" name="id" class="inputbox" placeholder="아이디를 입력하세요." required>
		</td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr>
		<td><input type="email" id="email" name="email" class="inputbox" placeholder="이메일 주소를 입력하세요." required>
		</td>
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
	
	<!-- 새 비밀번호 설정 페이지 -->
	<table id="newPwTable" style="display: none; width: 400px; margin: 0 auto; text-align: center;">
		<tr>
			<td><p>새로운 비밀번호를 설정해주세요.</p>
			<p id="nCrtNewPw" style="display: none;"><span style="color: red;">패스워드가 일치하지 않습니다.</span></p>
			<input type="password" id="newPw" name="pass" class="inputbox"
			 placeholder="비밀번호를 입력하세요." required></input></td>
		</tr>
		<tr>
			<td><input type="password" id="newPwCheck" name="pass" class="inputbox"
			 placeholder="비밀번호를 확인" required></input></td>
		</tr>
		<tr style="height: 100px;">
			<td><span id="checkPw" class="para" style="border-style: solid; padding: 3%;">다음</span></td>
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
	$("#choiceBtn").hide();
	$(".pwTable").show();
})

//아이디찾기 ajax 처리
$("#findId").on("click", function(){
	
	var email = $("#email").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/ajaxId"
		, data: {type:'email', value:email}
		, dataType: "json"
		, success: function(data){
			if( data.check == "true" ){
				$("#keyTable").show();
				$(".idTable").hide();
				alert(data.authKey+" : "+data.check);
			} else {
				$("#nCrtEmail").show();
			}
		}
		, error: function(){
		
		}
	});
})

//이메일 키 체크
$("#checkEmail").on("click", function(){
	
	var data = {}
	data["authKey"] = $("#authKey").val();
	//var authKey = $("#authKey").val();
	data["email"] = $("#email").val();
	//var email = $("#email").val();
	
	$.ajax({
		type: "POST"
		, url: "/login/checkKey"
		, data: data
		, dataType: "json"
		, success: function(data){
			console.log(data.type);
			if( data.type == "true" ){
				$("#newPwTable").show();
				$("#keyTable").hide();
			} else if( data.type == "false"){
				alert("2");
				pwSubmit();
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
	$("#idForm").submit();
}
function pwSubmit(){
	$("#pwForm").submit();
}






/* 폼 날리는 조건 체크 */
function formConditionCheck(){
	if( $("#idDuplCheck").val() == "success" &&
			$("#passCrt").val() == "success" &&
			$("#nickDuplCheck").val() == "success" ){
		//alert("회원가입 success");
		$("form[name=registerform]").submit();
	} else {
		alert("회원가입 안됨 - 조건 실패");
	}

}

/* 폼 전송 	*/
$("#nextBtn").on("click", function(){
	
	var id = $("#id").val();
	var pass = $("#pass").val();
	var passCheck = $("#passcheck").val();
	var nick = $("#nickName").val();
	var email = $("#email").val();
	
	/* 아이디 중복 체크 */
	if( $("#idDuplCheck").val() == "false" ){
		$.ajax({
			type: "POST"
			, url: "/login/duplCheck"
			, data: {param:'id', value:id}
			, dataType: "text"
			, success: function(value, data){
				if( value == "success") {
					//alert("아이디 성공");
					$("#idDuplCheck").val("success");
					$("#duplId").hide();
				} else {
					//alert("아이디 중복");
					$("#idDuplCheck").val("false");
					$("#duplId").show();
				}
			nickDuplCheck();
			}
			, error: function(){
				alert(" ID 중복체크 중 오류발생. 잠시후 다시 시도해 주세요.");
				$("#idDuplCheck").val("false");
			}
		})
	//아이디 성공인데 버튼 눌린 경우
	} else {
		nickDuplCheck();
	}
	
})

</script>
</body>
</html>