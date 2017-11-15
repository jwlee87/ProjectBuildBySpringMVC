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
<body>
<!-- 본인인증서비스 요청 form --------------------------->
<form name="reqKMCISForm" method="post" action="#">
    <input type="hidden" name="tr_cert"     value = "${tr_cert}">
    <input type="hidden" name="tr_url"      value = "${tr_url}">
    <input type="hidden" name="tr_add"      value = "${tr_add}">	
    <input type="submit" value="본인인증"  onclick= "javascript:openKMCISWindow();">
</form>

<script language=javascript>

window.name = "kmcis_web_sample";

var KMCIS_window;

function openKMCISWindow(){

	var UserAgent = navigator.userAgent;
	/* 모바일 접근 체크*/
	// 모바일일 경우 (변동사항 있을경우 추가 필요)
	if (UserAgent.match(/iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
		document.reqKMCISForm.target = '';
	} 

	// 모바일이 아닐 경우
	else {
		KMCIS_window = window.open('', 'KMCISWindow', 'width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250' );

		if(KMCIS_window == null){
			alert(" ※ 윈도우 XP SP2 또는 인터넷 익스플로러 7 사용자일 경우에는 \n    화면 상단에 있는 팝업 차단 알림줄을 클릭하여 팝업을 허용해 주시기 바랍니다. \n\n※ MSN,야후,구글 팝업 차단 툴바가 설치된 경우 팝업허용을 해주시기 바랍니다.");
		}

		document.reqKMCISForm.target = 'KMCISWindow';
	}
	document.reqKMCISForm.action = 'https://www.kmcert.com/kmcis/web/kmcisReq.jsp';
	document.reqKMCISForm.submit();
}
</script>

</body>
</html>