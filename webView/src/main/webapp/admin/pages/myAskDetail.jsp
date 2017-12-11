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
    <!-- jquery modal -->
    <link rel="stylesheet" href="/node_modules/jquery-modal/jquery.modal.min.css"/>
<style>
td {padding: 0.5%;}
button {float: right; margin: 0.5%;}
#modalcon {display:none;}
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
                            <a href="/admin/${user.uniqueID}/askList">
                                <button type="button" class="btn btn-info" style="float: right;">확인</button>
                            </a>
                            <a href="javascript:deleteBtn();">
                                <button type="button" class="btn btn-default delete" style="float: right;">삭제</button>
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
                                            문의내용
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
                                        <td>문의유형</td>
                                        <td>
	                                    <c:if test="${ask.askType eq '0 '}">결제/환불 문의</c:if>
					                    <c:if test="${ask.askType eq '1 '}">계정 문의</c:if>
					                    <c:if test="${ask.askType eq '2 '}">게임 문의</c:if>
					                    <c:if test="${ask.askType eq '3 '}">서버/시스템 장애</c:if>
					                    <c:if test="${ask.askType eq '4 '}">이벤트 문의</c:if>
					                    <c:if test="${ask.askType eq '5 '}">버그 제보</c:if>
					                    <c:if test="${ask.askType eq '6 '}">건의</c:if>
					                    <c:if test="${ask.askType eq '7 '}">기타 문의</c:if>
				                        </td>
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
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                                            답변내용
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table-striped" style="width: 100%;">
                                <tbody>
                                    <%-- <tr>
                                        <td style="width:15%; min-width: 80px;">답변번호</td>
                                        <td>${answer.uniqueNo}</td>
                                    </tr> --%>
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
    </div>
    
    <div id="modalcon" class="row" style="text-align: center;">
        <p> 삭제하신 문의와 답변은 다시 볼 수 없습니다.</p>
        <p> 그래도 삭제 하시겠습니까?</p>
        <a href="/admin/delete/${ask.uniqueNo}">
            <button class="btn btn-info" style="float: none; width: 15%;">예</button>
        </a>
        <a href="#close" rel="modal:close">
            <button class="btn btn-default" style="float: none; width: 15%;">아니오</button>
        </a>
    </div>
    <!-- /#modalcon -->

    <!-- jQuery -->
    <script src="/admin/vendor/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/admin/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="/admin/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/admin/dist/js/sb-admin-2.js"></script>
    <!-- jquery modal -->
    <script src="/node_modules/jquery-modal/jquery.modal.min.js"></script>
<script>
function deleteBtn(){
	$("#modalcon").modal({
        showClose: false
    });
    return false;
}

</script>
</body>

</html>