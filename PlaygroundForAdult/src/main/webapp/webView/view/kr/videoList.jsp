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

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 639px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 65%; margin: 18% 0 0 30%;}
	#shopIcon {height: 67%; margin: 15% 0 0 80%;}
	#myIcon {height: 65%; margin: 15% 0 0 30%;}
	#topcon {height: 15%;}
	#homecon, #shopcon, #mycon {height: 80%; margin-top: 1%;} 
	#freeicon {width: 100%; margin: 10% auto;}
	.category {font-size: 1em; margin: 2% 0 0 0;}
	.title {font-size: 1.4em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 0.8em;}
	.thumnail {width: 88%; margin: 5%;}
}

/* 화웨이 (landscape) */
@media only screen
and (max-device-width : 732px)
and (min-device-width : 641px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 65%; margin: 18% 0 0 30%;}
	#shopIcon {height: 67%; margin: 15% 0 0 80%;}
	#myIcon {height: 65%; margin: 15% 0 0 30%;}
	#topcon {height: 15%;}
	#homecon, #shopcon, #mycon {height: 80%; margin-top: 1%;} 
	#freeicon {width: 100%; margin: 10% auto;}
	.category {font-size: 1em; margin: 2% 0 0 0;}
	.title {font-size: 1.4em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 0.8em;}
	.thumnail {width: 88%; margin: 5%;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 733px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 65%; margin: 13% 0 0 30%;}
	#shopIcon {height: 67%; margin: 10% 0 0 80%;}
	#myIcon {height: 65%; margin: 10% 0 0 30%;}
	#topcon {height: 15%;}
	#homecon, #shopcon, #mycon {height: 80%; margin-top: 1%;}
	#freeicon {width: 100%; margin: 2% auto;}
	.category {font-size: 1em; margin: 0 0 0 0;}
	.title {font-size: 1.5em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 0.8em;}
	.thumnail {width: 70%; margin: 5% 0 5% 20%;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 68%; margin: 12% 0 0 40%;}
	#shopIcon {height: 70%; margin: 10% 0 0 80%;}
	#myIcon {height: 70%; margin: 10% 0 0 30%;}
	#topcon {height: 12%;}
	#homecon, #shopcon, #mycon {height: 80%; margin: 2% 0;}
	#freeicon {width: 100%; margin: 10% auto;}
	.category {font-size: 1.3em; margin: 2% 0 0 0;}
	.title {font-size: 2em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 1.1em;}
	.thumnail {width: 88%; margin: 5%;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 68%; margin: 12% 0 0 40%;}
	#shopIcon {height: 70%; margin: 10% 0 0 80%;}
	#myIcon {height: 70%; margin: 10% 0 0 30%;}
	#topcon {height: 13%;}
	#homecon, #shopcon, #mycon {height: 82%; margin: 1% 0 0 0;}
	#freeicon {width: 100%; margin: 11% auto;}
	.category {font-size: 1.4em; margin: 4% 0 0 0;}
	.title {font-size: 2em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 1.2em;}
	.thumnail {width: 90%; margin: 6%;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg.png"); background-repeat: no-repeat;}
	#homeIcon {height: 68%; margin: 12% 0 0 40%;}
	#shopIcon {height: 70%; margin: 10% 0 0 80%;}
	#myIcon {height: 70%; margin: 10% 0 0 30%;}
	#topcon {height: 11%;}
	#homecon, #shopcon, #mycon {height: 85%; margin-top: 2%;}
	#freeicon {width: 100%; margin: 18% auto;}
	.category {font-size: 1.8em; margin: 10% 0 0 0;}
	.title {font-size: 2.8em; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 1.6em;}
	.thumnail {width: 85%; margin: 10% 0 0 10%;}
}

.contentcon {height: 100%; overflow-y: hidden;}
p { color: white; text-decoration: none;}
a:hover {text-decoration: none;}


@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>
</head>
<body style="background-color: #2a2828;">

<div class="container-fluid">
	<div class="contentcon" style="height: 100%;">

		<div id="topcon" class="row">
			<div class="col-4">
				<div class="row" style="height: 100%;">
					<div class="col-6">
					<a href="/web/videoList?id=${member.id}">
						<img id="homeIcon" src="/webView/img/common/videoList/home_icon_on.png"/>
					</a></div>
					<div class="col-6"></div>
				</div>
			</div>
			<img id="logo" class="col-4" src="/webView/img/common/logo_icon.png" style="padding: 0;"/>
			<div class="col-4" style="padding: 0;">
				<div class="row" style="height: 100%;">
					<div class="col-6"><img id="shopIcon" src="/webView/img/common/videoList/shop_icon_off.png"/></div>
					<div class="col-6"><img id="myIcon" src="/webView/img/common/videoList/my_icon_off.png"/></div>
				</div>
			</div>
		</div>
		
		<!-- home page -->
		<div id="homecon" class="row" style=" display: block;">
			<div class="col-12" style="padding: 2%; overflow: scroll; height: 100%;">
				
				<c:forEach var="video" items="${list}">
					<a href="/webView/view/kr/free.jsp?no=${video.no}&title=${video.title}&rt=${video.runningTime}&ex=${video.explain}&id=${member.id}">
					<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; background-color: #3E2908;">
						<div class="col-3" style=" padding: 0 2% 0 2%;">
							<img id="freeicon" src="/webView/img/common/free/free_icon_main.png"/>
						</div>
						<div class="col-5" style=" padding: 0 1% 0 0; text-align: right;">
							<p class="category">기본교육영상</p>
							<p class="title">${video.title}</p>
							<p class="runningtime">running time <c:out value="${video.runningTime}"/></p>
						</div>
						<div class="col-4" style="padding: 0;">
							<img class="thumnail" src="/webView/img/thumnail/kr/${video.no}.png"/>
						</div>
					</div>
					</a>
				</c:forEach>

			</div>
		</div>
		
		<!-- video page -->
		<div id="shopcon" class="row" style=" display: none;">
			<div class="col-12" style="padding: 2%; overflow: scroll; height: 100%;">
				
				
				<p style=" color: white; font-size: 2em;">developing of video shop page...</p>
				
				
				<!-- <div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid blue;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid blue;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid blue;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid blue;">
				</div> -->
				
			</div>
		</div>
		
		<!-- my page -->
		<div id="mycon" class="row" style=" display: none;">
			<div class="col-12" style="padding: 2%; overflow: scroll;" height: 100%;>
				
				
				<p style=" color: white; font-size: 2em;">developing of my page...</p>
				
				
				<!-- <div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid white;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid white;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid white;">
				</div>
				
				<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; border: 0.1em solid white;">
				</div> -->
				
			</div>
		</div>


	</div>
</div>

<script>

$("#homeIcon").on("click", function(){
	$("#shopIcon").attr("src", "/webView/img/common/videoList/shop_icon_off.png");
	$("#homeIcon").attr("src", "/webView/img/common/videoList/home_icon_on.png");
	$("#myIcon").attr("src", "/webView/img/common/videoList/my_icon_off.png");
	$("#mycon").hide();
	$("#shopcon").hide();
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