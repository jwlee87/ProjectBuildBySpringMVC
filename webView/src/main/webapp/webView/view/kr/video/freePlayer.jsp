<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">

<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

<title>videoPlayer</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>
body {
	margin: 0 auto;
	vertical-align: middle;
	text-align: center;
	background-color: black;
}

/* 4inch smart phone iPone5(landscape) 568X320 */
@media only screen
and (max-device-width : 569px)
and (min-device-width : 360px) {
	.container-fluid{padding: 0;}
	.absolute {position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 20px;}
}

/* Samsung Galaxy S6, S7 (landscape) 640X360 */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 570px) {
	.container-fluid{padding: 0; width: 630px; height: 350px;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{height: 100%; overflow: hidden;}
}

/* Samsung Galaxy S8 (landscape) 740X360 */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid{padding: 0; width: 730px; height: 350px;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{height: 100%; overflow: hidden;}
}

/* LG G3 (landscape) 853X480 */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid{padding: 0; width: 843px; height: 470px;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{height: 100%; overflow: hidden;}
}

/* Samsung Galaxy Note4 (landscape) 960X540 */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid{padding: 0;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{height: 100%; overflow: hidden;}
}

/* Tablet iPad (landscape) 1024X768 */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid{padding: 0; width: 1014px; height: 758px;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{width: 100%; overflow: hidden;}
}


/* Tablet Tab10, Xperia Z4 (landscape) 1280X800 */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
	.container-fluid{padding: 0; width: 1270px; height: 790px;}
	.absolute{position: fixed; top: 5px; right: 5px;}
	.absolute img {width: 30px;}
	#player{width: 100%; overflow: hidden;}
}
</style>
</head>
<body class="container-fluid">
	<video id="player" style="margin: 0 auto;" poster="/webView/video/kr/thumnail/${param.no}_thumnail.png" controls controlsList="nodownload">
		<source src="/webView/video/kr/bm_k_${param.no}.mp4" type="video/mp4">
	</video>
	<div class="absolute">
		<a href="javascript:history.go(-1)"><img src="/webView/img/common/free/exit_btn.png"/></a>
	</div>
</body>
</html>
