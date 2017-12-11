<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi"%>
<!DOCTYPE html>
<html>
<head>
<title>바카라 뉴스</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>

table.table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    width: 100%;
    overflow: hidden;
}

table tbody tr td {}

#preloader {position: fixed;top:0;left:0;right:0;bottom:0;background: rgba(255, 255, 255, 0.9);z-index:1000;}
#status {width:60px; height:60px; position:absolute; left:50%; top:50%; background-image:url(/webView/img/common/loadingIcon.gif); background-size:40px; background-repeat:no-repeat; background-position:center; margin:-30px 0 0 -30px;}

</style>
</head>
<body>
<div class="container-fluid">
	<h2 style="font-weight: bold;">바카라 뉴스</h2>
	<br>
	<p> 전세계 바카라에 대한  소식을  생생히 전해드립니다.</p>
	<br>
<div class="panel panel-default">
	<div class="panel-body">
<table class="table table-striped" style="table-layout:fixed;">
  	<colgroup>
    	<col style="width: 10%;">
    	<col style="width: 65%;">
    	<col style="width: 25%;">
  	</colgroup>
	<tr>
        <th>${news.uniqueID}</th>
        <th>${news.title}</th>
        <th style="font-size: 0.8em;"><fmt:formatDate value="${news.genDate}" pattern="MM/dd hh:mm"/></th>
	</tr>
	<tr>
        <td colspan="3" id="content" style="overflow: scroll;">
        </td>
	</tr>
</table>
	</div>
</div>

<div class="row">
	<div class="col-12" style="text-align: center;">
		<div class="btn-group">
    		<button type="button" class="btn btn-default" onclick="javascript:goList(${pageResult.page})">목록</button>
		</div>
	</div>
</div>

</div>

<div id="preloader">
	<div id="status"></div>
</div>

<input type="hidden" value="${news.content}"/>

<script>
function goPage(i,uniqueID){
	console.log("현재 페이지="+i);
	location.href="/ndb/b_news/jsp/"+i+"/"+uniqueID;
}
function goList(i){
	location.href="/ndb/b_news/"+i;
}
$(document).ready(function(){
	var a = $("input[type='hidden']").val();
	$("#content").html(a);
})

$(window).on("load", function(){
	setTimeout(function(){ $("#preloader").hide(); }, 500);
})
</script>
</body>
</html>