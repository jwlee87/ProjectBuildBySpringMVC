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
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

/* Preloader */
#preloader {position: fixed;top:0;left:0;right:0;bottom:0;background-color:#000;z-index:1000;}
#status {width:80px; height:80px; position:absolute; left:50%; top:50%; background-image:url(/webView/img/common/loadingIcon.gif); background-repeat:no-repeat; background-size:40px; background-position:center; margin:-40px 0 0 -40px;}

</style>

</head>
<body style="background-color: black;">

<div class="container-fluid" style="padding: 0;">

	<!-- ---------- -->
	<!-- logo image -->
	<!-- ---------- -->
<div class="contentcon" style="height: 100%; width: 100%;">
	<div class="row" style="padding: 0; margin:0; height: 50%; width: 100%;"></div>
	
	<!-- --------------------------- -->
	<!-- select find id or find pass -->
	<!-- --------------------------- -->
	<div style="width: 100%; height: 100%;">
	<div id="select" class="row" style="padding: 0; margin:0; height: 50%; width: 100%; margin-top: 50%;">
		<div class="col-6" style="padding: 0 2% 10% 10%; height: 100%;">
			<button id="idBtn" type="button" class="btn btn-warning" style="width: 100%; height: 100%; text-align: center; color:white; padding: 10%;">아이디 찾기</button>
		</div>
		<div class="col-6" style="padding: 0 10% 10% 2%; height: 100%;">
			<button id="passBtn" type="button" class="btn btn-warning" style="width: 100%; height: 100%; text-align: center; color:white; padding: 10%;">비밀번호 찾기</button>
		</div>
	</div>
	</div>
	
	<!-- ---------------- -->
	<!-- email input form -->
	<!-- ---------------- -->
	<div id="email" class="row" style="padding: 0; margin:0; width: 100%; display: none; margin-top: 50%;">
		<div class="col-12">
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
				<a href="javascript:location.href='/ndb/find'"
					style="color: white;">처음으로</a>
			</div>
		</div>
		</div>
	</div>
	
	<!-- ------------------- -->
	<!-- id email input form -->
	<!-- ------------------- -->
	<div id="idAndEmail" class="row" style="padding: 0; margin:-70px 0 0 0; height: 50%; width: 100%; display: none; margin-top: 50%;">
		<div class="col-12">
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
					<a href="javascript:location.href='/ndb/find'"
						style="color: white;">처음으로</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- --------------- -->
	<!-- ajax check true -->
	<!-- --------------- -->
	<div id="true" style="width: 100%; display: none; margin-top: 50%;">
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
					<input id="inputKey" class="form-control" type="text" placeholder="인증번호를 입력하세요." required="required"/>
				</div>
				<div class="row" style="padding: 0;">
					<div class="col-12" style="text-align: center; margin-top: 10px;">
						<button type="button" class="btn btn-warning sendKey" style="color: white; font-weight: bold;">전송</button>
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
	
	<!-- -------------- -->
	<!-- 메일 확인 하라는 페이지 -->
	<!-- -------------- -->
	<div id="bye" class="row" style="height: 60%; text-align: center; vertical-align: middle; margin: -15% auto; display: none; margin-top: 50%;">
		<div style="height: 100%; width: 100%; margin: 10% auto;">
			<p style="text-shadow: -1px 0 0 black, 1px 0 0 black, 0 0 1px black, 0 0 -1px black; font-size: 1.4em; width: 100%; color: white; font-weight: bold; margin: 0 auto;">요청 완료!</p><br/>
			<p style="font-size: 1em; width: 100%; color: white; margin: 0 auto;">회원님의 이메일주소로<br>요청하신 정보를 보내드렸습니다.</p><br/>
			<p style="font-size: 1em; width: 100%; color: white; margin: 0 auto;">이메일을 확인 해 주세요.</p><br/>
		</div>
	</div>
	
	<!-- ------------ -->
	<!-- hidden value -->
	<!-- ------------ -->
	<input type="hidden" name="type"/>
	
	
	
</div>
<!-- /.contentcon -->

	<!-- --------- -->
	<!-- preloader -->
	<!-- --------- -->
	<div id="preloader" style="display:none;">
		<div id="status"></div>
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
	tcounter = 180;
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
	
	$("#email").hide();
	$("#idAndEmail").hide();
	$("#preloader").show();
	
	$.ajax({
		type: "POST"
		, url: "/ndb/findAcnt"
		, data: data
		, dataType: "json"
		, success: function(data){
			if(data.check == "true" && data.type=="email"){
				console.log("data.type=='email'");
				
				$("#preloader").hide();
				
				$("input[name=type]").val("email");
				$("#bye").show();
				//$("#true").show();
				//timer_start();
			}else if(data.check=="true" && data.type=="both"){
				console.log("data.type=='both'");
				
				$("#preloader").hide();
				
				$("input[name=type]").val("both");
				$("#bye").show();
				//$("#true").show();
				//timer_start();
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

</script>
</body>
</html>