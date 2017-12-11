<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<%@ include file="/WEB-INF/jsp/basicInclude.jsp" %>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<meta http-equiv="Expires" content="Mon, 06 Jan 1990 00:00:01 GMT">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">

</head>
<body onload="javascript:end()">
<form id="kmcis_form" name="kmcis_form" method="post">
	<input type="hidden"	name="rec_cert"		id="rec_cert"	value="${rec_cert}"/>
	<input type="hidden"	name="certNum"		id="certNum"	value="${certNum}"/>
</form>

<script type="text/javascript">
	var move_page_url = "http://110.10.189.24:9090/web/resultCrt";

	function end() {
		var UserAgent = navigator.userAgent;
		
		// 결과 페이지 경로 셋팅
		document.kmcis_form.action = move_page_url;
		
		/* 모바일 접근 체크*/
		// 모바일일 경우 (변동사항 있을경우 추가 필요)
		if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
			document.kmcis_form.submit();
		} 
		
		// 모바일이 아닐 경우
		else {
			document.kmcis_form.target = opener.window.name;
			document.kmcis_form.submit();
			self.close();
		}
	}
</script>
</body>
</html>