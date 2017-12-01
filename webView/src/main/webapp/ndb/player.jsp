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
body {-webkit-transform: rotate(90deg); background-color: black;}
video::-webkit-media-controls-fullscreen-button {
    display: none;
}


</style>
</head>
<body style="margin: 0; padding: 0;">
    <video class="container-fluid" id="player" poster="/webView/video/kr/thumnail/${no}_thumnail.png" controls controlsList="nodownload" style="margin: 0; padding: 0;">
        <source src="/webView/video/kr/bm_k_${no}.mp4" type="video/mp4">
    </video>
<script>
$(window).on("load", function(){
    
    var height = $("body").outerHeight(true);
    var width = $("video").outerWidth(true);
    console.log("height= "+height);
    console.log("width= "+width);
    
    if(300 <= height && height < 768){
        height = 360;
        width = 630;
        /* $("#player").css("margin-left","5px").css("margin-bottom","-5px"); */
        console.log("iPhone6 Plus height= "+height+", width= "+width);
    }else if( 768 <= height && height < 1024 ){
        width = 800;
        $("#player").css("margin-left","250px");
        console.log("iPad height= "+height);
    } else if( height <= 1024 && height < 1280) {
        width = 1000;
        $("#player").css("margin-left","400px");
        console.log(height);
    }
    $("#player").width(width).css("opacity","1");

})
</script>
</body>
</html>
