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
<link href="/node_modules/summernote/dist/summernote.css" rel="stylesheet">

<style>
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
			
			<form method="POST" action="/admin/news/write">
			
				<div class="form-group">
					<input class="form-control" type="text" name="title" placeholder="제목을 입력하세요."/>
				</div>
				
				<textarea id="summernote" name="content">내용을 입력하세요.</textarea>

				<div class="row">
					<div class="col-10" style="text-align: right; padding-right: 2%;">
						<button class="btn btn-default" type="submit">작성</button>
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

<div id="preloader">
	<div id="status"></div>
</div>

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

$('#summernote').summernote({
	height: 600,
	focus: true,
	lang: 'ko-KR' // default: 'en-US'
});

$(window).on("load", function(){
	setTimeout(function(){ $("#preloader").hide(); }, 500);
})
</script>

</body>

</html>
