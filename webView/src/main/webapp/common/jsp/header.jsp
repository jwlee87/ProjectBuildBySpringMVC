<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "kr.co.kingofday.domain.Member" %>
<%@ page import="kr.co.kingofday.common.FormatUtil" %>

<!-- 로고 시작 -->
<div class="wrap">
	<div class="logo">
	
	
	<table border="0px">
	<tr><td>
	
	<a href="/index.jsp">
		<img id="header-logo" src="/resources/images/logo.png"/></a>
	</td>
	<td>
		<c:if test='${!empty sessionScope.login.id}'>
		<table id="memberInfo" border="0px" style="text-align: right;">
			<tr>
				<td id="nick" colspan="2" ><a href="/account/myInfo.jsp">
				<span style="color:black;">${sessionScope.login.nickName}님</span></a> 환영합니다. </td>
				<td id="logout" rowspan="2"><a href="/login/logout">
				<img id="logoutBtnImg" src="/resources/images/logoutBtn1.png"/>
				</a></td>
			</tr>
			<tr>
				<td width="47%">랭킹 <a href="#"><span>${FormatUtil.number(12345678, '#,##0')}</span></a>
					<span style="color:black">위</span></td>
				<td width="53%">포인트 <a href="#">
				<span id="webPoint">${FormatUtil.number(webPoint, '#,##0')}점</span></a></td>
			</tr>
		</table>
		</c:if>
	</td>	
	</tr>		
	</table>
		
	</div>
		
</div>
<!-- 로고 종료 -->
<!-- 네비바 시작 -->
<div class="menu">
<div class="container">
<div class="navibar-con">
<ul>
	<li><a href="/index.jsp"><img style="height:17px; width:22px; " src="/resources/images/home.png"/></a></li>
	<li class="dropdown"><a href="#" class="dropbtn"><span>카지노</span></a>
	<div class="dropdown-content" id="dropdown-casino">
		<div class="list">
		<a href="#"><span>바카라</span></a>
		<a href="#"><span>룰렛</span></a>
		<a href="#"><span>슬롯</span></a>
		<a href="#"><span>홀덤</span></a>
		<a href="#"><span>블랙잭</span></a>
		</div>
	</div>
	</li>
	<li class="dropdown"><a href="#" class="dropbtn"><span>스포츠</span></a>
	<div class="dropdown-content" id="dropdown-sport">
		<div class="list">
		<a href="#"><span>축구</span></a>
		<a href="#"><span>농구</span></a>
		<a href="#"><span>야구</span></a>
		<a href="#"><span>배구</span></a>
		<a href="#"><span>E-스포츠</span></a>
		</div>
	</div>
	</li>
	<li class="dropdown"><a href="#" class="dropbtn"><span>미니게임</span></a>
	<div class="dropdown-content" id="dropdown-mini">
		<div class="list">
		<a href="#"><span>사다리</span></a>
		<a href="#"><span>몽키게임</span></a>
		</div>
	</div>
	</li>
	<li class="dropdown"><a href="#" class="dropbtn"><span>FUN갤러리</span></a>
	<div class="dropdown-content" id="dropdown-fun">
	<div class="list">
		<a href="#"><span>이미지</span></a>
		<a href="#"><span>웃긴 이야기</span></a>
		<a href="#"><span>자유토크</span></a>
		<a href="#"><span>사회 이슈</span></a>
		<a href="#"><span>후기</span></a>
		</div>
	</div>
	</li>
	<li><a href="#"><span>공지</span></a></li>
</ul>
</div>
</div>
</div>
<!-- 네비바 종료 -->
