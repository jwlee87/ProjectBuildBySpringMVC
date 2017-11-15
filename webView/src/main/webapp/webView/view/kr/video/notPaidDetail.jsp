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
<title>detail</title>
<%@ include file="/WEB-INF/jsp/basicInclude.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

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
	#rt {font-size: 10px; margin: 0;}
	#exit_btn{height: 25px; margin: 0 0 0 -5px;}
	#buyBtn {height: 25px; margin: 0;}
}

/* Samsung Galaxy S6, S7 (landscape) 640X360 */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 570px) {
	.container-fluid {width: 630px; height: 350px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#icon{height: 90px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 16px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 14px; margin: 0; padding: 0;}
	#rt {font-size: 10px; margin: 10px 0 0 0;}
	#exit_btn {height: 25px; margin:0;}
	#bonusMoney {height: 30px;}
	#buyBtn {height: 30px; margin: -5px 0 0 0;}
	#modalcon {width: 300px; height: 200px; display: none;
		background-color: black; opacity: 1; z-index: 1; position: absolute; top: 22%; left: 30%; border: 1px solid gold; border-radius: 5%;}
	#coinImg {width: 30px;}
}

/* Samsung Galaxy S8 (landscape) 740X360 */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 730px; height: 350px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 10px auto;}
	#icon{height: 95px;}
	#cate {margin: 0 0 -10px 0; font-size: 12px; font-weight: bold;}
	#title {font-size: 16px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 14px;}
	#rt {font-size: 12px; margin: 0 0 0 0;}
	#exit_btn{height: 25px; margin:-5px -30px 15px 15px;}
	#buyBtn {height: 35px; margin: 0;}
}

/* LG G3 (landscape) 853X480 */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 843px; height: 470px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 30px auto;}
	#icon{height: 120px;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 20px;}
	#buyBtn {height: 41px; margin: 0;}
}

/* Samsung Galaxy Note4 (landscape) 960X540 */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 950px; height: 530px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#icon{height: 140px;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 27px;}
	#buyBtn {height: 45px; margin: 0;}
}

/* Tablet iPad (landscape) 1024X768 */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1014px; height: 758px; background-image: url("/webView/img/1024x768/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#icon{height: 160px; margin: 20px auto;}
	#cate {margin: 0 0 -10px 0; font-size: 16px; font-weight: bold;}
	#title {font-size: 20px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 18px;}
	#rt {font-size: 14px; margin: 0 0 0 0;}
	#exit_btn{height: 30px; margin:-5px -30px 15px 27px;}
	#buyBtn {height: 50px; margin: 0;}
}


/* Tablet Tab10, Xperia Z4 (landscape) 1280X800 */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
	.container-fluid {width: 1270px; height: 790px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat; overflow-y: hidden; overflow-x: hidden; margin: 0; padding: 5px;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
	#thumnail {width: 100%; margin: 40px auto;}
	#icon{height: 200px;}
	#cate {margin: 0 0 -10px 0; font-size: 18px; font-weight: bold;}
	#title {font-size: 24px; font-weight: bold; margin: 8% auto;}
	#explain {font-size: 22px;}
	#rt {font-size: 20px; margin: 0 0 0 0;}
	#exit_btn{height: 32px; margin:0px 0px 15px 40px;}
	#buyBtn {height: 60px; margin: 0;}
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

		<!-- layer -->
		<div id="modalcon" class="row" style="text-align: center;">
			
			<!-- first alert -->
			<div id="firstAlert" style="width: 100%; height: 100%;">
				<div class="col-12" style="height: 20%; padding: 0 2%; margin: 0;">
					<p style="color: white; font-weight: bold;">[ 알 림 ]</p>
				</div>
				<div class="col-12" style="height: 35%; padding: 0; margin: 0;">
					<p style="color: white; font-weight: bold; font-size: 0.7em;">
						본 영상을 구매하시겠습니까?<br/>
						-확인- 을 누르면 보유 코인에서<br/>
						자동으로 차감됩니다.
					</p>
				</div>
				<div class="col-12" style="height: 25%; padding: 0; margin: 0;">
					<div class="row" style="width: 100%; height: 100%; text-align: center;">
						<div class="col-3"></div>
						<div class="col-2">
							<img id="coinImg" src="/webView/img/common/paid/coin.png"/>
						</div>
						<div class="col-6">
							<p style="color: gold; font-weight: bold; font-size: 1.4em;">
								<c:out value="${video.price}"/> 코인
							</p>
						</div>
					</div>
				</div>
				<div class="col-12" style="height: 25%; padding: 0; margin: 0;">
					<div class="row" style="padding: 0; margin: 0; width: 100%; height: 100%;">
						<div class="col-2"></div>
						<div class="col-4">
							<a href="#close" rel="modal:close">
								<button type="button" class="btn btn-default btn-sm" style="font-weight: bold; color: white;">취소</button>
							</a>
						</div>
						<div class="col-4">
							<button id="checkBtn" type="button" class="btn btn-warning btn-sm" style="font-weight: bold; color: white;">확인</button>
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
			
			<!-- second alert -->
			<div id="secondAlert" style="width: 100%; height: 100%; display: none">
				<div class="col-12" style="height: 20%; padding: 0 2%; margin: 0;">
					<p style="color: white; font-weight: bold;">[ 알 림 ]</p>
				</div>
				<div class="col-12" style="height: 35%; padding: 0; margin: 0;">
					<p style="color: white; font-weight: bold; font-size: 0.7em;">
						<br/>
						<br/>
						보유 코인이 부족합니다.
					</p>
					<a href="#close" rel="modal:close">
						<button id="shortOfCoin" type="button" class="btn btn-default btn-sm" style="font-weight: bold; color: white;">확인</button>
					</a>
				</div>
			</div>
			
			<!-- thirdAlert -->
			<div id="thirdAlert" style="width: 100%; height: 100%; display: none">
				<div class="col-12" style="height: 20%; padding: 0 2%; margin: 0;">
					<p style="color: white; font-weight: bold;">[ 알 림 ]</p>
				</div>
				<div class="col-12" style="height: 55%; padding: 0; margin: 0;">
					<p style="color: white; font-weight: bold; font-size: 0.7em;">
						영상이 구입되었습니다.<br/>
						- 구입하신 영상은 &lt; MY &gt; 페이지에서 확인/ 시청이 가능합니다.<br/>
						- 보너스 지급 머니는 &lt; 메시지 &gt;함으로 확인/ 수령이 가능합니다.<br/>
					</p>
				</div>
				<div class="col-12" style="height: 25%; padding: 0; margin: 0; text-align: center;">
					<a href="/web/video/list?id=${id}"><button class="btn btn-warning btn-sm">확인</button></a>
				</div>
			</div>
			
		</div>

		<!-- detail -->
		<div id="detailcon" class="row">
			<div class="col-12" style="padding: 1% 2% 0 2%; height:100%;">
				<div class="row" style="height: 100%; padding: 0 2%;">
				
				<div class="col-7" style="padding: 0; height: 100%;">
					<img id="thumnail" src="/webView/video/kr/thumnail/${video.no}_thumnail.png"/>
				</div>
				<div class="col-5" style="padding: 1%; height: 100%;">
					<div class="row" style="height: 25%;">
						<div class="row" style="width: 100%; height: 30%;">
							<div class="col-3">
								<c:if test="${video.price eq 6}">
									<img id="icon" src="/webView/img/common/shopList/coin_6.png"/>
								</c:if>
								<c:if test="${video.price eq 8}">
									<img id="icon" src="/webView/img/common/shopList/coin_8.png"/>
								</c:if>
								<c:if test="${video.price eq 10}">
									<img id="icon" src="/webView/img/common/shopList/coin_10.png"/>
								</c:if>
								<c:if test="${video.price eq 12}">
									<img id="icon" src="/webView/img/common/shopList/coin_12.png"/>
								</c:if>
								<c:if test="${video.price eq 14}">
									<img id="icon" src="/webView/img/common/shopList/coin_14.png"/>
								</c:if>
								<c:if test="${video.price eq 16}">
									<img id="icon" src="/webView/img/common/shopList/coin_16.png"/>
								</c:if>
							</div>
							<div class="col-3"></div>
							<div class="col-4"></div>
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
					<div class="row" style="height: 5%;">
						<hr class="hr"/>
						<div class="col-12" style="text-align: center;">
							<p id="rt" style="color: white;">
							<c:out value="${video.runningTime}"/></p>
						</div>
						<hr class="hr"/>
					</div>
						
					<div class="row" style="height: 25%;">
						<div class="col-12" style="text-align: center;">
						<p id="title" style="color: white;">
						<c:out value="${video.title}"/></p>
						</div>
					</div>
					
					<div class="row" style="height: 20%;">
						<div class="col-12" style="text-align: center; height: 100%;">
							<p id="explain" style="color: white;">
							<c:out value="${video.explain}"/></p>
						</div>
					</div>
					
					<div class="row" style="height: 15%">
						<div class="col-7" style="text-align: center; height: 100%; margin: 0 auto;">
							<img id="bonusMoney" src="/webView/img/common/paid/gold.png" style="float: left;">
							<p style="color: white; font-weight: bold;">
								<c:if test="${video.price eq 6}">12,000</c:if>
								<c:if test="${video.price eq 8}">16,000</c:if>
								<c:if test="${video.price eq 10}">20,000</c:if>
								<c:if test="${video.price eq 12}">24,000</c:if>
								<c:if test="${video.price eq 14}">28,000</c:if>
								<c:if test="${video.price eq 16}">32,000</c:if>
								 지급</p>
						</div>
					</div>
					
					<div class="row" style="height: 10%; float: center;">
						<div class="col-3"></div>
						<div class="col-6">
							<img id="buyBtn" src="/webView/img/common/paid/buy_btn.png"/>
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

$("#buyBtn").on("click", function(){

	$("#modalcon").modal({
		showClose: false
	});
	return false;
	
})

$("#checkBtn").on("click", function(){
	
	var data = {};
	data["id"] = '${id}';
	data["videoNo"] = ${video.videoNo};
	
	$.ajax({
		type: "POST"
		, url: "/web/video/buyCheck"
		, data: data
		, dataType: "json"
		, success: function(data){
			if(data.check == "false"){
				//돈 부족
				console.log("돈 부족");
				$("#firstAlert").hide();
				$("#thirdAlert").hide();
				$("#secondAlert").show();
				return;
			} else if(data.check == "success"){
				//구매 성공
				console.log("성공");
				$("#secondAlert").hide();
				$("#firstAlert").hide();
				$("#thirdAlert").show();
				return;
			}
			
		}
	})
	
})

$("#shortOfCoin").on("click", function(){
	$("#firstAlert").show();
	$("#secondAlert").hide();
	$("#thirdAlert").hide();
})
</script>
</body>
</html>