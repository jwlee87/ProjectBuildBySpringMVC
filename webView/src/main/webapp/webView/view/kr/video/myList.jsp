<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>shop list</title>
<%@ include file="/WEB-INF/jsp/basicInclude.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">


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
	#shopcon {height: 82%; width: 100%; margin: 0 0 0 6px;}
	#priceIcon {width: 110px; margin: 10% auto;}
	.category {font-size: 15px; margin: 2% 0 0 0;}
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
	#topcon {height: 18%;}
	#myContent {height: 260px; margin-top: 1%;}
	#priceIcon {width: 100px; margin: 22% auto;}
	#myTitle {width: 100%; margin-top: 15%;}
	#info {margin-left: 38px; height: 270px;}
	#topRace {width: 100%;}
	#balanceCoin {font-size: 12px; margin: 8px auto;}
	#bottomRace {width: 100%;}
	#navirow {}
	#currentPage {padding: 0; margin: 15px 0 0 7px; font-weight: bold; font-size: 20px;}
	#leftBtn {width: 30px; margin-right: 10px;}
	#rightBtn {width: 30px; margin-left: 10px;}
	li a {color: white;}
	.category {font-size: 12px; margin: 6% 0;}
	.title {font-size: 15px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 12px; margin: 2% 0;}
	.thumnail {width: 88%; margin: 13% 0 13% 5%;}
	
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
	#shopcon {height: 85%; margin: 0 0 0 1%; padding: 1%;} 
	#priceIcon {width: 125px; margin: 7% auto;}
	.category {font-size: 12px; margin: 4% 0;}
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
	#shopcon {height: 85%; margin: 0 0 0 1%; padding: 1%;} 
	#priceIcon {width: 165px; margin: 10% auto;}
	.category {font-size: 12px; margin: 4% 0;}
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
	#topcon {height: 20%;}
	#shopcon {height: 80%; margin: 0 0 0 1%; padding: 1%;} 
	#priceIcon {width: 185px; margin: 7% auto;}
	.category {font-size: 12px; margin: 4% 0;}
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
	#shopcon {height: 86%; margin: 0 0 0 1%; padding: 1%;} 
	#priceIcon {width: 245px; margin: 20% auto;}
	.category {font-size: 16px; margin: 6% 0;}
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
	#shopcon {height: 84%; margin: 0 0 0 1%; padding: 1%;} 
	#priceIcon {width: 245px; margin: 20% auto;}
	.category {font-size: 20px; margin: 6% 0;}
	.title {font-size: 24px; font-weight: bold; margin: 0 auto;}
	.runningtime {font-size: 18px; margin: 4% 0;}
	.thumnail {width: 88%; margin: 5%;}
}

.contentcon {height: 100%; overflow-y: hidden; overflow-x: hidden}
p { color: white; text-decoration: none;}
a:hover {text-decoration: none;}

/* Preloader */
#preloader {position: fixed;top:0;left:0;right:0;bottom:0;background-color:#000;z-index:1000;}
#status {width:80px; height:80px; position:absolute; left:50%; top:50%; background-image:url(/webView/img/common/loadingIcon.gif); background-size:40px; background-repeat:no-repeat; background-position:center; margin:-40px 0 0 -40px;}


@import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);
 font-family: 'Noto Sans KR', sans-serif;

</style>
</head>
<body style="height: 100%; width: 100%; background-color: black;">

<div class="container-fluid">
	<div class="contentcon" style="height: 100%;">

		<div id="topcon" class="row">
		
		<div class="col-12">
			<div class="row" style="height: 100%;">
			<div class="col-4">
				<div class="row" style="height: 100%;">
					<div class="col-6">
						<a href="/web/video/list?id=${member.id}">
							<img id="homeIcon" src="/webView/img/common/videoList/home_icon_off.png"/>
						</a>
					</div>
					<div class="col-6"></div>
				</div>
			</div>
			<div class="col-4" style="padding: 0;"></div>
			<div class="col-4" style="padding: 0;">
				<div class="row" style="height: 100%;">
					<div class="col-6">
						<a href="/web/video/shop?id=${member.id}&cp=1">
							<img id="shopIcon" src="/webView/img/common/videoList/shop_icon_off.png"/>
						</a>
					</div>
					<div class="col-6">
						<a href="/web/video/my?id=${member.id}&cp=1">
							<img id="myIcon" src="/webView/img/common/videoList/my_icon_on.png"/>
						</a>
					</div>
				</div>
			</div>
			</div>
		</div>
			
		</div>
		
		<!-- video page -->
		<div class="row">
			<div id="info" class="col-2" style="border: 1px solid #EEBF00; border-radius: 5px;">
				<div class="row" style="height: 10%; text-align: center;">
					<div class="col-12" style="padding: 0 2%;">
						<img id="topRace" src="/webView/img/common/myList/topRace.png"/>
					</div>
				</div>
				<div class="row" style="height: 20%; text-align: center;">
					<div class="col-12">
						<img id="myTitle" src="/webView/img/common/myList/mypage_title.png"/>
					</div>
				</div>
				<div class="row" style="height: 40%;">
					<div class="col-12">
						<!-- navi row -->
							<div id="navirow" class="row">
								<div id="currentPage" class="col-12">
									<navi:page data="${pageResult}"/>
								</div>
							</div>
					</div> 
				</div>
				<div class="row" style="height: 20%; text-align: center;">
					<div class="col-12" style="padding: 0 12%; background-image: url('/webView/img/common/myList/mycoin_bar.png'); background-size: 100%; background-repeat: no-repeat; text-align: right;">
						<p id="balanceCoin" style="color:white; font-weight: blod;">${member.cashMoney}</p>
					</div>
				</div>
				<div class="row" style="height: 10%; text-align: center;">
					<div class="col-12" style="padding: 0 2%;">
						<img id="topRace" src="/webView/img/common/myList/bottomRace.png"/>
					</div>
				</div>
			</div>
		
			<div class="col-9" style="height: 100%;">
				<div id="mycon" class="row">
					<div id="myContent" class="col-12" style="padding: 0 2%; overflow: scroll;">
						<c:forEach var="video" items="${list}">
						<a href="/web/video/detail?id=${member.id}&no=${video.videoNo}">
							<div class="row" style="height: 45%; width: 99%; margin: 2% auto; background-color: #3E2908;">
								<div class="col-3" style=" padding: 0 2% 0 2%;">
									<c:if test="${video.price eq 6}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_6.png"/>
									</c:if>
									<c:if test="${video.price eq 8}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_8.png"/>
									</c:if>
									<c:if test="${video.price eq 10}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_10.png"/>
									</c:if>
									<c:if test="${video.price eq 12}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_12.png"/>
									</c:if>
									<c:if test="${video.price eq 14}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_14.png"/>
									</c:if>
									<c:if test="${video.price eq 16}">
										<img id="priceIcon" src="/webView/img/common/shopList/coin_16.png"/>
									</c:if>
								</div>
								<div class="col-5" style=" padding: 0 1% 0 0; text-align: right;">
									<p class="category">기본교육영상</p>
									<p class="title">${video.title}</p>
									<p class="runningtime">running time <c:out value="${video.runningTime}"/></p>
								</div>
								<div class="col-4" style="padding: 0;">
									<img class="thumnail" src="/webView/video/kr/thumnail/${video.no}.png"/>
								</div>
							</div>
						</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

<div id="preloader">
    <div id="status"></div>
</div>

<script>
function goPage(pageNo,id) {
	location.href = "/web/video/my?id="+id+"&cp="+pageNo;
}

$(window).on("load", function(){
	setTimeout(function(){ $("#preloader").hide(); }, 500);
})
</script>
</body>
</html>