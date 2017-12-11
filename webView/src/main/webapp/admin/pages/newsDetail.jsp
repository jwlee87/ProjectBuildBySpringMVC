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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> 바카라 뉴스 </title>

<link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/admin/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style>
a:hover {text-decoration: none;}
#preloader {position: fixed;top:0;left:0;right:0;bottom:0;background: rgba(255, 255, 255, 0.9);z-index:1000;}
#status {width:60px; height:60px; position:absolute; left:50%; top:50%; background-image:url(/webView/img/common/loadingIcon.gif); background-size:40px; background-repeat:no-repeat; background-position:center; margin:-30px 0 0 -30px;}
</style>
</head>

<body>

	<c:import url="/admin/pages/common/commonNavi.jsp"></c:import>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-10">
                <h1 class="page-header"> 네버다이바카라 </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-10">
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
						        <th style="font-size: 1em; text-align: right; font-weight: normal;">
						        	<fmt:formatDate value="${news.genDate}" pattern="yyyy/MM/dd hh:mm"/>
						        </th>
							</tr>
							<tr>
						        <td colspan="3" id="content" style="overflow: scroll;">
						        </td>
							</tr>
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-5" style="text-align: right; padding-right: 1%;">
						<a href="/admin/news/update/${page}/${news.uniqueID}">
							<button id="updateBtn" class="btn btn-default">수정</button>
						</a>
						<a href="/admin/news/delete/${news.uniqueID}">
							<button id="deleteBtn" class="btn btn-danger">삭제</button>
						</a>
					</div>
				</div>

				<div class="row">
					<div class="col-12" style="text-align: center;">
						<div class="btn-group">
				   			<button type="button" class="btn btn-default" onclick="javascript:goList(${page})">목록</button>
						</div>
					</div>
				</div>
				
				
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->
	<input type="hidden" value="${news.content}"/>

<div id="preloader">
	<div id="status"></div>
</div>

<!-- jQuery -->
<script src="/admin/vendor/jquery/jquery.min.js"></script>
<script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>
<script src="/admin/dist/js/sb-admin-2.js"></script>

<script>
function goPage(i){
	console.log("현재 페이지="+i);
	location.href="/admin/news/write/"+i
}
function goList(i){
	location.href="/admin/news/list/"+i;
}

$(document).ready(function(){
	var a = $("input[type='hidden']").val();
	$("#content").html(a);
})

$("#deleteBtn").on("click", function(){
	var check = confirm("삭제하시겠습니까?");
})

$(window).on("load", function(){
	setTimeout(function(){ $("#preloader").hide(); }, 500);
})
</script>

</body>

</html>
