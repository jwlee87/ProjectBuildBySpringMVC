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
	#logo {width: 70%; margin: 20px auto 0 auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 569px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 320px; margin: 20px auto 5px auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 20px auto 5px auto;}
	#idBtn {font-size: 20px; font-weight: bold;}
	#passBtn {font-size: 20px; font-weight: bold;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat;margin: 0 0 0 1px;}
	#logo {width: 420px; margin: 20px auto 0 auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 20px auto 20px auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Tablet iPad (landscape) */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px) {
	.container-fluid {width: 1024px; height: 768px; background-image: url("/webView/img/1024x768/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 20px auto 10px auto;}
	#idBtn {font-size: 30px; font-weight: bold;}
	#passBtn {font-size: 30px; font-weight: bold;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2560px)
and (min-device-width : 1025px) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat; margin: 0 0 0 -1px;}
	#logo {width: 420px; margin: 20px auto 10px auto;}
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
	<div id="email" class="row" style="padding: 0; margin:0; width: 100%; display: none;">
		<div class="col-2"></div>
		<div class="col-8">
		<!-- ---------------------- -->
		<!-- ajax check email false -->
		<!-- ---------------------- -->
		<div class="form-group notExsist" style="padding: 0; display: none;">
			<div class="col-12" style="text-align: center;">
				<p class="falsePara" style="color: white; font-weight: bold;">일치하는 메일주소가 없습니다.</p>
			</div>
		</div>
		<div class="form-group">
			<div class="col-12">
				<input id="onlyMail" name="email" type="email" class="form-control" placeholder="이메일주소를 입력하세요." required="required">						
			</div>
		</div>
		<div class="form-group">
			<div class="col-12" style="text-align: center;">
				<button id="findId" type="buttom" class="btn btn-warning" style="color: white; font-weight: bold;">인증번호 요청</button>
			</div>
		</div>
		<div class="form-group">
			<div class="col-12" style="text-align: center;">
				<a href="javascript:location.href='/web/find?cc=${cc}'"
					style="color: white;">처음으로</a>
			</div>
		</div>
		</div>
		<div class="col-2"></div>
	</div>
	
	<!-- ------------------- -->
	<!-- id email input form -->
	<!-- ------------------- -->
	<div id="idAndEmail" class="row" style="padding: 0; margin:-70px 0 0 0; height: 50%; width: 100%; display: none;">
		<div class="col-2"></div>
		<div class="col-8">
		
			<div class="form-group notExsist" style="padding: 0; display: none;">
				<div class="col-12" style="text-align: center;">
					<p class="falsePara" style="color: white; font-weight: bold;">일치하는 메일주소가 없습니다.</p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-12">
					<input id="inputId" name="id" type="text" class="form-control" placeholder="아이디를 입력하세요." required="required">						
				</div>
			</div>
			<div class="form-group">
				<div class="col-12">
					<input id="inputEmail" name="email" type="email" class="form-control" placeholder="이메일주소를 입력하세요." required="required">
				</div>
			</div>
			<div class="form-group">
				<div class="col-12" style="text-align: center;">
					<button id="chgPwBtn" type="button" class="btn btn-warning" style="color: white; font-weight: bold;">인증번호 요청</button>
				</div>
			</div>
			<div class="form-group">
				<div class="col-12" style="text-align: center;">
					<a href="javascript:location.href='/web/find?cc=${cc}'"
						style="color: white;">처음으로</a>
				</div>
			</div>
			
		</div>
		<div class="col-2"></div>
	</div>
	
	<!-- --------------- -->
	<!-- ajax check true -->
	<!-- --------------- -->
	<div id="true" style="width: 100%; display: none;">
	<div class="row" style="padding: 0; margin:0; width: 100%;">
			<div class="col-4"></div>
			<div class="col-4" style="padding: 0;">
				<div class="row" style="padding: 0;">
					<div class="col-12" style="text-align: center; margin-top: 10px;">
						<span id="timeSpan" style="color: white;"></span>
						<button id="resend" type="button" class="btn btn-warning" style="color: white; font-weight: bold; font-size: 10px; display: none; margin-bottom: 10px;">인증번호 다시 요청</button> 
					</div>
				</div>
				<div class="row" style="padding: 0; margin: 0;">
					<input id="inputKey" class="form-control" type="text" placeholder="인증번호를 입력하세요." required/>
				</div>
				<div class="row" style="padding: 0;">
					<div class="col-12" style="text-align: center; margin-top: 10px;">
						<button type="button" class="btn btn-warning" style="color: white; font-weight: bold;">전송</button>
					</div>
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
	
	<input type="hidden" name="type"/>
	
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

////////////////////////////////
//   find id by only email   ///
////////////////////////////////
$("#findId").on("click", function(){
	idFindAjaxCommon();
})

//////////////////////////////////////////////
//   change password by both id and email   //
//////////////////////////////////////////////
$("#chgPwBtn").on("click", function(){
	idFindAjaxCommon();
})


//////////////////////////
/////   resend key   /////
//////////////////////////
$("#resend").on("click", function(){
	$("#inputKey").attr("disabled", false);
	$("#timeSpan").show();
	$("#resend").hide();
	
	idFindAjaxCommon();
})

////////////////////
/////   timer   ////
////////////////////
function timer_start(){
	$("#resend").hide();
	tcounter = 10;
	t1 = setInterval(timer, 1000);
}
function timer(){
	tcounter = tcounter-1;
	temp = Math.floor(tcounter/60);
	if(Math.floor(tcounter/60)<10){ temp = '0'+temp; }
	temp = temp + ":";
	if( (tcounter%60)< 10 ) { temp = temp+'0'; }
	temp = temp + (tcounter%60);
	$("#timeSpan").html(temp);
	if(tcounter<0) tstop();
}
function tstop(){
	clearInterval(t1);
	$("#timeSpan").html("");
	$("#timeSpan").hide();
	$("#resend").show();
	$("#inputKey").attr("disabled", true);
}

//////////////////////////////////
/////// id find ajax common //////
//////////////////////////////////
function idFindAjaxCommon(){
	var data = {};
	
	data["onlyEmail"] = $("#onlyMail").val();
	data["inputId"] = $("#inputId").val();
	data["inputEmail"] = $("#inputEmail").val();
	
	$.ajax({
		type: "POST"
		, url: "/web/findId"
		, data: data
		, dataType: "json"
		, success: function(data){
			if(data.check == "true" && data.type=="email"){
				console.log("data.type=='email'");
				$("input[name=type]").val("email");
				$("#email").hide();
				$("#true").show();
				timer_start();
			}else if(data.check=="true" && data.type=="both"){
				console.log("data.type=='both'");
				$("input[name=type]").val("both");
				$("#idAndEmail").hide();
				$("#true").show();
				timer_start();
			}else if(data.check=="notExistEmail"){
				$(".notExsist").show();
				$(".falsePara").html("일치하는 이메일주소가 없습니다.");
			}else if(data.check=="notExistID"){
				$(".notExsist").show();
				$(".falsePara").html("일치하는 아이디가 없습니다.");
			}else if(data.check=="notCrt"){
				$(".notExsist").show();
				$(".falsePara").html("아이디와 이메일주소의 주인이 일치하지 않습니다.");
			}
		}
	})
}

////////////////////
//   ajax 인증 처리   //
///////////////////


</script>
</body>
</html>