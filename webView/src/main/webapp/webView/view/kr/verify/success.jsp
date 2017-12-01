<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <c:if test="${adult eq 'true'}">
        <h1>성인 인증이 완료되었습니다. 게임으로 돌아가 주세요!</h1>
    </c:if>
    <c:if test="${adult eq 'false'}">
        <h1>미성년자는 게임을 이용하실 수 없습니다.</h1>
    </c:if>
</body>
</html>