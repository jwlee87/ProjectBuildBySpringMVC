<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kr.co.playground.common.FormatUtil" %>
<!-- 푸터 시작 -->
<footer>
	<div class="footer-head">
<div class="fcon-1">
	<div class="col-1"><div class="headtxt">
		<a href="#">
		<span>이벤트</span></a></div>
	</div>
	<div class="col-2"><div class="headtxt">
		<a href="#">
		<span>공지사항</span></a></div>
	</div>
	<div class="col-3"><div class="headtxt">
		<span>검색</span></div>
	</div>
</div>
</div>
	<div class="footer-body">
<div class="fcon-2">
	<div class="event">
	<div class="slidebox">
	
	<div class="slideshow-container">
	<div class="mySlides fade">
		<a href="#">
		<img src="/resources/images/event/event1.png" alt="slide-1"></a>
	</div>
	<div class="mySlides fade">
		<a href="#">
		<img src="/resources/images/event/event2.png" alt="slide-2"></a>
	</div>
	<div class="mySlides fade">
		<a href="#">
		<img src="/resources/images/event/event3.png" alt="slide-3"></a>
	</div>
	</div>
	
	<div style="display: none;">
		<span class="dot"></span> 
		<span class="dot"></span> 
		<span class="dot"></span> 
	</div></div></div>

	<div class="notice">
	<table>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용공지내용</span></a></div></td>
			<td class="notice-date">2017-09-19</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
		<tr>
			<td class="notice-cnt">
			<div><a href="#">
			<span>공지내용</span></a></div></td>
			<td class="notice-date">date</td>
		</tr>
	</table>
	</div>
	<!-- 검색 시작 -->
	<div class="search">
		<div class="searchimg"><img src="/resources/images/msearchtitle.png" alt="searchtitle"></div>
		<div class="searchbar">
		<form action="검색컨트롤러를 타라!">
		<input onfocusout="focusOut()" type="text" value="" id="search" name="search" placeholder="검색어를 입력하세요."></form></div>
		<div class="siteinfo"><table>
			<%-- <tr><td class="info-name"><span>Today</span></td><td class="info-value"><span id="counting">1</span></td></tr>
			<tr><td class="info-name"><span>Member</span></td><td class="info-value"><span>${memberSize}</span></td></tr> --%>
			<tr><td colspan="2" class="info-today" style="width:200px;"><p id="infoToday"/></td></tr></table>
		</div>
	</div>
</div>
</div>
<div class="footer-foot">
<div class="footcon">
	<div class="fcol-1">
		<div class="fmessage"><p>Hello. welcome to Adult playground!!!</p></div>
	</div>
	<div class="fcol-2">
	<div class="btn-group" style="float: right;">
	
	<c:if test='${empty sessionScope.login.id}'>
		<a href="/account/loginForm.jsp"><button class="button">로그인</button></a>
		<a href="/account/clickWrap.jsp"><button class="button">회원가입</button></a>
		<a href="/account/findPassword.jsp"><button class="button">계정찾기</button></a>
	</c:if>
	<c:if test='${!empty sessionScope.login.id }'>
		<a href="/account/myInfo.jsp"><button class="button">&nbsp;내정보 &nbsp;</button></a>
		<a href="영상관"><button class="button">&nbsp;영상관&nbsp;</button></a>
		<a href="채팅하기"><button class="button">채팅하기</button></a>
		<a href="/login/logout"><button class="button">로그아웃</button></a>
	</c:if>
	</div>
	</div>
</div>
</div>

</footer>
<!-- 푸터 종료 -->