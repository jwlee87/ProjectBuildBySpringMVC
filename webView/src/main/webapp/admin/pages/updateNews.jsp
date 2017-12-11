<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title> 바카라 뉴스 </title>

<link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/admin/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/node_modules/summernote/dist/summernote.css" rel="stylesheet">

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
			
			<form method="POST" action="/admin/news/update">
				
				<input type="hidden" name="uniqueID" value="${news.uniqueID}"/>
				
				<div class="form-group">
					<input class="form-control" type="text" name="title" value="${news.title}"/>
				</div>
				
				
				<textarea id="summernote" name="content">
					${news.content}
				</textarea>
				
				
				<div class="row">
					<div class="col-10" style="text-align: right; padding-right: 2%;">
						<button class="btn btn-default" type="submit">수정</button>
					</div>
				</div>
				
			</form>

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

<!-- jQuery -->
<script src="/admin/vendor/jquery/jquery.min.js"></script>
<script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>
<script src="/admin/dist/js/sb-admin-2.js"></script>
<script src="/admin/dist/js/summernote.js"></script>
<script src="/admin/dist/js/summernote-ko-KR.js"></script>
<script>
function goPage(i){
	console.log("현재 페이지="+i);
	location.href="/admin/news/write/"+i
}
function goList(i){
	location.href="/admin/news/list/"+i;
}

$(document).ready(function(){
	
	$('#summernote').summernote({
		height: 600,
		focus: true,
		lang: 'ko-KR' // default: 'en-US'
	});
})

</script>

</body>

</html>
