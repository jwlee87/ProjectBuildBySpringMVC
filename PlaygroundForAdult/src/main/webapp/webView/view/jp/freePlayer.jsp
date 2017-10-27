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
	margin: 0;
	background-color: black;
}
.absolute {
 position: absolute;
 top: 1%;
 right: 0;
 left: 96%;
 height: 0;
}
</style>
</head>
<body class="container-fluid">
	<video id="player" width=100% height=100% style="margin: auto;" controls controlsList="nodownload" autoplay="autoplay">
		<source src="/webView/video/jp/bm_j_${param.no}_f.mp4" type="video/mp4">
	</video>
	<div class="absolute">
		<a href="javascript:history.go(-1)"><img width="70%" height="auto" src="/webView/img/common/free/exit_btn.png"/></a>
	</div>
</body>
</html>
