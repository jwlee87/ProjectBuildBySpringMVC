<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

<title>giveResult</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>
/* 4inch smart phone iPone5(landscape) */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 360px) {
}

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 639px) {
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
}

/* Tablet iPad (landscape) */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
}


/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
}

a {color: white;}
a:hover {color: white; text-decoration: none;}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;


</style>
</head>
<body style="background-color: #2a2828; overflow-y: hidden;">

<div class="container-fluid">
	<div class="contentcon">
	<!-- ------------ -->
	<!-- hidden value -->
	<!-- ------------ -->
	<input type="hidden" name="check" value="${param.check}"/>
	<input type="hidden" name="id" value="${param.id}"/>
	
		<!-- detail -->
		<div id="detailcon" class="row" style="height: 60%; text-align: center; vertical-align: middle; margin: 15% auto;">
			<div id="idResult" style="height: 100%; width: 100%; margin: 10% auto;">
				<p style="font-size: 1em; width: 100%; color: white; font-weight: bold; margin: 0 auto;">회원님의 아이디는 <c:out value='${param.id}'/> 입니다.</p><br/>
				<p style="font-size: 0.6em; width: 100%; color: white; margin: 0 auto;">본 페이지는 일회성 페이지입니다. 이 페이지에 다시 접속할 수 없기때문에</p><br/>
				<p style="font-size: 0.6em; width: 100%; color: white; margin: 0 auto;">해당 결과를 회원님의 메일로 발송해 드렸습니다.</p><br/>
				<a href="http://localhost/webView/view/kr/giveResult.jsp?id=${param.id}&check=ok"><button class="btn btn-warning" style="color: white;">비밀번호 찾기</button></a>
			</div>
			
			<div id="chgPw" class="row" style="width: 100%; height: 100%; display: none; padding: 0; margin: 0;">
				<div class="row" style="width: 100%; height: 30%; text-aling: center; padding: 0; margin: 0;">
					<p style="color: white; width: 100%; font-size: 2em; text-shadow: -1px 0 yellow, 1px 0 yellow, 0 1px yellow, 0 -1px yellow">&lt;King Of Casino&gt;</p>
					<p id="comment"style="color: white; width: 100%; font-size: 1em; margin: 0 auto;">비밀번호 변경</p>
				</div>
				<div class="row" style="width: 100%; height: 30%; padding: 0; margin: 1% auto;">
					<div class="col-7" style="margin: 0 auto;">
						<input type="password" class="form-control" id="pw" name="pass" placeholder="변경할 비밀번호">
					</div>
				</div>
				<div class="row" style="width: 100%; height: 30%; padding: 0; margin: 1% auto;">
					<div class="col-7" style="margin: 0 auto;">
						<input type="password" class="form-control" id="pwCheck" placeholder="비밀번호 확인">
					</div>
				</div>
				<div class="row" style="width: 100%; height: 10%; padding: 0; margin: 0;">
					<div class="col-4" style="margin: 0 auto;">
						<button id="submitBtn" type="button" class="btn btn-warning" style="color: white; font-weight: bold;">변경</button>
					</div>
				</div>
			</div> 
		</div>

	</div>
</div>

<script>
var check = $("input[name=check]").val();

if(check=='ok'){
	$("#idResult").hide();
	$("#chgPw").show();
}


$("#submitBtn").on("click", function(){
	
	var id = $("input[name=id]").val();
	var pass = $("#pw").val();
	var passCheck = $("#pwCheck").val();
	
	if(pass == ""){
		$("#comment").html("변경하실 비밀번호를 입력하세요.");
		return false;
	} else {
		if(pass==passCheck){
			
			var data = {};
			data["id"] = id;
			data["pass"] = pass;
			
			$.ajax({
				type: "POST"
				, url: "/web/changePw"
				, data: data
				, dataType: "json"
				, success: function(data){
					if(data.check == "true"){
						//변경 성공
						$("#comment").html("비밀번호가 변경되었습니다.");
						$("input[type=password]").hide();
						$("button[type=button]").hide();
					} else {
						//변경 실패 다시시도 권유
					}
				}
			})
			
		}else{
			$("#comment").html("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	}
	
})
</script>
</body>
</html>