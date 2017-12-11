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

</head>

<body>

	<c:import url="/admin/pages/common/commonNavi.jsp"></c:import>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-10">
                <h1 class="page-header"> 고객 1:1 문의 </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-10">
				<table class="table table-striped table-bordered table-hover" id="dataTables">
					<thead>
						<tr>
							<th style="width: 11%;">목차</th>
							<th style="width: 11%;">문의번호</th>
							<th>문의유형</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list}" var="ask">
						<tr class="odd gradeX">
							<td>${ask.rowNum}</td>
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
								<a href="/admin/answer/${ask.uniqueNo}/">
									${ask.title}
								</a>
							</td>
							<td>${ask.writer}</td>
							<td class="center">${ask.askDateToStr}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<!-- /.table-responsive -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

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
<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
$(document).ready(function() {
    $('#dataTables').DataTable({
        responsive: true
    });
});
</script>

</body>

</html>
