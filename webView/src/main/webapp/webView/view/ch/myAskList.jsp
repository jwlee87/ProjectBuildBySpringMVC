<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>My Ask List</title>

    <!-- Bootstrap Core CSS -->
    <link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
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

    <div>
        <div id="page-wrapper" style="width:100%; margin: 0 auto;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">문의내역</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <h5 class="col-lg-12">1:1 문의 답변 관련 안내</h5>
                    </div>
                    <div class="row">
                        <h6 class="col-lg-10" style="float: left;">신속하게 답변드릴 수 있도록 최선을 다하겠습니다.<br>
                        &nbsp;기본적인 문의의 경우 FAQ를 통해 관련 내용을 확인 하실 수 있으니 참고 부탁드립니다.
                        </h6>
                        <div class="col-lg-2">
                            <a href="/web/ask/${user.uniqueID}4581">
                                <button type="button" class="btn btn-info" style="float: right;">문의하기</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                                                    문의 내역
                        </div>
                        <!-- /.panel-heading -->
	                    <div class="panel-body">
	                        <table class="table table-striped table-bordered table-hover" id="dataTables">
	                            <thead>
	                                <tr>
	                                    <th style="min-width: 13%;">번호</th>
	                                    <th>문의유형</th>
	                                    <th>제목</th>
	                                    <th>작성일</th>
	                                    <th style="min-width: 13%;">답변</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach items="${list}" var="ask">
	                                    <tr class="odd gradeX">
	                                        <td>${ask.uniqueNo}</td>
	                                        <c:if test="${ask.askType eq '0 '}"><td>결제/환불 문의</td></c:if>
	                                        <c:if test="${ask.askType eq '1 '}"><td>계정 문의</td></c:if>
	                                        <c:if test="${ask.askType eq '2 '}"><td>게임 문의</td></c:if>
	                                        <c:if test="${ask.askType eq '3 '}"><td>서버/시스템 장애</td></c:if>
	                                        <c:if test="${ask.askType eq '4 '}"><td>이벤트 문의</td></c:if>
	                                        <c:if test="${ask.askType eq '5 '}"><td>버그 제보</td></c:if>
	                                        <c:if test="${ask.askType eq '6 '}"><td>건의</td></c:if>
	                                        <c:if test="${ask.askType eq '7 '}"><td>기타 문의</td></c:if>
	                                        <td>
	                                            <a href="/admin/pages/myAskDetail/${ask.uniqueNo}">
	                                            ${ask.title}
	                                            </a>
	                                        </td>
	                                        <td class="center">${ask.askDateToStr}</td>
	                                        <c:if test="${ask.answerCheck}">
	                                           <td><span style="color: blue; font-weight: bold">O</span></td>
	                                        </c:if>
	                                        <c:if test="${!ask.answerCheck}">
	                                           <td>X</td>
	                                        </c:if>
	                                    </tr>
	                                </c:forEach>
	                            </tbody>
	                        </table>
	                        <!-- /.table-responsive -->
	                    </div>
	                    <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->
    </div>

<!-- jQuery -->
<script src="/admin/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/admin/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/admin/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/admin/dist/js/sb-admin-2.js"></script>

<script>
$(document).ready(function() {
    $('#dataTables').DataTable({
        responsive: true
    });
    $("#dataTables_length > label").text("");
    $("#dataTables_filter > label").text("");
});
</script>

</body>

</html>