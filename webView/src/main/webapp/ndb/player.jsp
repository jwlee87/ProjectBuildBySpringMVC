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

<title>player</title>

<link rel="stylesheet" href="/node_modules/bootstrap/css/bootstrap.min.css"/>

<script src="/node_modules/jquery/dist/jquery.min.js"></script>
<script src="/webView/bootstrap/js/popper.min.js"></script>
<script src="/node_modules/bootstrap/js/bootstrap.js"></script>

<style>

/* Preloader */
body {background-color: black;}
video::-webkit-media-controls-fullscreen-button {
    display: none;
}
#preloader {position: fixed;top:0;left:0;right:0;bottom:0;background-color:#000;z-index:1000;}
#status {width:60px; height:60px; position:absolute; left:50%; top:50%; background-image:url(/webView/img/common/loadingIcon.gif); background-size:40px; background-repeat:no-repeat; background-position:center; margin:-30px 0 0 -30px;}


</style>
</head>
<body style="margin: 0; padding: 0;">
    <video class="container-fluid" id="player" poster="/webView/video/kr/thumnail/${no}_thumnail.png" controls controlsList="nodownload" style="margin: 0; padding: 0;">
        <source src="/webView/video/kr/bm_k_${no}.mp4" type="video/mp4">
    </video>
	<div id="preloader">
        <div id="status"></div>
    </div>
<script>
$(window).on("load", function(){
	setTimeout(function(){ $("#preloader").hide(); }, 500);
    var height = $("body").outerHeight(true);
    var width = $("video").outerWidth(true);
    console.log("height= "+height);
    console.log("width= "+width);
	
    if( 400 < width && width <=740 ){
    	$("#player").css("height",360);
    }
})
</script>
</body>
</html>
