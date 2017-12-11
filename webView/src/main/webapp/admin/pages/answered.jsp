<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

<title> 1:1 문의 게시판 </title>

<!-- Bootstrap Core CSS -->
<link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- DataTables CSS -->
<link href="/admin/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link href="/admin/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/admin/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<style>
td {padding: 1%;}
button {float: right; margin-right: 1%;}
</style>

</head>

<body>

    <c:import url="/admin/pages/common/commonNavi.jsp"></c:import>

    <!-- 본문 시작 -->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-10">
                <h2 class="page-header">1:1 문의 - 답변하기</h2>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                                            문의 유형:
                      <c:if test="${ask.askType eq '0 '}">&nbsp;결제/환불 문의</c:if>
                      <c:if test="${ask.askType eq '1 '}">&nbsp;계정 문의</c:if>
                      <c:if test="${ask.askType eq '2 '}">&nbsp;게임 문의</c:if>
                      <c:if test="${ask.askType eq '3 '}">&nbsp;서버/시스템 장애</c:if>
                      <c:if test="${ask.askType eq '4 '}">&nbsp;이벤트 문의</c:if>
                      <c:if test="${ask.askType eq '5 '}">&nbsp;버그 제보</c:if>
                      <c:if test="${ask.askType eq '6 '}">&nbsp;건의</c:if>
                      <c:if test="${ask.askType eq '7 '}">&nbsp;기타 문의</c:if>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table-striped" style="width: 100%;">
                                <tbody>
								    <tr>
								        <td style="width:15%; min-width: 80px;">문의번호</td>
								        <td>${ask.uniqueNo}</td>
								    </tr>
								    <tr>
								        <td>제목</td>
								        <td>${ask.title}</td>
                                    </tr>
								    <tr>
								        <td>글쓴이</td>
								        <td>${user.id}</td>
								    </tr>
								    <tr>
								        <td>작성일시</td>
								        <td>${ask.askDate}</td>
								    </tr>
								    <tr>
								        <td>문의내용</td>
								        <td>${ask.askContent}</td>
								    </tr>
								</tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <c:if test="${!empty list}">
        <c:forEach items="${list}" var="answer">
        <div class="row">
            <div class="col-lg-10">
                <div class="panel panel-default">
                    <div class="panel-heading">
                                            답변내용
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table-striped" style="width: 100%;">
                                <tbody>
                                    <tr>
                                        <td style="width:15%; min-width: 80px;">답변번호</td>
                                        <td>${answer.uniqueNo}</td>
                                    </tr>
                                    <tr>
                                        <td>답변자</td>
                                        <td>${answer.respondent}</td>
                                    </tr>
                                    <tr>
                                        <td>답변일시</td>
                                        <td>${answer.answerDate}</td>
                                    </tr>
                                    <tr>
                                        <td>답변내용</td>
                                        <td>${answer.answer}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel panel=default -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        </c:forEach>
        </c:if>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

<!-- jQuery -->
<script src="/admin/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/admin/dist/js/sb-admin-2.js"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
$(document).ready(function() {
    $('#dataTables-example').DataTable({
        responsive: true
    });
});
</script>

</body>

</html>
