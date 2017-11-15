<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

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
	.container-fluid {width: 558px; height: 310px; background-image: url("/webView/img/568x320/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0 0 0 -2px; padding: 5px;}
	#homeIcon {height: 30px; margin: 18% 0 0 32%;}
	#shopIcon {height: 30px; margin: 15% 0 0 80%;}
	#myIcon {height: 30px; margin: 15% 0 0 30%;}
	#topcon {height: 50px;}
	#homecon, #shopcon, #mycon {height: 82%; width: 100%; margin: 0 0 0 6px;}
	#freeicon {width: 110px; margin: 10% auto;}
	.category {font-size: 12px; margin: 2% 0;}
	.title {font-size: 18px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 10px;}
	.thumnail {width: 88%; margin: 5%;}
}


/* Samsung Galaxy S6, S7 (landscape) 640X360 */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 570px) {
	.container-fluid {width: 630px; height: 350px; background-image: url("/webView/img/640x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 30px; margin: 20% 0 0 35%;}
	#shopIcon {height: 30px; margin: 17% 0 0 80%;}
	#myIcon {height: 30px; margin: 17% 0 0 30%;}
	#topcon {height: 15%;}
	#homecon, #shopcon, #mycon {height: 85%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 125px; margin: 7% auto;}
	.category {font-size: 12px; margin: 2% 0;}
	.title {font-size: 16px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 12px; margin: 2% 0;}
	.thumnail {width: 88%; margin: 5%;}
}


/* Samsung Galaxy S8 (landscape) 740X360 */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 730px; height: 350px; background-image: url("/webView/img/740x360/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 35px; margin: 13% 0 0 30%;}
	#shopIcon {height: 35px; margin: 10% 0 0 80%;}
	#myIcon {height: 35px; margin: 10% 0 0 30%;}
	#topcon {height: 15%;}
	#homecon, #shopcon, #mycon {height: 85%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 125px; margin: 7% auto;}
	.category {font-size: 12px; margin: 2% 0;}
	.title {font-size: 16px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 12px; margin: 2% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

/* LG G3 (landscape) 853X480 */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 843px; height: 470px; background-image: url("/webView/img/853x480/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 40px; margin: 15% 0 0 40%;}
	#shopIcon {height: 40px; margin: 13% 0 0 80%;}
	#myIcon {height: 40px; margin: 13% 0 0 30%;}
	#topcon {height: 14%;}
	#homecon, #shopcon, #mycon {height: 85%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 165px; margin: 10% auto;}
	.category {font-size: 12px; margin: 2% 0;}
	.title {font-size: 18px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 12px; margin: 2% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

/* Samsung Galaxy Note4 (landscape) 960X540 */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 950px; height: 530px; background-image: url("/webView/img/960x540/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 40px; margin: 22% 0 0 40%;}
	#shopIcon {height: 40px; margin: 19% 0 0 80%;}
	#myIcon {height: 40px; margin: 19% 0 0 30%;}
	#topcon {height: 16%;}
	#homecon, #shopcon, #mycon {height: 80%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 185px; margin: 7% auto;}
	.category {font-size: 12px; margin: 2% 0;}
	.title {font-size: 18px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 12px; margin: 2% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

/* Tablet iPad (landscape) 1024X768 */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1014px; height: 758px; background-image: url("/webView/img/1024x768/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 40px; margin: 22% 0 0 40%;}
	#shopIcon {height: 40px; margin: 19% 0 0 80%;}
	#myIcon {height: 40px; margin: 19% 0 0 30%;}
	#topcon {height: 12%;}
	#homecon, #shopcon, #mycon {height: 86%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 245px; margin: 20% auto;}
	.category {font-size: 16px; margin: 4% 0;}
	.title {font-size: 24px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 16px; margin: 4% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

/* Tablet Tab10, Xperia Z4 (landscape) 1280X800 */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
	.container-fluid {width: 1270px; height: 790px; background-image: url("/webView/img/1280x800/bg.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#homeIcon {height: 50px; margin: 20% 0 0 40%;}
	#shopIcon {height: 50px; margin: 17% 0 0 80%;}
	#myIcon {height: 50px; margin: 17% 0 0 30%;}
	#topcon {height: 14%;}
	#homecon, #shopcon, #mycon {height: 84%; margin: 0 0 0 1%; padding: 1%;} 
	#freeicon {width: 245px; margin: 20% auto;}
	.category {font-size: 20px; margin: 4% 0;}
	.title {font-size: 24px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 18px; margin: 4% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

.contentcon {height: 100%; overflow-y: hidden; overflow-x: hidden}
p { color: white; text-decoration: none;}
a:hover {text-decoration: none;}


@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>
</head>
<body style="height: 100%; width: 100%; background-color: black;">

<div class="container-fluid">
	<div class="contentcon" style="height: 100%;">

		<div id="topcon" class="row">
			<div class="col-4">
				<div class="row" style="height: 100%;">
					<div class="col-6">
					<a href="/web/video/list?id=${member.id}">
						<img id="homeIcon" src="/webView/img/common/videoList/home_icon_on.png"/>
					</a></div>
					<div class="col-6"></div>
				</div>
			</div>
			<div class="col-4" style="padding: 0;"></div>
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
					<a href="/webView/view/jp/video/free.jsp?no=${video.no}&title=${video.title}&rt=${video.runningTime}&ex=${video.explain}&id=${member.id}">
					<div class="row" style="height: 45%; width: 99%; margin: 0 auto 1% auto; background-color: #3E2908;">
						<div class="col-3" style=" padding: 0 2% 0 2%;">
							<img id="freeicon" src="/webView/img/common/free/free_icon_main.png"/>
						</div>
						<div class="col-5" style=" padding: 0 1% 0 0; text-align: right;">
							<p class="category">基本的なビデオ</p>
							<p class="title">${video.title}</p>
							<p class="runningtime">running time <c:out value="${video.runningTime}"/></p>
						</div>
						<div class="col-4" style="padding: 0;">
							<img class="thumnail" src="/webView/img/thumnail/jp/${video.no}.png"/>
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