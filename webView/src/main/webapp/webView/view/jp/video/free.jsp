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
/* 4inch smart phone iPone5(landscape) 568X320 */
@media only screen
and (max-device-width : 569px)
and (min-device-width : 360px) {
	.container-fluid {width: 558px; height: 310px; background-image: url("/webView/img/568x320/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0 0 0 -2px; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 8% auto;}
	#free{height: 80px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 14px; font-weight: bold; margin:auto;}
	#explain {font-size: 12px;}
	#rt {font-size: 12px; margin: 0;}
	#exit_btn{height: 25px; margin: 0 0 0 -5px;}
	#playBtn {height: 25px; margin: 0;}
}

/* Samsung Galaxy S6, S7 (landscape) 640X360 */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 570px) {
	.container-fluid {width: 630px; height: 350px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#free{height: 95px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 16px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 14px;}
	#rt {font-size: 12px; margin: 0 0 0 0;}
	#exit_btn{height: 25px; margin:0;}
	#playBtn {height: 32px; margin: 0;}
}

/* Samsung Galaxy S8 (landscape) 740X360 */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 730px; height: 350px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 10px auto;}
	#free{height: 95px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 16px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 14px;}
	#rt {font-size: 12px; margin: 0 0 0 0;}
	#exit_btn{height: 25px; margin:-5px -30px 15px 15px;}
	#playBtn {height: 35px; margin: 0;}
}

/* LG G3 (landscape) 853X480 */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 843px; height: 470px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#free{height: 120px;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 20px;}
	#playBtn {height: 41px; margin: 0;}
}

/* Samsung Galaxy Note4 (landscape) 960X540 */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 950px; height: 530px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#free{height: 140px;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 27px;}
	#playBtn {height: 45px; margin: 0;}
}

/* Tablet iPad (landscape) 1024X768 */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1014px; height: 758px; background-image: url("/webView/img/1024x768/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#free{height: 160px; margin: 20px auto;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 27px;}
	#playBtn {height: 50px; margin: 0;}
}


/* Tablet Tab10, Xperia Z4 (landscape) 1280X800 */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
	.container-fluid {width: 1270px; height: 790px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#free{height: 200px;}
	#cate {margin: 0 0 -10px 0; font-size: 18px; font-weight: bold;}
	#title {font-size: 24px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 22px;}
	#rt {font-size: 20px; margin: 0 0 0 0;}
	#exit_btn{height: 32px; margin:0px 0px 15px 40px;}
	#playBtn {height: 60px; margin: 0;}
}

.hr {background-color: white; color: white;}
a {color: white;}
a:hover {color: white; text-decoration: none;}

@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;


</style>
</head>
<body style="background-color: black;">

<div class="container-fluid">
	<div class="contentcon" style="height: 100%;">

		<!-- detail -->
		<div id="detailcon" class="row">
			<div class="col-12" style="padding: 1% 2% 0 2%; height:100%;">
				<div class="row" style="height: 100%; padding: 0 2%;">
				
				<div class="col-7" style="padding: 0; height: 100%;">
					<img id="thumnail" src="/webView/video/jp/thumnail/${param.no}_thumnail.png"/>
				</div>
				<div class="col-5" style="padding: 0; height: 100%;">
					<div class="row" style="height: 25%;">
						<div class="row" style="width: 100%; height: 30%;">
							<div class="col-2">
								<img id="free" src="/webView/img/common/free/free_icon_detail.png"/>
							</div>
							<div class="col-2"></div><div class="col-2"></div>
							<div class="col-2"></div><div class="col-2"></div>
							<div class="col-2">
								<a href="javascript:history.go(-1)">
								<img id="exit_btn" src="/webView/img/common/free/exit_btn.png"/></a>
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
						<p id="cate" style="color: white;">初心者教育ビデオ</p>
						<hr class="hr" id="hr1"/></div>
					</div>
					<div class="row" style="height: 25%;">
						<div class="col-12" style="text-align: center;">
						<p id="title" style="color: white;">
						<c:out value="${param.title}"/></p>
						</div>
					</div>
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
						<div class="col-6">
							<a href="/webView/view/jp/video/freePlayer.jsp?no=${param.no}">
								<img id="playBtn" src="/webView/img/common/free/play_btn.png"/>
							</a>
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
</script>
</body>
</html>