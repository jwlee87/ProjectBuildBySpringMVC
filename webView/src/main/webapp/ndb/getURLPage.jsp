<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<title>비밀번호 변경</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>

</head>
<body style="background-color: black;">

<div class="container-fluid" style="padding: 0;">

<!-- --------- -->
<!-- 비밀번호 변경 -->
<!-- --------- -->
<div class="contentcon" style="height: 100%; width: 100%;">

	<div class="row" style="text-align: center; margin-top: 100px;">
		<div class="col-12">
			<h4 style="color: white;">비밀번호 변경</h4>
		</div>
	</div>
	<div class="row" style="text-align:center;">
		<div class="col-1"></div>
		<div class="col-10">
			<input name="pass" class="form-control" type="password" placeholder="비밀번호 입력"/>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row" style="text-align: center;">
		<div class="col-1"></div>
		<div class="col-10">
			<input name="passCheck" class="form-control" type="password" placeholder="비밀번호 확인"/>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row" style="text-align: center;">
		<div class="col-1"></div>
		<div class="col-12">
			<p id="info" style="color: gold; font-size: 16px;">4~8자 사이로 입력 해주세요.</p>
		</div>
		<div class="col-1"></div>
	</div>
	<div class="row" style="text-align: center;">
		<div class="col-1"></div>
		<div class="col-10">
			<button class="btn btn-warning">변경</button>
		</div>
		<div class="col-1"></div>
	</div>
	
	
	<!-- ------------ -->
	<!-- input hidden -->
	<!-- ------------ -->
	<input type="hidden" name="userUniqueID" value="${user.uniqueID}">
</div>

<div id="truecon" style="margin-top: 50px; display:none;">
	<div class="row" style="text-align: center;">
		<div class="col-12">
		<p style="color: white;">비밀번호가 성공적으로</p>
		<p style="color: white;">변경되었습니다.</p>]
		</div>
	</div>
</div>

</div>

<script>

$(".btn").on("click", function(){
	$("#info").html("4~8자 사이로 입력 해주세요.");
	
	var data = {};
	
	var pw = $("input[name=pass]").val();
	var pwCh = $("input[name=passCheck]").val();
	
	data["pw"] = pw;
	data["uniqueID"] = $("input[name=userUniqueID]").val();
	
	if( pw.length < 4 && pw.length > 8){
		$("#info").html("비밀번호를 4~8자 사이로 입력 해주세요.");
		return false;
	}
	
	if(pw == pwCh){
		$.ajax({
			type: "POST"
			, url: "/ndb/change"
			, data: data
			, dataType: "json"
			, success: function(data){
				console.log("하이1");
				if(data.check == 'true'){
					console.log("하이2");
					$(".contentcon").hide();
					$("#truecon").show();
				}else{
					console.log("하이3");
					$("#truecon").hide();
				}
			}
		})
		
	} else {
		$("#info").html("비밀번호가 일치하지 않습니다.");
		return false;
	}
})

</script>
</body>
</html>