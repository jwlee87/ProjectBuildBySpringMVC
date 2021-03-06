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

<title>video</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

<style>
/* 4inch smart phone iPone5(landscape) */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 360px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 8% auto;}
	#cate {margin: 0 0 -7% 0; font-size: 1.2em; font-weight: bold;}
	#title {font-size: 1.2em; font-weight: bold; margin:auto;}
	#explain {font-size: 0.8em;}
	#rt {font-size: 0.8em; margin: -15% 0 0 0;}
	#exit_btn{}
	#playBtn {height: 30px; margin: -85px 0 0 2px;}
}

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 639px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#free{height: 100px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin:auto;}
	#explain {font-size: 15px;}
	#rt {font-size: 10px; margin: -15% 0 0 0;}
	#exit_btn{height: 30px;}
	#playBtn {height: 30px; margin: -85px 0 0 2px;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 10px auto;}
	#free{height: 100px;}
	#cate {margin: 0 0 -10px 0; font-size: 13px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin:auto;}
	#explain {font-size: 15px;}
	#rt {font-size: 12px; margin: -35px 0 0 -15px;}
	#exit_btn{height: 30px;}
	#playBtn {height: 30px; margin: -85px 0 0 2px;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#free{height: 120px;}
	#cate {margin: 0 0 -10px 0; font-size: 15px; font-weight: bold;}
	#title {font-size: 22px; font-weight: bold; margin:auto;}
	#explain {font-size: 15px;}
	#rt {font-size: 15px; margin: -55px 0 0 -30px;}
	#exit_btn{height: 30px; margin: 0 0 0 10px;}
	#playBtn {height: 40px; margin: -85px 0 0 -15px;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#free{height: 140px;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 22px; font-weight: bold; margin:auto;}
	#explain {font-size: 16px;}
	#rt {font-size: 15px; margin: -55px 0 0 -20px;}
	#exit_btn{height: 30px; margin: 0 0 0 30px;}
	#playBtn {height: 50px; margin: -85px 0 0 -15px;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#free{height: 200px;}
	#cate {margin: 0 0 -10px 0; font-size: 20px; font-weight: bold;}
	#title {font-size: 28px; font-weight: bold; margin:auto;}
	#explain {font-size: 20px;}
	#rt {font-size: 20px; margin: -55px 0 0 -10px;}
	#exit_btn{height: 50px; margin: 0 0 0 40px;}
	#playBtn {height: 70px; margin: -85px 0 0 -15px;}
}

.hr {background-color: white; color: white;}
a {color: white;}
a:hover {color: white; text-decoration: none;}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;


</style>
</head>
<body style="background-color: #2a2828;">

<div class="container-fluid">
	<div class="contentcon" style="height: 100%;">

		<!-- detail -->
		<div id="detailcon" class="row">
			<div class="col-12" style="padding: 1% 2% 0 2%; height:100%;">
				<div class="row" style="height: 100%; padding: 0 2%;">
				
				<div class="col-7" style="padding: 0; height: 100%;">
					<img id="thumnail" src="/webView/img/thumnail/kr/${param.no}_thumnail.png"/>
				</div>
				<div class="col-5" style="padding: 0; height: 100%;">
					<div class="row" style="height: 25%;">
						<div class="row" style="width: 100%; height: 30%;">
							<div class="col-2">
								<img src="/webView/img/common/free/free_icon_detail.png" style="height: 400%;"/>
							</div>
							<div class="col-2"></div><div class="col-2"></div>
							<div class="col-2"></div><div class="col-2"></div>
							<div class="col-2">
								<a href="javascript:history.go(-1)">
								<img src="/webView/img/common/free/exit_btn.png" style="height: 100%;"/></a>
							</div>
						</div>
						<div class="row" style="width: 100%; height: 70%;">
							<div class="col-6">
							</div>
							<div class="col-6"></div>
						</div>
					</div>
					<div class="row" style="height: 10%;">
						<div class="col-12" style="text-align: right;">
						<p id="cate" style="color: white;">기본교육영상</p>
						<hr class="hr" id="hr1"/></div>
					</div>
					<div class="row" style="height: 20%;">
						<div class="col-12" style="text-align: center;">
						<p id="title" style="color: white;">
						<c:out value="${param.title}"/></p>
						</div>
					</div>
					<hr class="hr" id="hr2"/>
					<div class="row" style="height: 25%;">
						<div class="col-12" style="text-align: center; height: 100%;">
							<p id="explain" style="color: white;">
							<c:out value="${param.ex}"/></p>
						</div>
					</div>
					<div class="row" style="height: 7%;">
						<div class="col-12" style="text-align: center;">
							<p id="rt" style="color: white;">
							<c:out value="${param.rt}"/></p>
						</div>
					</div>
					<div class="row" style="height: 13%; float: center;">
						<div class="col-3"></div>
						<div id="play" class="col-6">
							<p id="playBtn">
							<a href="/webView/view/kr/freePlayer.jsp?no=${param.no}">
							PLAY</a></p>
						</div>
						<div class="col-3"></div>
					</div>
				</div>
				</div>
			</div>
		</div>

	</div>
</div>

<script>

$("#homeIcon").on("click", function(){
	$("#shopIcon").attr("src", "/webView/img/common/videoList/shop_icon_off.png");
	$("#homeIcon").attr("src", "/webView/img/common/videoList/home_icon_on.png");
	$("#myIcon").attr("src", "/webView/img/common/videoList/my_icon_off.png");
	window.location.href="/webView/view/jp/videoList.jsp";
})
$("#shopIcon").on("click", function(){
	$("#shopIcon").attr("src", "/webView/img/common/videoList/shop_icon_on.png");
	$("#homeIcon").attr("src", "/webView/img/common/videoList/home_icon_off.png");
	$("#myIcon").attr("src", "/webView/img/common/videoList/my_icon_off.png");
	$("#mycon").hide();
	$("#homecon").hide();
	$("#shopcon").show();
})
$("#myIcon").on("click", function(){
	$("#shopIcon").attr("src", "/webView/img/common/videoList/shop_icon_off.png");
	$("#homeIcon").attr("src", "/webView/img/common/videoList/home_icon_off.png");
	$("#myIcon").attr("src", "/webView/img/common/videoList/my_icon_on.png");
	$("#mycon").show();
	$("#homecon").hide();
	$("#shopcon").hide();
})

</script>
</body>
</html>