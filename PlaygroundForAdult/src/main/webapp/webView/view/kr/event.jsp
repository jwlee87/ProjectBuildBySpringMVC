<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="kor">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">

<title>이벤트</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

/* Samsung Galaxy S7 (landscape) */
@media only screen
and (max-device-width : 640px)
and (min-device-width : 639px) {
	.container-fluid {width: 640px; height: 360px; background-size: cover; background-imgage: url(''); margin: 0 auto;}
}

/* Samsung Galaxy S8 (landscape) */
@media only screen
and (max-device-width : 740px)
and (min-device-width : 641px) {
	.container-fluid {width: 740px; height: 360px; background-size: cover; background-imgage: url(''); margin: 0 auto;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 853px)
and (min-device-width : 741px) {
	.container-fluid {width: 853px; height: 480px; background-size: cover; background-imgage: url(''); margin: 0 auto;}
}

/* Samsung Galaxy Note4 , LG G3 (landscape) */
@media only screen
and (max-device-width : 960px)
and (min-device-width : 852px) {
	.container-fluid {width: 960px; height: 540px; background-size: cover;  background-imgage: url(''); margin: 0 auto;}
}

/* Tablet Tab10, Xperia Z4 (landscape) */
@media only screen
and (min-device-width : 1280px)
and (max-device-width : 961px)
and (orientation : landscape) {
	.container-fluid {width: 1280px; height: 800px; background-size: cover; background-imgage: url(''); margin: 0 auto;}
}

iframe {
	border: 0;
	overflow-y: hidden;
	background-color: black;
}

</style>
</head>
<body style="background-color: black;">

<div class="container-fluid">
	
	<!-- top -->
	<div class="row" style="height: 100%;">
	</div>

	<!-- contents -->
	<div class="contentcon" style="height: 100%;">
		<div class="row">
			<div class="col-12" style="padding: 0 2% 0 2%;">
			<iframe class="col-12" style="padding: 0 0; height: 80%;"></iframe>
			</div>
		</div>
	</div>
	
</div>


</body>
</html>