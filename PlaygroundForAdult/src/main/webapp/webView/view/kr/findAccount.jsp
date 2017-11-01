<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<title>find Account</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

/* 4inch smartphone (landscape) */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 400px) {
	.container-fluid {padding: 2%; width: 568px; height: 320px; background-image: url("/webView/img/568x320/bg_without.png"); background-repeat: no-repeat;}
	#logo {width: 70%; margin: 20px auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 569px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 320px; margin: 50px auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 50px auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat;margin: 0 0 0 1px;}
	#logo {width: 420px; margin: 50px auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 50px auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Tablet iPad (landscape) */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px) {
	.container-fluid {width: 1024px; height: 768px; background-image: url("/webView/img/1024x768/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 50px auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2560px)
and (min-device-width : 1025px) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 50px auto;}
	#idBtn {font-size: 40px; font-weight: bold;}
	#passBtn {font-size: 40px; font-weight: bold;}
}

.contentcon {height: 100%; overflow-y: hidden;}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>

</head>
<body style="background-color: black;">

<div class="container-fluid" style="padding: 0;">

	<!-- ------------ -->
	<!-- parameter id -->
	<!-- ------------ -->
	<input id="loginId" type="hidden" value="${member.id}"/>
	
	
	<!-- ---------- -->
	<!-- logo image -->
	<!-- ---------- -->
	<div class="contentcon" style="height: 100%; width: 100%;">
	<div class="row" style="padding: 0; margin:0; height: 50%; width: 100%;">
		<img id="logo" src="/webView/img/common/logo_icon.png">
	</div>
	
	<!-- --------------------------- -->
	<!-- select find id or find pass -->
	<!-- --------------------------- -->
	<div id="select" class="row" style="padding: 0; margin:0; height: 50%; width: 100%;">
		<div class="col-6" style="padding: 0 10% 10% 10%; height: 100%;">
			<button id="idBtn" type="button" class="btn btn-warning" style="width: 100%; height: 100%; text-align: center; color:white;">아이디 찾기</button>
		</div>
		<div class="col-6" style="padding: 0 10% 10% 10%; height: 100%;">
			<button id="passBtn" type="button" class="btn btn-warning" style="width: 100%; height: 100%; text-align: center; color:white;">비밀번호 찾기</button>
		</div> 
	</div>
	
	<!-- ---------------- -->
	<!-- email input form -->
	<!-- ---------------- -->
	<div id="email" class="row" style="padding: 0; margin:0; height: 30%; width: 100%; display: none;">
		<div class="col-2"></div>
		<div class="col-8">
		
			<div class="form-group">
				<div class="col-12">
					<input id="onlyMail" name="email" type="email" class="form-control" id="inputEmail" placeholder="이메일주소를 입력하세요." required="required">						
				</div>
			</div>
			<div class="form-group">
				<div class="col-12" style="text-align: center;">
					<button id="findId" type="buttom" class="btn btn-warning">전송</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-12" style="text-align: center;">
					<a href="javascript:location.href='/web/find?id=${member.id}'"
						style="color: white;">처음으로</a>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
	
	<!-- ------------------- -->
	<!-- id email input form -->
	<!-- ------------------- -->
	<div id="idAndEmail" class="row" style="padding: 0; margin:-25px 0 0 0; height: 30%; width: 100%; display: none;">
		<div class="col-2"></div>
		<div class="col-8">
		
				<div class="form-group">
					<div class="col-12">
						<input id="id" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요." required="required">						
					</div>
				</div>
				<div class="form-group">
					<div class="col-12">
						<input id="email" name="email" type="email" class="form-control" placeholder="이메일주소를 입력하세요." required="required">
					</div>
				</div>
				<div class="form-group">
					<div class="col-12" style="text-align: center;">
						<button type="submit" class="btn btn-warning">인증번호 요청</button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-12" style="text-align: center;">
						<a href="javascript:location.href='/web/find?id=${member.id}'"
							style="color: white;">처음으로</a>
					</div>
				</div>
		</div>
		<div class="col-2"></div>
	</div>
	
	<!-- --------------- -->
	<!-- ajax check true -->
	<!-- --------------- -->
	<div id="true" style="width: 100%; height: 25%;">
	<div class="row" style="padding: 0; margin:0; height: 25%; width: 100%; display: none;">
			<div class="col-4"></div>
			<div class="col-4" style="padding: 0;">
				<div class="row" style="padding: 0; margin: 0;">
					<input class="form-control" type="text" placeholder="인증번호를 입력하세요."/>
				</div>
				<div class="row" style="padding: 0; margin: 0; text-align: center;">
				
				</div>
			</div>
			<div class="col-4"></div>
	</div>
	<div class="row" style="padding: 0; margin:0; height: 25%; width: 100%; display: none;">
		<div class="col-4"></div>
		<div class="col-4"></div>
		<div class="col-4"></div>
	</div>
	</div>
	
	<!-- ---------------- -->
	<!-- ajax check email false -->
	<!-- ---------------- -->
	<div id="emailFalse" style="width: 100%; height: 25%; display: none; text-align: center;">
		<p style="color: white; font-weight: bold;">일치하는 이메일이 없습니다.</p>
	</div>
	
</div>

<script>
$("#idBtn").on("click", function(){
	$("#select").hide();
	$("#email").show();
	
})
$("#passBtn").on("click", function(){
	$("#select").hide();
	$("#idAndEmail").show();
})

function count(seconds) {
	var pad = function(x) { return (x < 10) ? "0"+x : x; }
	return	pad(parseInt(seconds / 60 % 60)) + ":" +
			pad(seconds % 60)
}
/* setInterval(function(){
	console.log(count(time));
}, 1000); */

////////////
//find id///
////////////
$("#findId").on("click", function(){
	
	var data = {};
	data["loginId"] = $("#loginId").val();
	data["email"] = $("#onlyMail").val();
	
	$.ajax({
		type: "POST"
		, url: "/web/findId"
		, data: data
		, dataType: "json"
		, success: function(data){
			if(data.check == "true"){
				$("#email").hide();
				$("#true").show();
			} else if(data.check == "false"){
				$("#email").hide();
				$("#emailFalse").show();
			}
		}
	})
})
</script>
</body>
</html>