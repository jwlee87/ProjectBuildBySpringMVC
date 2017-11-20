<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.co.kingofday.common.FormatUtil" %>
<%
	request.setAttribute("price", 1223232345L);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>EL 함수 호출</title>
</head>
<body>

가격은 <b>${FormatUtil.number(price, '#,##0')}</b>원 입니다.

</body>
</html>