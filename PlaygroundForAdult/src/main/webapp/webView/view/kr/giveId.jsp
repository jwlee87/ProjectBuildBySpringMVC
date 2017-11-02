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
/* 4inch smart phone iPone5(landscape) */
@media only screen
and (max-device-width : 568px)
and (min-device-width : 360px) {
	.container-fluid {width: 568px; height: 320px; background-image: url("/webView/img/568x320/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 639px) {
	.container-fluid {width: 640px; height: 360px; background-image: url("/webView/img/640x360/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-image: url("/webView/img/740x360/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-image: url("/webView/img/853x480/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 854px) {
	.container-fluid {width: 960px; height: 540px; background-image: url("/webView/img/960x540/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}

/* Tablet iPad (landscape) */
@media only screen
and (max-device-width : 1024px)
and (min-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1024px; height: 768px; background-image: url("/webView/img/1024x768/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
}


/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (max-device-width : 2440px)
and (min-device-width : 1025px)
and (orientation : landscape) {
	.container-fluid {width: 1280px; height: 800px; background-image: url("/webView/img/1280x800/bg_without.png"); background-repeat: no-repeat;}
	#detailcon {height: 100%; padding:2%; overflow: hidden;}
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
		<div id="detailcon" class="row" style="text-align: center;">
			<p style="color: white; font-weight: bold;">회원님의 아이디는 <c:out value='${param.id}'/> 입니다.</p>
		</div>

	</div>
</div>

<script>

</script>
</body>
</html>