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

    <title>1:1 문의하기</title>

    <!-- Bootstrap Core CSS -->
    <link href="/admin/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- MetisMenu CSS -->
    <link href="/admin/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/admin/dist/css/sb-admin-2.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/admin/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
</head>

<body>

    <div>
        <div id="page-wrapper" style="width:100%; margin: 0 auto;">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">1:1 문의</h1>
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
                            <a href="/admin/${member.uniqueID}/askList">
                                <button type="button" class="btn btn-info" style="float: right;">문의내역</button>
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
                                                    정보 입력
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <form role="form" action="/ask/write" method="POST">
                                        <div class="form-group">
                                            <label>아이디</label>
                                            <input class="form-control" type="text" name="writer" value="${member.id}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>문의유형</label>
                                            <select class="form-control" name="askType" required>
                                                <option value="0">결제/환불 문의</option>
                                                <option value="1">계정 문의</option>
                                                <option value="2">게임 문의</option>
                                                <option value="3">서버/시스템 장애</option>
                                                <option value="4">이벤트 문의</option>
                                                <option value="5">버그 제보</option>
                                                <option value="6">건의</option>
                                                <option value="7">기타 문의</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input class="form-control" type="text" name="title" required>
                                        </div>
                                        <div class="form-group">
                                            <label>문의내용</label>
                                            <textarea class="form-control" rows="4" name="askContent" required></textarea>
                                        </div>
                                        <div class="form-group" style="float: right;">
                                            <button type="submit" class="btn btn-info">제출</button>
                                            <button type="reset" class="btn btn-default">초기화</button>
                                        </div>
                                        <input type="hidden" name="date" value="javascript:getDate()"/>
                                    </form>
                                </div>
                                <!-- /.col-lg-12 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
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
    <!-- Custom Theme JavaScript -->
    <script src="/admin/dist/js/sb-admin-2.js"></script>

</body>

</html>